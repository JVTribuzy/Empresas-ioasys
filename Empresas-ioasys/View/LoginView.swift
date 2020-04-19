//
//  LoginView.swift
//  Empresas-ioasys
//
//  Created by João Tribuzy on 17/04/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit
import Stevia

class LoginView: UIView{
    
    var model: UserModelController = {
        return UserModelController.shared
    }()
    
    private override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.autolayout()
        self.style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {}
    
    public let emailTextField: UITextField = UITextField()
    public let emailView: UIView = UIView()
    public let passwordTextField: UITextField = UITextField()
    public let passwordView: UIView = UIView()
    public let buttonToEnterprise: UIButton = UIButton()
}

extension LoginView: IoasyCustomView{
    
    func autolayout() {
        
        subviews(emailView.subviews(emailTextField),passwordView.subviews(passwordTextField),buttonToEnterprise)
        
        passwordView.right(16).left(16).height(40).centerVertically()
    
        emailView.right(16).left(16).height(40).top(200)
        emailView.Bottom == passwordView.Top - 40
        
        emailTextField.right(16).left(16).centerVertically()
        passwordTextField.right(16).left(16).centerVertically()
        
        // buttonToEnterprise
        buttonToEnterpriseTarget()
        buttonToEnterprise.Top == passwordView.Bottom + 16
        buttonToEnterprise.height(50).right(30).left(30)
    }
    
    func style() {
        // buttonToEnterprise
        buttonToEnterprise.text(("entra").uppercased())
        buttonToEnterprise.backgroundColor = UIColor.ioasysLoginButtonColor
        
        emailTextField.textAlignment = .left
        emailTextField.font = UIFont(name: "Rubik-Regular", size: 18)
        emailTextField.textColor = UIColor.ioasysSearchBarTextColor
        emailTextField.tintColor = UIColor.ioasysSearchTintColor
        emailTextField.placeholder = NSLocalizedString("e-mail", comment: "")
        
        passwordTextField.textAlignment = .left
        passwordTextField.font = UIFont(name: "Rubik-Regular", size: 18)
        passwordTextField.textColor = UIColor.ioasysSearchBarTextColor
        passwordTextField.tintColor = UIColor.ioasysSearchTintColor
        passwordTextField.placeholder = NSLocalizedString("password", comment: "")
        
        emailView.backgroundColor = UIColor.ioasysSearchBarColor
        
        passwordView.backgroundColor = UIColor.ioasysSearchBarColor
    }
}

extension LoginView{
    private func buttonToEnterpriseTarget(){
        buttonToEnterprise.addTarget(self, action: #selector(goToEnterpriseViewController), for: .touchUpInside)
    }
    @objc private func goToEnterpriseViewController(){
        model.getAuthentication(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
    }
}
