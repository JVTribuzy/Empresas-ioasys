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
    private override init(frame: CGRect) {
        super.init(frame: .zero)
        
        autolayout()
        style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {}
    
    public let enterpriseContentView: UIView = EnterpriseContentView()
}

extension EnterpriseView: IoasyCustomView{
    
    func autolayout() {
        // enterpriseContentView
        subviews(enterpriseContentView)
        enterpriseContentView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 70).isActive = true
        enterpriseContentView.right(0.0).left(0.0).bottom(0.0)
    }
    
    func style() {
        backgroundColor = UIColor.ioasysEnterpriseScreenBackgroundColor
        
        // enterpriseContentView
        enterpriseContentView.backgroundColor = .white
    }
}
