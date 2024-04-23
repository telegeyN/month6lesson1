//
//  HomeView.swift
//  month6lesson1
//
//  Created by Telegey Nurbekova on 23/04/24.
//

import UIKit

class HomeView: BaseView {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        label.backgroundColor = .init(hex: "#F5F5F5")
        label.layer.cornerRadius = 12
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.lightGray.cgColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        label.backgroundColor = .init(hex: "#F5F5F5")
        label.layer.cornerRadius = 12
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.lightGray.cgColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setUp() {
        super.setUp()
    }
    
    override func setUpSubviews() {
        super.setUpSubviews()
        addSubview(nameLabel)
        addSubview(phoneNumberLabel)
    }
    
    override func setUpConstraints() {
        super.setUpConstraints()
        NSLayoutConstraint.activate(
            [
                nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 250),
                nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
                nameLabel.heightAnchor.constraint(equalToConstant: 46),
                
                phoneNumberLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 22),
                phoneNumberLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                phoneNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                phoneNumberLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
                phoneNumberLabel.heightAnchor.constraint(equalToConstant: 46)
            ]
        )
    }
    
    func fill(with item: PersonInfoModel) {
        nameLabel.text = " Имя пользователя: \(item.name)"
        phoneNumberLabel.text = " Номер телефона: \(item.phoneNumber)"
    }
}
