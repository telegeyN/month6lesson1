//
//  SplashViewController.swift
//  month6lesson1
//
//  Created by Telegey Nurbekova on 23/04/24.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if UserSessionManager.shared.isSessionActive {
            let vc = HomeViewController()
            vc.modalPresentationStyle = .fullScreen
            navigationController?.present(vc, animated: false)
        } else {
            let vc = AuthorizationViewController()
            vc.modalPresentationStyle = .fullScreen
            navigationController?.present(vc, animated: false)
        }
    }

}
