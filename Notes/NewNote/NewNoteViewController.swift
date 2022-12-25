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
    private var note: NewNoteModel?
    
    override func loadView() {
        view = newNoteView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        newNoteView.setup()
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.yellow
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
    }
    
    @objc func saveButtonTapped() {
//        newNoteView.textField.text = noteTitle
//        newNoteView.textView.text = noteContent
        let newNote = NewNoteModel(noteTitle: newNoteView.textField.text ?? "",
                                   note: newNoteView.textView.text ?? "")
        persist.saveNote(model: newNote)
        navigationController?.popViewController(animated: true)
    }
    
    private func createModel(note: [NotesData]) {
       
    }
    
    func completion(noteTitle: String, note: String) {
        
    }
}
