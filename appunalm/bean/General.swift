//
//  General.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/30/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

import UIKit

struct General {
    let cursados: Int?
    let total: Int?
    
    enum CodingKeys: String, CodingKey {
         case cursados
         case total
    }
}
extension General : Decodable {
  
    init(from decoder: Decoder) throws {
        let response = try decoder.container(keyedBy: CodingKeys.self)
        cursados = try response.decodeIfPresent(Int.self, forKey: .cursados)
        total = try response.decodeIfPresent(Int.self, forKey: .total)
    }
}
