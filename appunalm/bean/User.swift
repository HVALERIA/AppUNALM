//
//  User.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/27/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

struct User
{
    let idUser: Int?
    let idPersona: Int?
    let estado: String?
    let students: [Student]?
    
    enum CodingKeys: String, CodingKey {
               case idUser = "id"
               case idPersona
               case estado
               case student = "alumno"
        }
}
extension User : Decodable{
    init(from decoder: Decoder) throws {
       let response = try decoder.container(keyedBy: CodingKeys.self)
        
        idUser = try response.decodeIfPresent(Int.self, forKey: .idUser)
        idPersona = try response.decodeIfPresent(Int.self, forKey: .idPersona)
        estado = try response.decodeIfPresent(String.self, forKey: .estado)
        students = try! response.decodeIfPresent([Student].self, forKey: .student) 
    }
}
 
