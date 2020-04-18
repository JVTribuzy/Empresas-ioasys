//
//  EnterpriseModelController.swift
//  Empresas-ioasys
//
//  Created by João Tribuzy on 17/04/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

class EnterpriseModelController {
    public static let shared = EnterpriseModelController()

    public var enterprises: [Enterprise]
    public var enterpriseToDetail: Enterprise? = nil
    public var enterpriseTotal: Int = 0

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
                
                var colorId: Int = 0
                for cachedEnterprise in enterprise{
                    let enterpriseType: [String : Any] = cachedEnterprise["enterprise_type"] as! [String : Any]
                    var colorToSet: UIColor = .white
                    switch colorId {
                    case 0:
                        colorToSet = UIColor.ioasysBlueCell
                        colorId = 1
                    case 1:
                        colorToSet = UIColor.ioasysRedCell
                        colorId = 2
                    case 2:
                        colorToSet = UIColor.ioasysGreenCell
                        colorId = 0
                    default:
                        break
                    }
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
                                                                                                  enterpriseTypeName: enterpriseType["enterprise_type_name"] as! String),
                                                                   cellColor: colorToSet
                                                                    )
                    self.enterprises.append(contentEnterprise)
                    self.enterpriseTotal = self.enterprises.count
                    NotificationCenter.default.post(name: .ioasysReloadEnterpriseTableView, object: nil)
                }
            } catch {}
        }.resume()
    }
}
