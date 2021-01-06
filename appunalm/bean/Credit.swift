//
//  Credit.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/30/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

import UIKit

struct Credit {
    let carrera: String?
    let idCredit: Int?
    let malla: Mesh?
    
    enum CodingKeys: String, CodingKey {
        case carrera
        case idCredit = "id"
        case malla = "mallaCurricular"
    }
}
extension Credit: Decodable {
    
    init(from decoder: Decoder) throws {
        print("Ini credit")
        let response = try decoder.container(keyedBy: CodingKeys.self)
        carrera = try response.decodeIfPresent(String.self, forKey: .carrera)
        idCredit = try response.decodeIfPresent(Int.self, forKey: .idCredit)
        malla = try response.decodeIfPresent(Mesh.self, forKey: .malla)
        print("Fin credit")
    }
}

struct CreditSummary {
    let total: Double?
    let llevados:Double?
    
    enum CodingKeys: String, CodingKey {
           case total = "credtotal"
           case llevados = "credllevados"
      }
    
}
extension CreditSummary: Decodable {
    
    init(from decoder: Decoder) throws {
        let response = try decoder.container(keyedBy: CodingKeys.self)
        total = try response.decodeIfPresent(Double.self, forKey: .total)
        llevados = try response.decodeIfPresent(Double.self, forKey: .llevados)
    }
}
