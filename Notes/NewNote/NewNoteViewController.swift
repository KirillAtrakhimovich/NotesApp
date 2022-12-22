//
//  NewNoteViewC.swift
//  Notes
//
//  Created by Kirill Atrakhimovich on 22.12.22.
//

import UIKit

class NewNoteViewController: UIViewController {
    
    private let newNoteView = NewNoteView()
 
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
        
        
       
    }
}
