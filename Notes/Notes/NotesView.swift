//
//  NotesView.swift
//  Notes
//
//  Created by Kirill Atrakhimovich on 21.12.22.
//

import UIKit
import SnapKit

final class NotesView: UIView {
    
    private(set) var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.white
        tableView.register(NotesTableViewCell.self, forCellReuseIdentifier: NotesTableViewCell.identifier)
        tableView.separatorColor = .black
        return tableView
    }()
    
    func setup() {
        setupTableView()
        backgroundColor = .white
    }
    
    private func setupTableView() {
        self.addSubview(tableView)
        tableView.snp.makeConstraints { constraints in
            constraints.top.equalTo(safeAreaLayoutGuide).offset(10)
            constraints.leading.equalToSuperview().offset(20)
            constraints.trailing.equalToSuperview().offset(-20)
            constraints.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
}
