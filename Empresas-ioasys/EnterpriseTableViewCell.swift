//
//  EnterpriseTableViewCell.swift
//  Empresas-ioasys
//
//  Created by João Tribuzy on 17/04/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

class EnterpriseTableViewCell: UITableViewCell{
    
    var model: EnterpriseModelController = {
        return EnterpriseModelController.shared
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.autolayout()
        self.style()
        setupViewTouch()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var enterprise: Enterprise? = nil
    
    let enterpriseView: UIView = UIView()
    let enterpriseName: UILabel = UILabel()
    
    let elipseImageView: UIImageView = UIImageView()
}

extension EnterpriseTableViewCell{
    public func fill(_ enterprise: Enterprise){
        self.enterprise = enterprise
        
        enterpriseView.backgroundColor = enterprise.cellColor
        
        enterpriseName.text = enterprise.enterpriseName.uppercased()
        
        NotificationCenter.default.post(name: .ioasysReloadEnterpriseQuantity, object: nil)
    }
    
    func setupViewTouch(){
        self.contentView.isUserInteractionEnabled = true
        self.contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(presentEnterpriseDetailViewControllerNotificationReceived)))
    }
    
    @objc private func presentEnterpriseDetailViewControllerNotificationReceived(){
        model.enterpriseToDetail = self.enterprise
        DispatchQueue.main.async{
//            NotificationCenter.default.post(name: UIResponder.keyboardDidHideNotification, object: nil)
            NotificationCenter.default.post(name: .ioasysPresenEnterpriseDetailViewController, object: nil)
        }
    }
}
