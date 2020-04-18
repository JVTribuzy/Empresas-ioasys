//
//  EnterpriseTableViewCellStyle.swift
//  Empresas-ioasys
//
//  Created by João Tribuzy on 17/04/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit
import Stevia

extension EnterpriseTableViewCell: IoasyCustomView{
    func style() {
        let selectedView = UIView()
        selectedView.backgroundColor = .clear
        self.selectedBackgroundView = selectedView
        
        //enterpriseName
        enterpriseName.numberOfLines = 0
        enterpriseName.lineBreakMode = .byWordWrapping
        enterpriseName.textAlignment = .center
        enterpriseName.font = UIFont(name: "Rubik-Bold", size: 18)
        enterpriseName.textColor = .white
    }
    
    func autolayout() {
        contentView.left(0).top(0).right(0).bottom(0)
    
        subviews(
            enterpriseView.subviews(
                enterpriseName
            )
        )
        
        enterpriseView.left(16).right(16).top(4).bottom(4)
        enterpriseView.layer.cornerRadius = 5
        
        enterpriseName.left(8).top(64).right(8).bottom(34)
        
    }
}
