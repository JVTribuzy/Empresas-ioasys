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
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.autolayout()
        self.style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var enterprise: Enterprise? = nil
    
    let enterpriseView: UIView = UIView()
    let enterpriseName: UILabel = UILabel()
}

extension EnterpriseTableViewCell{
    public func fill(_ enterprise: Enterprise){
        self.enterprise = enterprise
        
        enterpriseView.backgroundColor = UIColor.ioasysBlueCell
        
        enterpriseName.text = enterprise.enterpriseName.uppercased()
    }
}
