//
//  CounterViewController.swift
//  month6lesson1
//
//  Created by Telegey Nurbekova on 22/04/24.
//

import UIKit

class CounterViewController: UIViewController {
    
    private let counterView: CounterView = {
        let view = CounterView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var counter = CounterModel(number: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUp()
        counterView.delegate = self
    }
    
    func setUp() {
        setUpSubviews()
        setUpConstraints()
    }
    
    func setUpSubviews() {
        view.addSubview(counterView)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate(
            [
                counterView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                counterView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                counterView.heightAnchor.constraint(equalToConstant: 56),
                counterView.widthAnchor.constraint(equalToConstant: 250)
            ]
        )
    }
}

extension CounterViewController: CounterViewDelegate {
    func decreaseTap() {
        counter.number -= 1
        counterView.fill(with: counter)
    }
    
    func increaseTap() {
        counter.number += 1
        counterView.fill(with: counter)
    }
}
