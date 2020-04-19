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
    public let enterpriseSearch: UIView = EnterpriseSearchBar()
}

extension EnterpriseView: IoasyCustomView{
    
    func autolayout() {
        // enterpriseContentView
        subviews(enterpriseHeader,enterpriseContentView,enterpriseSearch)
            
        enterpriseHeader.Top == safeAreaLayoutGuide.Top
        enterpriseHeader.right(0).left(0).height(148 - 118)
    
        enterpriseContentView.Top == enterpriseHeader.Bottom
        enterpriseContentView.right(0.0).left(0.0).bottom(0.0)
        
        enterpriseSearch.right(16).left(16).height(48)
        enterpriseSearch.Top == enterpriseHeader.Bottom - 24
        
    }
    
    func style() {
        backgroundColor = UIColor.ioasysEnterpriseScreenBackgroundColor
        
        // enterpriseContentView
        enterpriseContentView.backgroundColor = .white
        
    }
    
    func addNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        print("\n apareceu")
//        reduceHeader()
    }

    @objc func keyboardWillHide(_ notification: Notification) {
        print("\n escondeu")
//        resetHeader()
    }
    
    func resetHeader() {
        UIView.animate(withDuration: 1.0, delay: 0.0,options: [], animations: {
            self.enterpriseHeader.heightConstraint?.constant += 118
            self.enterpriseHeader.layoutIfNeeded()
        }, completion: nil)
    }

    func reduceHeader() {
        UIView.animate(withDuration: 1.0, delay: 0.0,options: [], animations: {
            self.enterpriseHeader.heightConstraint?.constant -= 118
            self.enterpriseHeader.layoutIfNeeded()
        }, completion: nil)
     }
    
    
}
