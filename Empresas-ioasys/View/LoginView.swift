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
    private override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.autolayout()
        self.style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {}
    
    let buttonToEnterprise: UIButton = UIButton()
}

extension LoginView: IoasyCustomView{
    
    func autolayout() {
        // buttonToEnterprise
        subviews(buttonToEnterprise)
        buttonToEnterprise.centerVertically()
        buttonToEnterprise.height(50).right(30).left(30)
    }
    
    func style() {
        // buttonToEnterprise
        buttonToEnterprise.text(("entra").uppercased())
        buttonToEnterprise.backgroundColor = UIColor.loginButtonColor
    }
}
