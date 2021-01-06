//
//  Student.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/27/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

struct Student {
    let codigo: String?
    let tipo: String?
    let yearCicloAcademico: Int?
    let situacion: String?
    let carreraId: Int?
    let carreraCodigo: String?
    let carreraNombre: String?
    let tipoCodigo: String?
    let idAlumno: Int?
    
    enum CodingKeys: String, CodingKey {
          case codigo
          case tipo
          case yearCicloAcademico
          case situacion
          case carreraId
          case carreraCodigo
          case carreraNombre
          case tipoCodigo
          case idAlumno
      }
} 
extension Student: Decodable{
    
       init(from decoder: Decoder) throws {
           let response = try decoder.container(keyedBy: CodingKeys.self)
           codigo = try response.decodeIfPresent(String.self, forKey: .codigo)
           tipo = try response.decodeIfPresent(String.self, forKey: .tipo)
           yearCicloAcademico = try response.decodeIfPresent(Int.self, forKey: .yearCicloAcademico)
           situacion = try response.decodeIfPresent(String.self, forKey: .situacion)
           carreraId = try response.decodeIfPresent(Int.self, forKey: .carreraId)
           carreraCodigo = try response.decodeIfPresent(String.self, forKey: .carreraCodigo)
           carreraNombre = try response.decodeIfPresent(String.self, forKey: .carreraNombre)
           tipoCodigo = try response.decodeIfPresent(String.self, forKey: .tipoCodigo)
           idAlumno = try response.decodeIfPresent(Int.self, forKey: .idAlumno)
       }
}

struct StudentSummary /*: Codable */ {
    let codigo: String?
    let tipo: String?
    let descripcion: String?
    let nombres: String?
    let email: String?
    let foto: String?
    let carrera: String?
    let dni: String?
    let situacion: String?
    
    enum CodingKeys: String, CodingKey {
          case codigo
          case tipo
          case descripcion
          case nombres
          case email
          case foto
          case carrera
          case dni = "dni"
          case situacion = "sitAcademica"
      }
    /*
    init(from decoder: Decoder) throws {
        let response = try decoder.container(keyedBy: CodingKeys.self)
        codigo = try response.decode(String.self, forKey: .codigo)
        tipo = try response.decode(String.self, forKey: .tipo)
        //descripcion = try response.decode(String.self, forKey: .descripcion)
        descripcion = try response.decodeIfPresent(String.self, forKey: .descripcion)
        nombres = try response.decodeIfPresent(String.self, forKey: .nombres)
        email = try response.decode(String.self, forKey: .email)
        foto = try response.decode(String.self, forKey: .foto)
        carrera = try response.decode(String.self, forKey: .carrera)
        dni = try response.decode(String.self, forKey: .dni)
        situacion = try response.decode(String.self, forKey: .situacion)
    }*/
    
}
extension StudentSummary: Decodable {
    
       init(from decoder: Decoder) throws {
           let response = try decoder.container(keyedBy: CodingKeys.self)
           codigo = try response.decodeIfPresent(String.self, forKey: .codigo)
           tipo = try response.decodeIfPresent(String.self, forKey: .tipo)
           descripcion = try response.decodeIfPresent(String.self, forKey: .descripcion)
           nombres = try response.decodeIfPresent(String.self, forKey: .nombres)
           email = try response.decodeIfPresent(String.self, forKey: .email)
           foto = try response.decodeIfPresent(String.self, forKey: .foto)
           carrera = try response.decodeIfPresent(String.self, forKey: .carrera)
           dni = try response.decodeIfPresent(String.self, forKey: .dni)
           situacion = try response.decodeIfPresent(String.self, forKey: .situacion)
       }
}
