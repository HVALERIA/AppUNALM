//
//  LoginNetwork.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/27/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

import Alamofire

class LoginNetwork: NSObject {
    
    func getFacebook(byId IdRed: String, completion: @escaping (Authentification?) -> Void) {
        let url = String(format: "\(ApiClient.domain)authorization/facebook/%@", IdRed)
        print(url)
        
        Alamofire.request(url).response { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(Authentification.self, from: data)
                completion(response)
            } catch let error {
                print(error)
                completion(nil)
            }
        }
    }
    
    func getGoogle(byId IdRed: String, completion: @escaping (Authentification?) -> Void) {
         let url = String(format: "\(ApiClient.domain)authorization/google/%@/", IdRed)
         print(url)
         
         Alamofire.request(url).response { response in
             guard let data = response.data else { return }
             do {
                 let decoder = JSONDecoder()
                 let response = try decoder.decode(Authentification.self, from: data)
                 completion(response)
             } catch let error {
                 print(error)
                 completion(nil)
             }
         }
     }
}
