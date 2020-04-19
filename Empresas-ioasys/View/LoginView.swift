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

class LoginView: UIView, UITextFieldDelegate{
    
    var model: UserModelController = {
        return UserModelController.shared
    }()
    
    private override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.autolayout()
        self.style()
        
        addNotification()
        
        textFieldSettings()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {}
    
    private let topImageView: UIImageView = UIImageView()
    private let logoLogin: UIImageView = UIImageView()
    private let welcomeMessage: UILabel = UILabel()
    
    public let emailLabel: UILabel = UILabel()
    public let emailTextField: UITextField = UITextField()
    public let emailView: UIView = UIView()
    private let emailWrong: UIImageView = UIImageView()
    
    private let passwordLabel: UILabel = UILabel()
    public let passwordTextField: UITextField = UITextField()
    public let passwordView: UIView = UIView()
    private let visibilityButton: UIButton = UIButton()
    private let passwordWrong: UIImageView = UIImageView()
    
    private let wrongInput: UILabel = UILabel()
    
    public let buttonToEnterprise: UIButton = UIButton()
    
    let loadingContainer = UIView()
    let elipseInter = UIImageView()
    let elipseExt = UIImageView()
}

extension LoginView: IoasyCustomView{
    
    func autolayout() {
        
        subviews(topImageView.subviews(logoLogin, welcomeMessage), emailLabel, emailView.subviews(emailTextField, emailWrong), passwordLabel,passwordView.subviews(passwordTextField, visibilityButton, passwordWrong), wrongInput, buttonToEnterprise)
        
        topImageView.right(0).left(0).top(0).height(240)
        logoLogin.width(40).height(31.58).top(84).centerHorizontally()
        
        welcomeMessage.Top == logoLogin.Bottom + 16.42
        welcomeMessage.right(16).left(16).height(24)
        
        emailLabel.right(20).left(20).height(18)
        emailLabel.Top == topImageView.Bottom + 24

        emailView.right(16).left(16).height(48)
        emailView.Top == emailLabel.Bottom + 4
        emailTextField.right(16).left(16).centerVertically()
        emailWrong.width(20).height(20).right(13).centerVertically()
        
        passwordLabel.Top == emailView.Bottom + 16
        passwordLabel.right(20).left(20).height(18)
        
        passwordView.right(16).left(16).height(48)
        passwordView.Top == passwordLabel.Bottom + 4
        visibilityButton.width(22).height(15).right(13).centerVertically()
        visibilityButtonTarget()
        passwordTextField.left(16).centerVertically()
        passwordTextField.Right == visibilityButton.Left + 13
        passwordWrong.width(20).height(20).right(13).centerVertically()
        
        wrongInput.right(20).left(20).height(16)
        wrongInput.Top == passwordView.Bottom + 4

        buttonToEnterpriseTarget()
        buttonToEnterprise.Top == passwordView.Bottom + 40
        buttonToEnterprise.height(50).right(30).left(30)
    }
    
