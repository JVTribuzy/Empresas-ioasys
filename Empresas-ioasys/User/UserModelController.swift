//
//  UserModelController.swift
//  Empresas-ioasys
//
//  Created by João Tribuzy on 18/04/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation

class UserModelController {
    public static let shared = UserModelController()
    
    public var investor: Investor? = nil
    public var enterprise: String? = nil
    public var successAuth: Bool = false
    
    init() {
    }
    
    public func getAuthentication(email: String, password: String){
        let parameters = "{\n    \"email\": \"\(email)\",\n    \"password\": \"\(password)\"\n}"
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: singinEndpoint)!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("text/plain", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
            }
            
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String : Any]
                self.enterprise = json["enterprise"] as? String
                self.successAuth = json["success"] as! Bool
                
                guard self.successAuth == true else{
                    return
                }
                
                accessToken = (response as! HTTPURLResponse).allHeaderFields["access-token"] as! String
                client = (response as! HTTPURLResponse).allHeaderFields["client"] as! String
                uid = (response as! HTTPURLResponse).allHeaderFields["uid"] as! String
                
                print("\(accessToken)    \(client)    \(uid)  \(self.successAuth)")
                
                let jsonInvestor = json["investor"] as! [String : Any]
                
                let portfolio = jsonInvestor["portfolio"] as! [String : Any]

                self.investor = Investor(id: jsonInvestor["id"] as? Int,
                                         investorName: jsonInvestor["investor_name"] as? String,
                                         email: jsonInvestor["email"] as? String,
                                         city: jsonInvestor["city"] as? String,
                                         country: jsonInvestor["country"] as? String,
                                         balance: jsonInvestor["balance"] as? Int,
                                         photo: jsonInvestor["photo"] as? String,
                                         portfolio: Portfolio(enterprisesNumber: portfolio["enterprises_number"] as? Int ?? 0,
                                                              enterprises: portfolio["enterprises"] as? [Any?] ?? []),
                                         portfolioValue: jsonInvestor["portfolio_value"] as? Int,
                                         firstAccess: jsonInvestor["first_access"] as? Bool,
                                         superAngel: jsonInvestor["super_angel"] as? Bool)
                DispatchQueue.main.async {
                    NotificationCenter.default.post(name: .ioasysGoToEnterpriseViewController, object: nil)
                }
            } catch {}
        }

        task.resume()
    }
    
}
