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
    
    public let emailTextField: UITextField = UITextField()
    public let emailView: UIView = UIView()
    public let passwordTextField: UITextField = UITextField()
    public let passwordView: UIView = UIView()
    public let buttonToEnterprise: UIButton = UIButton()
    
    let loadingContainer = UIView()
    let elipseInter = UIImageView()
    let elipseExt = UIImageView()
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
        backgroundColor = .white
        
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
