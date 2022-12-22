//
//  AddingNoteView.swift
//  Notes
//
//  Created by Kirill Atrakhimovich on 22.12.22.
//

import UIKit

class NewNoteView: UIView {
    
    let textField: UITextField = {
        let textfield = UITextField()
        textfield.textColor = .black
        textfield.placeholder = "Title"
        textfield.font = UIFont(name: "HelveticaNeue-Bold", size: 19.0)
        return textfield
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        textView.layer.cornerRadius = 15
        textView.font = UIFont.systemFont(ofSize: 15)
        return textView
    }()
    
     func setup() {
        backgroundColor = .white
        setupTextField()
        setupTextView()
    }
    
    private func setupTextField() {
        self.addSubview(textField)
        textField.snp.makeConstraints { constraints in
            constraints.top.equalTo(safeAreaLayoutGuide).offset(10)
            constraints.leading.equalToSuperview().offset(5)
            constraints.trailing.equalToSuperview().offset(-5)
        }
    }
    
    private func setupTextView() {
        self.addSubview(textView)
        textView.snp.makeConstraints { constraints in
            constraints.top.equalTo(textField.snp.bottom).offset(20)
            constraints.leading.equalToSuperview().offset(10)
            constraints.trailing.equalToSuperview().offset(-10)
            constraints.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
   
    
}
