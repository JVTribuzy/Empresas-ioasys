//
//  EnterpriseSearchBarController.swift
//  Empresas-ioasys
//
//  Created by João Tribuzy on 18/04/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation

extension EnterpriseSearchBar{
    func textFieldTarget(){
        searchTextField.addTarget(self, action: #selector(searchTextFieldEdited), for: .editingChanged)
    }
    
    @objc private func searchTextFieldEdited(){
        let searchText = searchTextField.text
        
        model.filteredEnterprises.removeAll()
        
        guard searchText != " " || searchText != "" else {
            print("Empty Search Bar")
            model.filteredEnterprises.removeAll()
            model.shouldShowSearchResults = false
            DispatchQueue.main.async{
                NotificationCenter.default.post(name: .ioasysReloadEnterpriseTableView, object: nil)
            }
            return
        }
        
        model.shouldShowSearchResults = true
        
        for item in model.enterprises {
            let Text = searchText!.lowercased()
            let isArrayContain = item.enterpriseName.lowercased().range(of: Text)
            
            if isArrayContain != nil{
                print("true")
                model.filteredEnterprises.append(item)
                DispatchQueue.main.async{
                    NotificationCenter.default.post(name: .ioasysReloadEnterpriseTableView, object: nil)
                }
            }
        }
        
        
    }
}
 
