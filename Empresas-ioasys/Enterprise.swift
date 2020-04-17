//
//  Enterprise.swift
//  Empresas-ioasys
//
//  Created by João Tribuzy on 17/04/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation

// MARK: - Enterpris
struct Enterprise: Decodable{
    let id: Int
    let emailEnterprise: String?
    let facebook, twitter, linkedin: URL?
    let phone: String?
    let ownEnterprise: Bool
    let enterpriseName: String
    let photo: URL?
    let enterprisDescription, city, country: String
    let value, sharePrice: Int
    let enterpriseType: EnterpriseType
    
    init(id: Int, emailEnterprise: String?, facebook: URL?, twitter: URL?, linkedin: URL?,
         phone: String?, ownEnterprise: Bool, enterpriseName: String, photo: URL?, enterprisDescription: String, city: String, country: String, value: Int, sharePrice: Int, enterpriseType: EnterpriseType) {
        self.id = id
        self.emailEnterprise = emailEnterprise
        self.facebook = facebook
        self.twitter = twitter
        self.linkedin = linkedin
        self.phone = phone
        self.ownEnterprise = ownEnterprise
        self.enterpriseName = enterpriseName
        self.photo = photo
        self.enterprisDescription = enterprisDescription
        self.city = city
        self.country = country
        self.value = value
        self.sharePrice = sharePrice
        self.enterpriseType = enterpriseType
    }
}

// MARK: - EnterpriseType
struct EnterpriseType : Decodable{
    let id: Int
    let enterpriseTypeName: String
    
    init(id: Int, enterpriseTypeName: String) {
        self.id = id
        self.enterpriseTypeName = enterpriseTypeName
    }
}
