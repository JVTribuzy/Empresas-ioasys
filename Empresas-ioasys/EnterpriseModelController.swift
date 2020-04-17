//
//  EnterpriseModelController.swift
//  Empresas-ioasys
//
//  Created by João Tribuzy on 17/04/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation

class EnterpriseModelController {
    public static let shared = EnterpriseModelController()

    public var enterprises: [Enterprise]

    private init() {
        self.enterprises = []
    }
}
