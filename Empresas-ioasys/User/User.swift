//
//  User.swift
//  Empresas-ioasys
//
//  Created by João Tribuzy on 18/04/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation

// MARK: - Investor
struct Investor {
    let id: Int?
    let investorName, email, city, country: String?
    let balance: Int?
    let photo: String?
    let portfolio: Portfolio?
    let portfolioValue: Int?
    let firstAccess, superAngel: Bool?
    
    init(id: Int?, investorName: String?, email: String?, city: String?, country: String?, balance: Int?, photo: String?, portfolio: Portfolio?, portfolioValue: Int?, firstAccess: Bool?, superAngel: Bool?) {
        self.id = id
        self.investorName = investorName
        self.email = email
        self.city = city
        self.country = country
        self.balance = balance
        self.photo = photo
        self.portfolio = portfolio
        self.portfolioValue = portfolioValue
        self.firstAccess = firstAccess
        self.superAngel = superAngel
    }
}

// MARK: - Portfolio
struct Portfolio {
    let enterprisesNumber: Int
    let enterprises: [Any?]
}


