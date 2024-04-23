//
//  HomeViewController.swift
//  month6lesson1
//
//  Created by Telegey Nurbekova on 23/04/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let homeView: HomeView = {
        let view = HomeView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUp()
        homeView.fill(with: PersonInfoModel(name: "Geeks", phoneNumber: "00"))
    }
    
    func setUp() {
        setUpSubviews()
        setUpConstraints()
    }
    
    func setUpSubviews() {
        view.addSubview(homeView)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate(
            [
                homeView.topAnchor.constraint(equalTo: view.topAnchor),
                homeView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                homeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                homeView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ]
        )
    }
}
