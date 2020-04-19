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
        
        addNotification()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {}
    
    private let topImageView: UIImageView = UIImageView()
    
    public let emailLabel: UILabel = UILabel()
    public let emailTextField: UITextField = UITextField()
    public let emailView: UIView = UIView()
    
    private let passwordLabel: UILabel = UILabel()
    public let passwordTextField: UITextField = UITextField()
    public let passwordView: UIView = UIView()
    
    public let buttonToEnterprise: UIButton = UIButton()
    
    let loadingContainer = UIView()
    let elipseInter = UIImageView()
    let elipseExt = UIImageView()
}

extension LoginView: IoasyCustomView{
    
    func autolayout() {
        
        subviews(topImageView, emailLabel, emailView.subviews(emailTextField), passwordLabel,passwordView.subviews(passwordTextField),buttonToEnterprise)
        
        topImageView.right(0).left(0).top(0).height(240)
        
        emailLabel.right(20).left(20).height(18)
        emailLabel.Top == topImageView.Bottom + 28

        emailView.right(16).left(16).height(40)
        emailView.Top == emailLabel.Bottom + 4
        emailTextField.right(16).left(16).centerVertically()
        
        passwordLabel.Top == emailView.Bottom + 16
        passwordLabel.right(20).left(20).height(18)
        
        passwordView.right(16).left(16).height(40)
        passwordView.Top == passwordLabel.Bottom + 4
        passwordTextField.right(16).left(16).centerVertically()

        buttonToEnterpriseTarget()
        buttonToEnterprise.Top == passwordView.Bottom + 40
        buttonToEnterprise.height(50).right(30).left(30)
    }
    
    func style() {
        backgroundColor = .white
        
        topImageView.image = UIImage(named: "loginTopImage")
        
        emailLabel.textAlignment = .left
        emailLabel.font = UIFont(name: "Rubik-Regular", size: 14)
        emailLabel.textColor = UIColor.ioasysSearchBarTextColor
        emailLabel.tintColor = UIColor.ioasysSearchTintColor
        emailLabel.text = NSLocalizedString("Email", comment: "")
        
        emailTextField.textAlignment = .left
        emailTextField.font = UIFont(name: "Rubik-Regular", size: 18)
        emailTextField.textColor = UIColor.ioasysSearchBarTextColor
        emailTextField.tintColor = UIColor.ioasysSearchTintColor
        emailTextField.placeholder = NSLocalizedString("", comment: "")
        
        passwordLabel.textAlignment = .left
        passwordLabel.font = UIFont(name: "Rubik-Regular", size: 14)
        passwordLabel.textColor = UIColor.ioasysSearchBarTextColor
        passwordLabel.tintColor = UIColor.ioasysSearchTintColor
        passwordLabel.text = NSLocalizedString("Senha", comment: "")
        
        passwordTextField.textAlignment = .left
        passwordTextField.font = UIFont(name: "Rubik-Regular", size: 18)
        passwordTextField.textColor = UIColor.ioasysSearchBarTextColor
        passwordTextField.tintColor = UIColor.ioasysSearchTintColor
        passwordTextField.placeholder = NSLocalizedString("", comment: "")
        
        emailView.backgroundColor = UIColor.ioasysSearchBarColor
        emailView.layer.cornerRadius = 4
        
        passwordView.backgroundColor = UIColor.ioasysSearchBarColor
        passwordView.layer.cornerRadius = 4
        
        buttonToEnterprise.text((NSLocalizedString("entrar", comment: "")).uppercased())
        buttonToEnterprise.backgroundColor = UIColor.ioasysLoginButtonColor
        buttonToEnterprise.titleLabel?.font = UIFont(name: "Rubik-Medium", size: 16)
        buttonToEnterprise.layer.cornerRadius = 8
    }
}

extension LoginView{
    private func buttonToEnterpriseTarget(){
        buttonToEnterprise.addTarget(self, action: #selector(goToEnterpriseViewController), for: .touchUpInside)
    }
    @objc private func goToEnterpriseViewController(){
        showActivityIndicatory()
        model.getAuthentication(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
    }
}

extension LoginView{
    func addNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(hideActivityIndicator), name: .ioasysHideFullScreenActivityIndicator, object: nil)
    }
    
    private func showActivityIndicatory() {
        self.subviews(loadingContainer)
        loadingContainer.left(0).top(0).right(0).bottom(0)
        loadingContainer.backgroundColor = UIColor().UIColorFromHex(rgbValue: 0x000000, alpha: 0.7)
        
        loadingContainer.subviews(elipseInter)
        elipseInter.height(47).width(47).centerInContainer()
        elipseInter.image = UIImage(named: "elipse-intern")
        
        loadingContainer.subviews(elipseExt)
        elipseExt.height(72).width(72).centerInContainer()
        elipseExt.image = UIImage(named: "elipse-ext")
    
        rotateRight(imageView: elipseInter, aCircleTime: 0.8)
        rotateLeft(imageView: elipseExt, aCircleTime: 0.8)
    }
    
    @objc private func hideActivityIndicator() {
        elipseInter.layer.removeAllAnimations()
        elipseExt.layer.removeAllAnimations()
        loadingContainer.removeFromSuperview()
    }
    
    func rotateRight(imageView: UIImageView, aCircleTime: Double) { //UIView
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = Double.pi * 2 //Minus can be Direction
        rotationAnimation.duration = aCircleTime
        rotationAnimation.repeatCount = .infinity
        imageView.layer.add(rotationAnimation, forKey: nil)
    }
    
    func rotateLeft(imageView: UIImageView, aCircleTime: Double) { //UIView
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = -Double.pi * 2 //Minus can be Direction
        rotationAnimation.duration = aCircleTime
        rotationAnimation.repeatCount = .infinity
        imageView.layer.add(rotationAnimation, forKey: nil)
    }
}
