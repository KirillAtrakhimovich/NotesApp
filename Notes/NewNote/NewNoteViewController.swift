//
//  NewNoteViewC.swift
//  Notes
//
//  Created by Kirill Atrakhimovich on 22.12.22.
//

import UIKit
import CoreData

class NewNoteViewController: UIViewController {
    
    private let persist = PersistenceManager()
    private let newNoteView = NewNoteView()
    private var noteModel: NoteModel
    
    override func loadView() {
        view = newNoteView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        newNoteView.setup()
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = #colorLiteral(red: 0.985483706, green: 0.782181717, blue: 0.1879348722, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
        navigationItem.backButtonTitle = "Back"
        navigationController?.navigationItem.backButtonTitle = "434"
        navigationItem.title = "New note"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Save",
                                                                      style: .done, target: self,
                                                                      action: #selector(saveButtonTapped))
        newNoteView.textField.text = noteModel.note?.noteTitle
        newNoteView.textView.text = noteModel.note?.note
        
        newNoteView.boldButton.addTarget(self,
                                         action: #selector(boldButtonTapped),
                                         for: .touchUpInside)
        
        newNoteView.cursiveButton.addTarget(self,
                                            action: #selector(cursiveButtonTapped),
                                            for: .touchUpInside)
        
        newNoteView.fontButton.addTarget(self,
                                            action: #selector(fontButtonTapped),
                                            for: .touchUpInside)
        
        newNoteView.fontPicker.delegate = self
        newNoteView.fontPicker.dataSource = self
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
        if sender.isSelected {
            newNoteView.textView.font = UIFont(name: "HelveticaNeue-Bold", size: 19.0)
        } else {
            newNoteView.textView.font = UIFont.systemFont(ofSize: 19)
        }
    }
    
    @objc func cursiveButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected {
            newNoteView.textView.font = UIFont.italicSystemFont(ofSize: 19)
        } else {
            newNoteView.textView.font = UIFont.systemFont(ofSize: 19)
        }
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

        let newNote = NoteItem(id: UUID(),
                               noteTitle: newNoteView.textField.text ?? "",
                               note: newNoteView.textView.text ?? "")
        persist.saveNote(item: newNote)
        navigationController?.popViewController(animated: true)
    }
    
    private func updateTextViewFont() {
        let newSize = noteModel.selectedSize.value
        let newFont = noteModel.selectedFont.value.withSize(newSize)
        newNoteView.textView.font = newFont
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
            noteModel.selectedFont = noteModel.fontList[row]
        case 1:
            noteModel.selectedSize = noteModel.sizeList[row]
        default:
            break
        }
        updateTextViewFont()
    }
}
