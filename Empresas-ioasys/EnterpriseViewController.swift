//
//  EnterpriseViewController.swift
//  Empresas-ioasys
//
//  Created by João Tribuzy on 17/04/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import UIKit

class EnterpriseViewController: UIViewController {

    var model: EnterpriseModelController = {
        return EnterpriseModelController.shared
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = EnterpriseView()
        
        addNotifications()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    deinit { NotificationCenter.default.removeObserver(self) }
}

extension EnterpriseViewController{
    private func addNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(presentEnterpriseDetailViewController(_:)), name: .ioasysPresenEnterpriseDetailViewController, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(dismissEnterpriseDetailViewController(_:)), name: .ioasysDismissEnterpriseDetailViewController, object: nil)
    }
        
    @objc private func presentEnterpriseDetailViewController(_ notification: Notification){
        let enterpriseDetailViewController = EnterpriseDetailViewController(enterprise: model.enterpriseToDetail!)
        enterpriseDetailViewController.modalPresentationStyle = .fullScreen
        present(enterpriseDetailViewController, animated: true)
    }
    
    @objc private func dismissEnterpriseDetailViewController(_ notification: Notification){
        dismiss(animated: true, completion: nil)
    }
}
