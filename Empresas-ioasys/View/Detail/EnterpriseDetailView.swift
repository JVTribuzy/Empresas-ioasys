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
        view.subviews(headerView.subviews(backButton.subviews(backArrow),enterpriseTitle),
                      cellCopyView.subviews(elipseImageView,cellCopyViewLabel),
                      descriptionLabel
        )
        headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        headerView.left(0).right(0).height(72)
        
        backButton.left(16).width(40).height(40).centerVertically()
        backArrow.height(14).width(18).centerInContainer()
        
        enterpriseTitle.left(8).right(8).top(22).bottom(22)
        
        cellCopyView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 72).isActive = true
        cellCopyView.right(0).left(0)
        
        cellCopyViewLabel.left(8).top(64).right(8).bottom(34)
        
        elipseImageView.bottomAnchor.constraint(equalTo: cellCopyViewLabel.topAnchor, constant: -5).isActive = true
        elipseImageView.height(26).width(52).centerHorizontally()
        
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
        
        backButton.backgroundColor = UIColor.ioasysDetailBackButton
        backButton.layer.cornerRadius = 4
        backButton.isUserInteractionEnabled = true
        
        backArrow.image = UIImage(named: "back-arrow")
        
        cellCopyViewLabel.numberOfLines = 0
        cellCopyViewLabel.lineBreakMode = .byWordWrapping
        cellCopyViewLabel.textAlignment = .center
        cellCopyViewLabel.font = UIFont(name: "Rubik-Bold", size: 18)
        cellCopyViewLabel.textColor = .white
        
        cellCopyView.backgroundColor = self.enterprise?.cellColor
        elipseImageView.image = UIImage(named: "elipse")
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.textAlignment = .left
        descriptionLabel.font = UIFont(name: "Rubik-Regular", size: 18)
        descriptionLabel.textColor = .black
    }
}
