//
//  Course.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/29/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

import UIKit

struct Course {
    let nombre: String?
    let breve: String?
    let letra: String?
    let nota: String?
    let codigo: String?
    let aprobado: Bool?
    let id: Int?
    
    enum CodingKeys: String, CodingKey {
           case nombre
           case breve = "nombreCortocaracter"
           case letra = "primerasLetras"
           case nota = "nota"
           case codigo = "codigoConcatenado"
           case aprobado
           case id
       }
    
}
extension Course: Decodable {
    
    init(from decoder: Decoder) throws {
         let response = try decoder.container(keyedBy: CodingKeys.self)
         nombre = try response.decodeIfPresent(String.self, forKey: .nombre)
         breve = try response.decodeIfPresent(String.self, forKey: .breve)
         letra = try response.decodeIfPresent(String.self, forKey: .letra)
         nota = try response.decodeIfPresent(String.self, forKey: .nota)
         codigo = try response.decodeIfPresent(String.self, forKey: .codigo)
         aprobado = try response.decodeIfPresent(Bool.self, forKey: .aprobado)
         id = try response.decodeIfPresent(Int.self, forKey: .id)
         
    }
}

struct CourseDetailAdv {
    let id: Int?
    let codigo: String?
    let nombre: String?
    let estado: String?
    let creditos: Int?
    let matricula: String?
    let registrado: Bool?
    let prerequisito: String?
    
    enum CodingKeys: String, CodingKey {
           case id
           case codigo = "codigo"
           case nombre
           case estado
           case creditos
           case matricula = "estadoMatricula"
           case registrado
           case prerequisito = "prerequisitos"
       }
    
}
extension CourseDetailAdv: Decodable {
    
    init(from decoder: Decoder) throws {
        let response = try decoder.container(keyedBy: CodingKeys.self)
        id = try response.decodeIfPresent(Int.self, forKey: .id)
        codigo = try response.decodeIfPresent(String.self, forKey: .codigo)
        nombre = try response.decodeIfPresent(String.self, forKey: .nombre)
        estado = try response.decodeIfPresent(String.self, forKey: .estado)
        creditos = try response.decodeIfPresent(Int.self, forKey: .creditos)
        matricula = try response.decodeIfPresent(String.self, forKey: .matricula)
        registrado = try response.decodeIfPresent(Bool.self, forKey: .registrado)
        prerequisito = try response.decodeIfPresent(String.self, forKey: .prerequisito)
    }
}

struct CourseSummary {
    let id: Int?
    let codigo: String?
    let nombre: String?
    let curso: String?
    let credito: Int?
    let aula: String?
    let seccion: String?
    let facultad: String?
    let especialidad: String?
    let docente: String?
    
    
    enum CodingKeys: String, CodingKey {
           case id
           case codigo
           case nombre
           case curso = "tipoCurso"
           case credito = "creditos"
           case aula = "codigoaula"
           case seccion = "tiposeccion"
           case facultad = "nombrefacultad"
           case especialidad = "especialidad"
           case docente = "docente"
       }
    
}
extension CourseSummary: Decodable {
    
    init(from decoder: Decoder) throws {
         let response = try decoder.container(keyedBy: CodingKeys.self)
         id = try response.decodeIfPresent(Int.self, forKey: .id)
         codigo = try response.decodeIfPresent(String.self, forKey: .codigo)
         nombre = try response.decodeIfPresent(String.self, forKey: .nombre)
         curso = try response.decodeIfPresent(String.self, forKey: .curso)
         credito = try response.decodeIfPresent(Int.self, forKey: .credito)
         aula = try response.decodeIfPresent(String.self, forKey: .aula)
         seccion = try response.decodeIfPresent(String.self, forKey: .seccion)
         facultad = try response.decodeIfPresent(String.self, forKey: .facultad)
         especialidad = try response.decodeIfPresent(String.self, forKey: .especialidad)
         docente = try response.decodeIfPresent(String.self, forKey: .docente)
         
    }
}
struct CourseDetail {
    let estado: String?
    let nombre: String?
    let credito: Int?
    let breve: String?
    let letra: String?
    let autorizado: Int?
    let nota: String?
    let llevado: Int?
    let regular: Int?
    let codigo: String?
    let aprobado: Bool?
    let idDetails: Int?
    
    enum CodingKeys: String, CodingKey {
        case estado
        case nombre
        case credito = "creditos"
        case breve = "nombreCortocaracter"
        case letra = "primerasLetras"
        case autorizado
        case nota
        case llevado = "vecesCursado"
        case regular = "vecesCursadoRegular"
        case codigo = "codigoConcatenado"
        case aprobado
        case idDetails = "id"
    }
    
}
extension CourseDetail: Decodable {
    init(from decoder: Decoder) throws {
        let response = try decoder.container(keyedBy: CodingKeys.self)
        estado = try response.decodeIfPresent(String.self, forKey: .estado)
        nombre = try response.decodeIfPresent(String.self, forKey: .nombre)
        credito = try response.decodeIfPresent(Int.self, forKey: .credito)
        breve = try response.decodeIfPresent(String.self, forKey: .breve)
        letra = try response.decodeIfPresent(String.self, forKey: .letra)
        autorizado = try response.decodeIfPresent(Int.self, forKey: .autorizado)
        nota = try response.decodeIfPresent(String.self, forKey: .nota)
        llevado = try response.decodeIfPresent(Int.self, forKey: .llevado)
        regular = try response.decodeIfPresent(Int.self, forKey: .regular)
        codigo = try response.decodeIfPresent(String.self, forKey: .codigo)
        aprobado = try response.decodeIfPresent(Bool.self, forKey: .aprobado)
        idDetails = try response.decodeIfPresent(Int.self, forKey: .idDetails)
            
    }
}
