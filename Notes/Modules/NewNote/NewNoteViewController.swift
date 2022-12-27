//
//  NewNoteViewC.swift
//  Notes
//
//  Created by Kirill Atrakhimovich on 22.12.22.
//

import UIKit

final class NewNoteViewController: UIViewController {
    
    private let persist: PersistenceManager = CoreDataManager()
    private let newNoteView = NewNoteView()
    private let noteModel: NoteModel
    
    override func loadView() {
        view = newNoteView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDelegates()
        setupUI()
        setupButtons()
    }
    
    init(noteModel: NoteModel) {
        self.noteModel = noteModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func boldButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        noteModel.note.noteFont.isBold = sender.isSelected
        updateTextViewFont()
    }
    
    @objc func cursiveButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        noteModel.note.noteFont.isCursive = sender.isSelected
        updateTextViewFont()
    }
    
    @objc func fontButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected {
            newNoteView.showFontPicker()
        } else {
            newNoteView.hideFontPicker()
        }
    }
    
    @objc func saveButtonTapped() {
        noteModel.note.noteItem.noteTitle = newNoteView.textField.text ?? ""
        noteModel.note.noteItem.note = newNoteView.textView.text ?? ""
        persist.saveNote(item: noteModel.note)
        navigationController?.popViewController(animated: true)
    }
    
    private func setupUI() {
        newNoteView.setup()
        newNoteView.textField.text = noteModel.note.noteItem.noteTitle
        newNoteView.textView.text = noteModel.note.noteItem.note
        newNoteView.boldButton.isSelected = noteModel.note.noteFont.isBold
        newNoteView.cursiveButton.isSelected = noteModel.note.noteFont.isCursive
        newNoteView.fontPicker.selectRow(noteModel.fontList.count / 2, inComponent: 0, animated: true)
        newNoteView.fontPicker.selectRow(noteModel.sizeList.count / 2, inComponent: 1, animated: true)
        setupNavigationBar()
        updateTextViewFont()
    }

    private func setupButtons() {
        newNoteView.boldButton.addTarget(self,
                                         action: #selector(boldButtonTapped),
                                         for: .touchUpInside)
        
        newNoteView.cursiveButton.addTarget(self,
                                            action: #selector(cursiveButtonTapped),
                                            for: .touchUpInside)
        
        newNoteView.fontButton.addTarget(self,
                                            action: #selector(fontButtonTapped),
                                            for: .touchUpInside)
    }

    private func setupDelegates() {
        newNoteView.fontPicker.delegate = self
        newNoteView.fontPicker.dataSource = self
    }
    
    private func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = #colorLiteral(red: 0.985483706, green: 0.782181717, blue: 0.1879348722, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
        navigationItem.backButtonTitle = ""
        navigationItem.title = "New note"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Save",
                                                                      style: .done, target: self,
                                                                      action: #selector(saveButtonTapped))
    }
    
    private func updateTextViewFont() {
        newNoteView.textView.font = noteModel.note.noteFont.completeFont
    }
}

extension NewNoteViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return noteModel.fontList.count
        case 1:
            return noteModel.sizeList.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return noteModel.fontList[row].name
        case 1:
            return noteModel.sizeList[row].name
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            noteModel.note.noteFont.font = noteModel.fontList[row].value
        case 1:
            noteModel.note.noteFont.size = noteModel.sizeList[row].value
        default:
            break
        }
        updateTextViewFont()
    }
}
