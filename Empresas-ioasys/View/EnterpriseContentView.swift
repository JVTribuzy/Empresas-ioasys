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
    
    private let enterpriseTableViewController: UITableViewController = EnterpriseTableViewController(style: .plain)
    public let enterpriseQuantity: UILabel = UILabel()
    private let unknownResult: UILabel = UILabel()
}

extension EnterpriseContentView: IoasyCustomView{
    func autolayout() {
        // enterpriseTableViewController
        subviews(enterpriseTableViewController.view, unknownResult, enterpriseQuantity)
        enterpriseTableViewController.view.left(0).top(80).right(0).bottom(0)
        
        unknownResult.right(16).left(16).height(40).top(180)
        
        enterpriseQuantity.Top == self.Top + 40
        enterpriseQuantity.right(16).left(16)
    }
    
    func style() {
        
        unknownResult.isHidden = true
        unknownResult.numberOfLines = 1
        unknownResult.textAlignment = .center
        unknownResult.font = UIFont(name: "Rubik-Regular", size: 18)
        unknownResult.textColor = UIColor.ioasysUnknownResulTextColor
        unknownResult.text = NSLocalizedString("Nenhum resultado encontrado", comment: "")
        
        enterpriseQuantity.numberOfLines = 1
        enterpriseQuantity.textAlignment = .left
        enterpriseQuantity.font = UIFont(name: "Rubik-Regular", size: 18)
        enterpriseQuantity.textColor = UIColor.ioasysSearchBarTextColor
    }
    
    func addNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(reloadQuantity), name: .ioasysReloadEnterpriseQuantity, object: nil)
    }
    
    private func showEmptyIndication(){
        enterpriseQuantity.isHidden = true
        unknownResult.isHidden = false
        enterpriseTableViewController.view.isHidden = true
    }
    
    private func hideEmptyIndication(){
        enterpriseQuantity.isHidden = false
        unknownResult.isHidden = true
        enterpriseTableViewController.view.isHidden = false
    }
    
    @objc private func reloadQuantity(){
        if model.enterpriseTotal == 0{
            showEmptyIndication()
        } else{
            hideEmptyIndication()
        }
        enterpriseQuantity.text = NSLocalizedString("\(model.enterpriseTotal) resultados encontrados", comment: "")
    }
}
