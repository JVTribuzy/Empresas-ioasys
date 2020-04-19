//
//  LoginViewController.swift
//  Empresas-ioasys
//
//  Created by João Tribuzy on 16/04/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    var model: UserModelController = {
        return UserModelController.shared
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = LoginView()
        addNotifications()
    }
    
    deinit { NotificationCenter.default.removeObserver(self) }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension LoginViewController{
    private func addNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(gotToEnterpriseViewControllerNotificationReceived(_:)), name: .ioasysGoToEnterpriseViewController, object: nil)
    }
    
    @objc private func gotToEnterpriseViewControllerNotificationReceived(_ notification: Notification){
        let enterpriseViewController = EnterpriseViewController()
        enterpriseViewController.modalPresentationStyle = .fullScreen
        present(enterpriseViewController, animated: true)
    }
}
