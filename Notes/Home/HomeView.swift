//
//  NotesView.swift
//  Notes
//
//  Created by Kirill Atrakhimovich on 21.12.22.
//

import UIKit
import SnapKit

final class HomeView: UIView {
    
    var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.barStyle = .black
        searchBar.layer.cornerRadius = searchBar.frame.height / 2
        searchBar.placeholder = "Search notes"
        searchBar.searchBarStyle = .minimal
        searchBar.barTintColor = .white
        if let textField = searchBar.value(forKey: "searchField") as? UITextField,
            let iconView = textField.leftView as? UIImageView {
            textField.tintColor = .black
            textField.textColor = .black
            iconView.image = iconView.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        }
        return searchBar
    }()
    
    private(set) var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.white
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        tableView.separatorColor = .black
        return tableView
    }()
    
    func setup() {
        setupSearchBar()
        setupTableView()
        backgroundColor = .white
    }
    private func setupSearchBar() {
        self.addSubview(searchBar)
        searchBar.snp.makeConstraints { constraints in
            constraints.top.equalTo(safeAreaLayoutGuide)
            constraints.leading.equalToSuperview().offset(5)
            constraints.trailing.equalToSuperview().offset(-5)
        }
    }
    
    private func setupTableView() {
        self.addSubview(tableView)
        tableView.snp.makeConstraints { constraints in
            constraints.top.equalTo(searchBar.snp.bottom).offset(10)
            constraints.leading.equalToSuperview().offset(20)
            constraints.trailing.equalToSuperview().offset(-20)
            constraints.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
}
