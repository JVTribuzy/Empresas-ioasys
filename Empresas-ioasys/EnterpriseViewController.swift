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
        enterpriseDetailViewController.modalPresentationStyle = .custom
        
        let transition = CATransition()
        transition.duration = 0.2
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        
        present(enterpriseDetailViewController, animated: false)
    }
    
    @objc private func dismissEnterpriseDetailViewController(_ notification: Notification){
        let transition = CATransition()
        transition.duration = 0.2
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window?.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
}
