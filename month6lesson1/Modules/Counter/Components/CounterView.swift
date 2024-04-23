//
//  CounterView.swift
//  month6lesson1
//
//  Created by Telegey Nurbekova on 22/04/24.
//

import UIKit

protocol CounterViewDelegate: AnyObject {
    func increaseTap()
    func decreaseTap()
}

class CounterView: BaseView {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let decreaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("Уменьшить", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let increaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("Увеличить", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    weak var delegate: CounterViewDelegate?
    
    override func setUp() {
        super.setUp()
        stackView.backgroundColor = .gray
        stackView.layer.cornerRadius = 16
        
        decreaseButton.addTarget(
            self,
            action: #selector(decreaseTap),
            for: .touchUpInside
        )
        
        increaseButton.addTarget(
            self,
            action: #selector(increaseTap),
            for: .touchUpInside
        )
    }
    
    override func setUpSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(decreaseButton)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(increaseButton)
        
    }
    
    override func setUpConstraints() {
        super.setUpConstraints()
        NSLayoutConstraint.activate(
            [
                stackView.topAnchor.constraint(equalTo: topAnchor),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ]
        )
    }
    
    @objc
    private func decreaseTap() {
        delegate?.decreaseTap()
    }
    
    @objc
    private func increaseTap() {
        delegate?.increaseTap()
    }
    
    func fill(with item: CounterModel) {
        titleLabel.text = String(item.number)
    }
}
