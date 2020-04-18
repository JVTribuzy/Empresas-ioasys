//
//  EnterpriseDetailView.swift
//  Empresas-ioasys
//
//  Created by João Tribuzy on 17/04/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit
import Stevia

extension EnterpriseDetailViewController: IoasyCustomView{
    func autolayout() {
        view.subviews(headerView.subviews(enterpriseTitle),
                      cellCopyView.subviews(cellCopyViewLabel),
                      descriptionLabel
        )
        headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        headerView.left(0).right(0).height(72)
        
        enterpriseTitle.left(8).right(8).top(22).bottom(22)
        
        cellCopyView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 72).isActive = true
        cellCopyView.right(0).left(0)
        
        cellCopyViewLabel.left(8).top(64).right(8).bottom(34)
        
        descriptionLabel.topAnchor.constraint(equalTo: cellCopyView.bottomAnchor, constant: 24).isActive = true
        descriptionLabel.left(16).right(16)
    }
    
    func style() {
        view.backgroundColor = .white
        
        headerView.backgroundColor = .white
        
        enterpriseTitle.numberOfLines = 0
        enterpriseTitle.lineBreakMode = .byWordWrapping
        enterpriseTitle.textAlignment = .center
        enterpriseTitle.font = UIFont(name: "Rubik-Bold", size: 20)
        enterpriseTitle.textColor = .black
        
        cellCopyViewLabel.numberOfLines = 0
        cellCopyViewLabel.lineBreakMode = .byWordWrapping
        cellCopyViewLabel.textAlignment = .center
        cellCopyViewLabel.font = UIFont(name: "Rubik-Bold", size: 18)
        cellCopyViewLabel.textColor = .white
        
        cellCopyView.backgroundColor = UIColor.ioasysBlueCell
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.textAlignment = .left
        descriptionLabel.font = UIFont(name: "Rubik-Regular", size: 18)
        descriptionLabel.textColor = .black
    }
}
