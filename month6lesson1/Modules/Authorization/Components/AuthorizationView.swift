//
//  AuthorizationView.swift
//  month6lesson1
//
//  Created by Telegey Nurbekova on 23/04/24.
//

import UIKit

protocol AuthhorizationViewDelegate: AnyObject {
    func signInTap(with name: String, phoneNumber: String)
}

class AuthorizationView: BaseView {
    
    private let nameTextField: UITextField = {
        let field = UITextField()
        field.font = .systemFont(ofSize: 16)
        field.backgroundColor = .init(hex: "#F5F5F5")
        field.placeholder = "Введите ваше имя"
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.translatesAutoresizingMaskIntoConstraints = false
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 8))
        field.leftView = view
        field.leftViewMode = .always
        return field
    }()
    
    private let phoneNumberTextField: UITextField = {
        let field = UITextField()
        field.font = .systemFont(ofSize: 16)
        field.backgroundColor = .init(hex: "#F5F5F5")
        field.placeholder = "Введите ваш номер телефона"
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.translatesAutoresizingMaskIntoConstraints = false
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 8))
        field.leftView = view
        field.leftViewMode = .always
        return field
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .init(hex: "#4682B4")
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    weak var delegate: AuthhorizationViewDelegate?
    
    override func setUp() {
        super.setUp()
        signInButton.addTarget(
            self,
            action: #selector(signInTap),
            for: .touchUpInside
        )
    }
    
    override func setUpSubviews() {
        super.setUpSubviews()
        addSubview(nameTextField)
        addSubview(phoneNumberTextField)
        addSubview(signInButton)
    }
    
    override func setUpConstraints() {
        super.setUpConstraints()
        NSLayoutConstraint.activate(
            [
                nameTextField.topAnchor.constraint(equalTo: topAnchor, constant: 250),
                nameTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
                nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
                nameTextField.heightAnchor.constraint(equalToConstant: 46),
                
                phoneNumberTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 22),
                phoneNumberTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
                phoneNumberTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                phoneNumberTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
                phoneNumberTextField.heightAnchor.constraint(equalToConstant: 46),
                
                signInButton.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 42),
                signInButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                signInButton.widthAnchor.constraint(equalToConstant: 150),
                signInButton.heightAnchor.constraint(equalToConstant: 46)
            ]
        )
    }
    
    @objc
    private func signInTap() {
        guard
            let name = nameTextField.text, !name.isEmpty,
            let phoneNumber = phoneNumberTextField.text, !phoneNumber.isEmpty
        else {
            return
        }
        delegate?.signInTap(with: name, phoneNumber: phoneNumber)
    }
}
