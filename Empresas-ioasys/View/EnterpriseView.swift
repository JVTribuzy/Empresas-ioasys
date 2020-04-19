//
//  EnterpriseView.swift
//  Empresas-ioasys
//
//  Created by João Tribuzy on 17/04/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit
import Stevia

class EnterpriseView: UIView{
    
    var model: EnterpriseModelController = {
        return EnterpriseModelController.shared
    }()
    
    private override init(frame: CGRect) {
        super.init(frame: .zero)
        
        autolayout()
        style()
        
        addNotification()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit { NotificationCenter.default.removeObserver(self) }
    
    public let enterpriseContentView: UIView = EnterpriseContentView()
    public let enterpriseHeader: UIImageView = UIImageView()
    
    public let logo1: UIImageView = UIImageView()
    public let logo2: UIImageView = UIImageView()
    public let logo3: UIImageView = UIImageView()
    public let logo4: UIImageView = UIImageView()
    public let enterpriseSearch: UIView = EnterpriseSearchBar()
}

extension EnterpriseView: IoasyCustomView{
    
    func autolayout() {
        // enterpriseContentView
        subviews(enterpriseHeader.subviews(logo1, logo2, logo2, logo3, logo4),enterpriseContentView,enterpriseSearch)
            
        enterpriseHeader.right(0).top(0).left(0).height(148)
        
        logo1.width(119).height(94).top(82).left(-31)
        let radians1: CGFloat = 27.38 * (.pi / 180)
        logo1.transform = CGAffineTransform(rotationAngle: radians1)
        
        logo2.width(204.74).height(161.73).top(-70).left(27)
        let radians2: CGFloat = 132.01 * (.pi / 180)
        logo2.transform = CGAffineTransform(rotationAngle: radians2)
        
        logo3.width(119).height(94).top(76).right(20.02)
        let radians3: CGFloat = 132.01 * (.pi / 180)
        logo3.transform = CGAffineTransform(rotationAngle: radians3)
        
        logo4.width(119).height(94).top(0).right(-39.98)
        let radians4: CGFloat = 163.31 * (.pi / 180)
        logo4.transform = CGAffineTransform(rotationAngle: radians4)
    
        enterpriseContentView.Top == enterpriseHeader.Bottom
        enterpriseContentView.right(0.0).left(0.0).bottom(0.0)
        
        enterpriseSearch.right(16).left(16).height(48)
        enterpriseSearch.Top == enterpriseHeader.Bottom - 24
        
    }
    
    func style() {
        backgroundColor = UIColor.ioasysEnterpriseScreenBackgroundColor
        
        enterpriseContentView.backgroundColor = .white
        
        logo1.image = UIImage(named: "logo_login")
        logo1.alpha = 0.2
        logo2.image = UIImage(named: "logo_login")
        logo2.alpha = 0.2
        logo3.image = UIImage(named: "logo_login")
        logo3.alpha = 0.2
        logo4.image = UIImage(named: "logo_login")
        logo4.alpha = 0.2
        
        enterpriseHeader.image = UIImage(named: "header-enterprise")
        
    }
    
    func addNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        reduceHeader()
    }

    @objc func keyboardWillHide(_ notification: Notification) {
        resetHeader()
    }
    
    func resetHeader() {
        UIView.animate(withDuration: 1.0) {
            self.frame.origin.y = 0
            self.layoutIfNeeded()
        }
        UIView.animate(withDuration: 0.3) {
            self.enterpriseHeader.alpha = 1
        }
    }

    func reduceHeader() {
        UIView.animate(withDuration: 1.0){
            self.frame.origin.y = -80
            self.layoutIfNeeded()
            
        }
        UIView.animate(withDuration: 0.0000001) {
            self.enterpriseHeader.alpha = 0
        }
     }
    
}
