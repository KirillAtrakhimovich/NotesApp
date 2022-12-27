//
//  NotesTableViewCell.swift
//  Notes
//
//  Created by Kirill Atrakhimovich on 21.12.22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    static let identifier = "NotesTableViewCell"

    let label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        isUserInteractionEnabled = true
        selectionStyle = .none
        contentView.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupView() {
        self.addSubview(label)
        label.snp.makeConstraints { constraints in
            constraints.top.bottom.trailing.leading.equalTo(safeAreaLayoutGuide)
        }    
    }
}
