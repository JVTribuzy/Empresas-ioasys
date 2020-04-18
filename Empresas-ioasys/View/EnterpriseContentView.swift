//
//  EnterpriseContentView.swift
//  Empresas-ioasys
//
//  Created by João Tribuzy on 17/04/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit
import Stevia

class EnterpriseContentView: UIView{
    
    private override init(frame: CGRect) {
        super.init(frame: .zero)
        autolayout()
        style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let enterpriseTableViewController: UITableViewController = EnterpriseTableViewController(style: .plain)
    private let enterpriseIndicator: UILabel = UILabel()
}

extension EnterpriseContentView: IoasyCustomView{
    func autolayout() {
        // enterpriseTableViewController
        subviews(enterpriseTableViewController.view)
        enterpriseIndicator.left(16).right(16).top(0)
        
        enterpriseTableViewController.view.left(0).top(40).right(0).bottom(0)
    }
    
    func style() {
        enterpriseIndicator.numberOfLines = 0
        enterpriseIndicator.lineBreakMode = .byWordWrapping
        enterpriseIndicator.textAlignment = .left
        enterpriseIndicator.font = UIFont(name: "Rubik-Regular", size: 18)
        enterpriseIndicator.textColor = .black
        enterpriseIndicator.text = "asdasdasasdad"
    }
}
