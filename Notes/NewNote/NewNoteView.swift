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
    
    let buttonsView: UIStackView = {
        let buttonsView = UIStackView()
        buttonsView.spacing = 10
        buttonsView.axis = .horizontal
        buttonsView.alignment = .fill
        return buttonsView
    }()
    
    let boldButton: UIButton = {
        let button = UIButton()
        button.setTitle("Bold", for: .normal)
        button.configuration = UIButton.Configuration.plain()
        return button
    }()
    
    let cursiveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cursive", for: .normal)
        button.configuration = UIButton.Configuration.plain()
        return button
    }()
    
    let fontButton: UIButton = {
        let button = UIButton()
        button.setTitle("Font", for: .normal)
        button.configuration = UIButton.Configuration.plain()
        return button
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        textView.layer.cornerRadius = 15
        textView.font = UIFont.systemFont(ofSize: 15)
        return textView
    }()
    
    let fontPicker: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    func setup() {
        backgroundColor = .white
        setupTextField()
        setupButtonsView()
        setupTextView()
        setupButtons()
    }
    
    func showFontPicker() {
        self.addSubview(fontPicker)
        fontPicker.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().inset(20)
        }
    }
    
    func hideFontPicker() {
        fontPicker.removeFromSuperview()
    }
    
    private func setupTextField() {
        self.addSubview(textField)
        textField.snp.makeConstraints { constraints in
            constraints.top.equalTo(safeAreaLayoutGuide).offset(10)
            constraints.leading.equalToSuperview().offset(10)
            constraints.trailing.equalToSuperview().offset(-10)
        }
    }
    
    private func setupButtonsView() {
        self.addSubview(buttonsView)
        buttonsView.snp.makeConstraints { constraints in
            constraints.top.equalTo(textField.snp.bottom).offset(20)
            constraints.leading.equalToSuperview().offset(10)
            constraints.trailing.equalToSuperview().offset(-10)
        }
    }
    
    private func setupButtons() {
        buttonsView.addArrangedSubview(boldButton)
        buttonsView.addArrangedSubview(cursiveButton)
        buttonsView.addArrangedSubview(fontButton)
        cursiveButton.snp.makeConstraints { make in
            make.width.equalTo(boldButton.snp.width)
        }
        fontButton.snp.makeConstraints { make in
            make.width.equalTo(boldButton.snp.width)
        }
    }
    
    private func setupTextView() {
        self.addSubview(textView)
        textView.snp.makeConstraints { constraints in
            constraints.top.equalTo(buttonsView.snp.bottom).offset(20)
            constraints.leading.equalToSuperview().offset(10)
            constraints.trailing.equalToSuperview().offset(-10)
            constraints.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    
}
