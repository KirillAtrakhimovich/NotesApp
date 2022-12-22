//
//  NotesViewController.swift
//  Notes
//
//  Created by Kirill Atrakhimovich on 21.12.22.
//

import UIKit

final class NotesViewController: UIViewController {
    private let notesView = NotesView()
 
    override func loadView() {
    view = notesView
}

    override func viewDidLoad() {
        super.viewDidLoad()
        notesView.setup()
        navigationBarSettings()
        setupTableSettings()
    }
    
    func navigationBarSettings() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.yellow
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
        navigationController?.navigationBar.topItem?.title = "Notes"

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"),
                                                                 style: .done,
                                                                 target: self,
                                                                 action: #selector(self.addNote(sender:)))
        self.navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @objc func addNote(sender: UIBarButtonItem) {
        navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: true)
    }
    
    private func setupTableSettings() {
        notesView.tableView.dataSource = self
        notesView.tableView.delegate = self
    }
    
}

extension NotesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NotesTableViewCell.identifier,
                                                       for: indexPath) as? NotesTableViewCell else {
            return UITableViewCell()
        }
        var content = cell.defaultContentConfiguration()
        
        content.image = UIImage(systemName: "star")
        content.text = "123321"
        
        content.imageProperties.tintColor = .purple

        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

