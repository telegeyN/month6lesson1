//
//  AuthorizationViewController.swift
//  month6lesson1
//
//  Created by Telegey Nurbekova on 23/04/24.
//

import UIKit

class AuthorizationViewController: UIViewController {
    
    private let authorizationView: AuthorizationView = {
        let view = AuthorizationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        authorizationView.delegate = self
        setUp()
    }
    
    func setUp() {
        setUpSubviews()
        setUpConstraints()
    }
    
    func setUpSubviews() {
        view.addSubview(authorizationView)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate(
            [
                authorizationView.topAnchor.constraint(equalTo: view.topAnchor),
                authorizationView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                authorizationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                authorizationView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ]
        )
    }
}

extension AuthorizationViewController: AuthhorizationViewDelegate {
    
    func signInTap(with name: String, phoneNumber: String) {
        UserSessionManager.shared.saveSession(
            with: name,
            phoneNumber: phoneNumber
        )
        if UserSessionManager.shared.isDataCorrect == true {
            let vc = HomeViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
