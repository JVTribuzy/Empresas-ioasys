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
        
        model.filteredEnterprises.removeAll()
        
        print("\n\n\n\n\n\n\n")
        for item in model.enterprises {
            let Text = searchText!.lowercased()
            var isArrayContain = false
            
            if item.enterpriseName.lowercased().contains(Text){
                isArrayContain = true
            } else{
                isArrayContain = false
            }
            
            if isArrayContain == true{
                model.filteredEnterprises.append(item)
            }
            
            DispatchQueue.main.async{
                NotificationCenter.default.post(name: .ioasysReloadEnterpriseTableView, object: nil)
            }
        }
    }
}
 