    func style() {
        backgroundColor = .white
        
        topImageView.image = UIImage(named: "loginTopImage")
        
        logoLogin.image = UIImage(named: "logo_login")
        
        welcomeMessage.textAlignment = .center
        welcomeMessage.font = UIFont(name: "Rubik-Regular", size: 20)
        welcomeMessage.textColor = .white
        welcomeMessage.text = NSLocalizedString("Seja bem vindo ao empresas!", comment: "")
        
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
        passwordTextField.isSecureTextEntry = true
        
        
        visibilityButton.setBackgroundImage(UIImage(named: "eye"), for: .normal)
        emailWrong.image = UIImage(named: "wrong")
        emailWrong.isHidden = true
        passwordWrong.image = UIImage(named: "wrong")
        passwordWrong.isHidden = true
        
        emailView.backgroundColor = UIColor.ioasysSearchBarColor
        emailView.layer.cornerRadius = 4
        emailView.layer.borderWidth = 1
        emailView.layer.borderColor = UIColor.ioasysSearchBarColor.cgColor
        
        passwordView.backgroundColor = UIColor.ioasysSearchBarColor
        passwordView.layer.cornerRadius = 4
        passwordView.layer.borderWidth = 1
        passwordView.layer.borderColor = UIColor.ioasysSearchBarColor.cgColor
        
        wrongInput.textAlignment = .right
        wrongInput.font = UIFont(name: "Rubik-Regular", size: 12)
        wrongInput.textColor = .red
        wrongInput.isHidden = true
        wrongInput.text = NSLocalizedString("Credenciais incorretas", comment: "")
        
        buttonToEnterprise.text((NSLocalizedString("entrar", comment: "")).uppercased())
        buttonToEnterprise.backgroundColor = UIColor.ioasysLoginButtonColor
        buttonToEnterprise.titleLabel?.font = UIFont(name: "Rubik-Medium", size: 16)
        buttonToEnterprise.layer.cornerRadius = 8
    }
}

extension LoginView{
    private func visibilityButtonTarget(){
        visibilityButton.addTarget(self, action: #selector(changePasswordVisibility), for: .touchUpInside)
    }
    
    @objc private func changePasswordVisibility(){
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    private func buttonToEnterpriseTarget(){
        buttonToEnterprise.addTarget(self, action: #selector(goToEnterpriseViewController), for: .touchUpInside)
    }
    @objc private func goToEnterpriseViewController(){
        showActivityIndicatory()
        model.getAuthentication(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
    func textFieldSettings(){
        emailTextField.returnKeyType = .next
        emailTextField.keyboardType = .emailAddress
        emailTextField.tag = 0
        emailTextField.delegate = self
        emailTextField.inputAccessoryView = nil
        
        passwordTextField.tag = 1
        passwordTextField.delegate = self
        passwordTextField.inputAccessoryView = nil
    
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return false
    }
}

extension LoginView{
    func addNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(hideActivityIndicator), name: .ioasysHideFullScreenActivityIndicator, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(wrongPassword), name: .ioasysWrongPassword, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
        
    @objc func keyboardWillShow(_ notification: Notification) {
        print("\n apareceu")
        reduceHeader()
        
    }

    @objc func keyboardWillHide(_ notification: Notification) {
        print("\n escondeu")
        resetHeader()
    }
    
    func resetHeader() {
        UIView.animate(withDuration: 1.0) {
            self.frame.origin.y = 0
            self.layoutIfNeeded()
            self.logoLogin.frame.origin.y = 84
            self.logoLogin.layoutIfNeeded()
        }
        UIView.animate(withDuration: 0.3) {
            self.welcomeMessage.alpha = 1
        }
    }

    func reduceHeader() {
        UIView.animate(withDuration: 1.0){
            self.frame.origin.y = -122
            self.layoutIfNeeded()
            self.logoLogin.frame.origin.y = 170
            self.logoLogin.layoutIfNeeded()
        }
        UIView.animate(withDuration: 0.0000001) {
            self.welcomeMessage.alpha = 0
        }
     }
    
    @objc private func wrongPassword(){
        emailView.layer.borderColor = UIColor.red.cgColor
        passwordView.layer.borderColor = UIColor.red.cgColor
        wrongInput.isHidden = false
        emailWrong.isHidden = false
        passwordWrong.isHidden = false
        visibilityButton.isHidden = true
        visibilityButton.isUserInteractionEnabled = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            self.emailView.layer.borderColor = UIColor.ioasysSearchBarColor.cgColor
            self.passwordView.layer.borderColor = UIColor.ioasysSearchBarColor.cgColor
            self.wrongInput.isHidden = true
            self.emailWrong.isHidden = true
            self.passwordWrong.isHidden = true
            self.visibilityButton.isHidden = false
            self.visibilityButton.isUserInteractionEnabled = true
        }
    }
    
    private func showActivityIndicatory() {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
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
