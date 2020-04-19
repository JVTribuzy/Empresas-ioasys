//
//  EnterpriseTableViewController.swift
//  Empresas-ioasys
//
//  Created by João Tribuzy on 17/04/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

class EnterpriseTableViewController: UITableViewController {
    
    var model: EnterpriseModelController = {
        return EnterpriseModelController.shared
    }()
    
    override init(style: UITableView.Style) {
        super.init(style: style)
        setupTableView()
        addNotifications()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit { NotificationCenter.default.removeObserver(self) }

}

extension EnterpriseTableViewController{
    func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = .white
        tableView.register(EnterpriseTableViewCell.self, forCellReuseIdentifier: "enterpriseCell")
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.keyboardDismissMode = .onDrag
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if model.shouldShowSearchResults{
            return model.filteredEnterprises.count
        } else{
            return model.enterprises.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "enterpriseCell", for: indexPath) as! EnterpriseTableViewCell
        
        if model.shouldShowSearchResults && model.enterpriseTotal != 0{
            cell.fill(model.filteredEnterprises[indexPath.row])
        } else{
            cell.fill(model.enterprises[indexPath.row])
        }
        
        return cell
    }
   
}

extension EnterpriseTableViewController{
    private func addNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(reloadEnterpriseTableViewNotificationReceived(_:)), name: .ioasysReloadEnterpriseTableView, object: nil)
    }
    
    @objc private func reloadEnterpriseTableViewNotificationReceived(_ notification: NSNotification){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
