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
    
    deinit {}
}

extension EnterpriseTableViewController{
    func setupTableView(){
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "enterpriseCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.enterprises.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "enterpriseCell", for: indexPath)
        
        cell.textLabel?.text = model.enterprises[indexPath.row].enterpriseName
        
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
