//
//  Extension+NSNotification.swift
//  Empresas-ioasys
//
//  Created by João Tribuzy on 17/04/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation

extension NSNotification.Name{
    public static let ioasysGoToEnterpriseViewController = NSNotification.Name("com.tribuzy.empresas-ioasys.ioasysGoToEnterpriseViewController")
    public static let ioasysReloadEnterpriseTableView = NSNotification.Name("com.tribuzy.empresas-ioasys.ioasysReloadEnterpriseTableView")
    public static let ioasysPresenEnterpriseDetailViewController = NSNotification.Name("com.tribuzy.empresas-ioasys.ioasysPresenEnterpriseDetailViewController")
    public static let ioasysDismissEnterpriseDetailViewController = NSNotification.Name("com.tribuzy.empresas-ioasys.ioasysDismissEnterpriseDetailViewController")
    public static let ioasysReloadEnterpriseQuantity = NSNotification.Name("com.tribuzy.empresas-ioasys.ioasysReloadEnterpriseQuantity")
}
