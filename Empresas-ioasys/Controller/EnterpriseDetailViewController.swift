//
//  EnterpriseDetailViewController.swift
//  Empresas-ioasys
//
//  Created by João Tribuzy on 17/04/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

class EnterpriseDetailViewController: UIViewController{
    
    init(enterprise: Enterprise){
        super.init(nibName: nil, bundle: nil)
        self.enterprise = enterprise
        
        autolayout()
        style()
        
        fill()
        
        backTarget()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var enterprise: Enterprise? = nil
    
    public var headerView: UIView = UIView()
    public var backButton: UIButton = UIButton()
    public var backArrow: UIImageView = UIImageView()
    public var enterpriseTitle: UILabel = UILabel()
    
    public var cellCopyView: UIView = UIView()
    public var cellCopyViewLabel: UILabel = UILabel()
    
    public var descriptionLabel: UILabel = UILabel()
    
    let elipseImageView: UIImageView = UIImageView()
    
}

extension EnterpriseDetailViewController{
    private func fill(){
        enterpriseTitle.text = enterprise?.enterpriseName
        
        cellCopyViewLabel.text = enterprise?.enterpriseName.uppercased()
        
        descriptionLabel.text = enterprise?.enterprisDescription
    }
}

extension EnterpriseDetailViewController{
    func backTarget(){
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
    }
    
    @objc private func backButtonPressed(){
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: .ioasysDismissEnterpriseDetailViewController, object: nil)
//            NotificationCenter.default.post(name: UIResponder.keyboardDidShowNotification, object: nil)
        }
    }
}
