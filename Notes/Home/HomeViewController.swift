//
//  NotesViewController.swift
//  Notes
//
//  Created by Kirill Atrakhimovich on 21.12.22.
//

import UIKit

final class HomeViewController: UIViewController {
    private let persist = PersistenceManager()
    private let homeView = HomeView()
    private var noteModel: NoteListModel?
    
    override func loadView() {
    view = homeView
}

    override func viewWillAppear(_ animated: Bool) {
        let notesList = persist.getNotes()
        noteModel = NoteListModel(notes: notesList, filteredNotes: notesList)
        homeView.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.setup()
        navigationBarSettings()
        setupTableSettings()
        setupSearchBarSettings()
        let notesList = persist.getNotes()
        noteModel = NoteListModel(notes: notesList, filteredNotes: notesList)
        homeView.tableView.reloadData()
    }
    
    func navigationBarSettings() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = #colorLiteral(red: 0.985483706, green: 0.782181717, blue: 0.1879348722, alpha: 1)
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
        navigationController?.pushViewController(NewNoteViewController(noteModel: .init()), animated: true)
    }
    
    private func setupTableSettings() {
        homeView.tableView.dataSource = self
        homeView.tableView.delegate = self
    }
    
    private func setupSearchBarSettings() {
        homeView.searchBar.delegate = self
        homeView.searchBar.returnKeyType = UIReturnKeyType.done
    }
    
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        noteModel?.filterNotes(with: searchText)
        homeView.tableView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteModel?.filteredNotes.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: HomeTableViewCell.identifier,
            for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        
        var content = cell.defaultContentConfiguration()

        content.image = UIImage(systemName: "star")
        content.text = noteModel?.filteredNotes[indexPath.row].noteTitle
        content.secondaryText = noteModel?.filteredNotes[indexPath.row].note
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let notesList = noteModel?.filteredNotes else { return }
        let noteVC = NewNoteViewController(noteModel: .init(note: notesList[indexPath.row]))
        navigationController?.pushViewController(noteVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView,
                   editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        guard let deleteNote = noteModel?.filteredNotes[indexPath.row] else { return }
        if editingStyle == .delete {
            tableView.beginUpdates()
            persist.delete(item: deleteNote)
            noteModel?.filteredNotes.remove(at: indexPath.row)
            noteModel?.notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            tableView.reloadData()
        }
    }
}
