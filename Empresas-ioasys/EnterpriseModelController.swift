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
    public var enterpriseToDetail: Enterprise? = nil

    private init() {
        self.enterprises = []
        
        getEnterprises()
    }
    
    private func getEnterprises(){
        var request = URLRequest(url: URL(string: enterpriseEndpoint)!,timeoutInterval: Double.infinity)
        request.addValue(contentType, forHTTPHeaderField: "Content-Type")
        request.addValue(accessToken, forHTTPHeaderField: "access-token")
        request.addValue(client, forHTTPHeaderField: "client")
        request.addValue(uid, forHTTPHeaderField: "uid")

        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            do{
                let content = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String : Any]
                let enterprise: Array<[String : Any]> = content["enterprises"] as! Array<[String : Any]>
                
                for cachedEnterprise in enterprise{
                    let enterpriseType: [String : Any] = cachedEnterprise["enterprise_type"] as! [String : Any]
                    let contentEnterprise: Enterprise = Enterprise(id: cachedEnterprise["id"] as! Int,
                                                                   emailEnterprise: cachedEnterprise["email_enterprise"] as? String,
                                                                   facebook: cachedEnterprise["facebook"] as? URL,
                                                                   twitter: cachedEnterprise["twitter"] as? URL,
                                                                   linkedin: cachedEnterprise["linkedin"] as? URL,
                                                                   phone: cachedEnterprise["phone"] as? String,
                                                                   ownEnterprise: (cachedEnterprise["own_enterprise"] != nil),
                                                                   enterpriseName: cachedEnterprise["enterprise_name"] as! String,
                                                                   photo: cachedEnterprise["photo"] as? URL,
                                                                   enterprisDescription: cachedEnterprise["description"] as! String,
                                                                   city: cachedEnterprise["city"] as! String,
                                                                   country: cachedEnterprise["country"] as! String,
                                                                   value: cachedEnterprise["value"] as! Int,
                                                                   sharePrice: cachedEnterprise["share_price"] as! Int,
                                                                   enterpriseType: EnterpriseType(id: enterpriseType["id"] as! Int,
                                                                                                  enterpriseTypeName: enterpriseType["enterprise_type_name"] as! String)
                                                                    )
                    self.enterprises.append(contentEnterprise)
                    NotificationCenter.default.post(name: .ioasysReloadEnterpriseTableView, object: nil)
                }
            } catch {}
        }.resume()
    }
}
