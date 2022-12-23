//
//  NotesViewController.swift
//  Notes
//
//  Created by Kirill Atrakhimovich on 21.12.22.
//

import UIKit

final class HomeViewController: UIViewController {
    private let homeView = HomeView()
    private var models: [(noteTitle: String, note: String)] = []
    override func loadView() {
    view = homeView
}

    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.setup()
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
        
        navigationItem.backButtonTitle = "Back"
        navigationController?.navigationBar.tintColor = .black
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"),
                                                                 style: .done,
                                                                 target: self,
                                                                 action: #selector(self.addNote(sender:)))
        self.navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @objc func addNote(sender: UIBarButtonItem) {
        navigationController?.pushViewController(NewNoteViewController(), animated: true)
    }
    
    private func setupTableSettings() {
        homeView.tableView.dataSource = self
        homeView.tableView.delegate = self
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: HomeTableViewCell.identifier,
            for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        
        var content = cell.defaultContentConfiguration()
        
        content.image = UIImage(systemName: "star")
        content.text = models[indexPath.row].noteTitle
        content.secondaryText = models[indexPath.row].note
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "newNote") as? NewNoteViewController else { return }
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
