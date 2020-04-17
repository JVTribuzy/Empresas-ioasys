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
          print(String(data: data, encoding: .utf8)!)
        }.resume()
    }
}
