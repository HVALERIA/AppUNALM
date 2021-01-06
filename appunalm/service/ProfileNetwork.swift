//
//  ProfileNetwork.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/28/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

import UIKit
import Alamofire

class ProfileNetwork: NSObject {

    func Resumen(byId IdRed: String, completion: @escaping (StudentSummary?) -> Void) {
           let url = String(format: "\(ApiClient.domain)alumno/%@", IdRed)
           print(url)
           
           Alamofire.request(url).response { response in
               guard let data = response.data else { return }
               do {
                   let decoder = JSONDecoder()
                   let response = try decoder.decode(StudentSummary.self, from: data)
                   completion(response)
               } catch let error {
                   print(error)
                   ShowAlert.ShowAlertError(title: " " ,message: Constants.msg_error)
                   completion(nil)
               }
           }
       }
    
}
