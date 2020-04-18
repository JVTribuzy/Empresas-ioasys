//
//  EnterpriseSearchBarView.swift
//  Empresas-ioasys
//
//  Created by João Tribuzy on 18/04/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit
import Stevia

class EnterpriseSearchBar: UIView, UITextFieldDelegate{
    init(){
        super.init(frame: .zero)
        autolayout()
        style()
        
        textFieldTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var searchIcon: UIImageView = UIImageView()
    public var searchTextField: UITextField = UITextField()
}

extension EnterpriseSearchBar: IoasyCustomView{
    func autolayout() {
        subviews(searchIcon, searchTextField)
        
        searchIcon.centerVertically().left(16).height(20).width(20)
        
        searchTextField.Left == searchIcon.Right + 16
        searchTextField.right(16).centerVertically()
    }
    
    func style() {
        self.backgroundColor = UIColor.ioasysSearchBarColor
        self.layer.cornerRadius = 4
        
        searchIcon.image = UIImage(named: "searchIcon")
        
        searchTextField.textAlignment = .left
        searchTextField.font = UIFont(name: "Rubik-Regular", size: 18)
        searchTextField.textColor = UIColor.ioasysSearchBarTextColor
        searchTextField.tintColor = UIColor.ioasysSearchTintColor
        searchTextField.placeholder = NSLocalizedString("Pesquise por uma empresa", comment: "")
    }
}

extension EnterpriseSearchBar{
    func textFieldTarget(){
        self.searchTextField.delegate = self
        searchTextField.addTarget(self, action: #selector(searchTextFieldEdited), for: .editingChanged)
    }
    
    @objc private func searchTextFieldEdited(){
        
    }
}
