//
//  Curriculum.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/30/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

import UIKit

struct Curriculum {
    let typeCurricula: TypeMesh?
    let carrera: String?
    let malla: [Mesh]?
    let idCurriculum: Int?
    
    enum CodingKeys: String, CodingKey {
        case typeCurricula = "tipoCursoCurricula"
        case carrera
        case malla = "mallaCurricular"
        case idCurriculum = "id"
           
    }
}
extension Curriculum: Decodable {
    init(from decoder: Decoder) throws {
        let response = try decoder.container(keyedBy: CodingKeys.self)
        typeCurricula = try response.decodeIfPresent(TypeMesh.self, forKey: .typeCurricula)
        carrera = try response.decodeIfPresent(String.self, forKey: .carrera)
        malla = try response.decodeIfPresent([Mesh].self, forKey: .malla)
        idCurriculum = try response.decodeIfPresent(Int.self, forKey: .idCurriculum)
    }
}

struct TypeMesh {
    let general: General?
    let obligatorio: General?
    let deportivo: General?
    let electivo: General?
    
    enum CodingKeys: String, CodingKey {
         case general
         case obligatorio
         case deportivo = "Deportivo y/o Cultural"
         case electivo = "Electivo de carrera"
    }
}
extension TypeMesh: Decodable {
    
    init(from decoder: Decoder) throws {
        let response = try decoder.container(keyedBy: CodingKeys.self)
        general = try response.decodeIfPresent(General.self, forKey: .general)
        obligatorio = try response.decodeIfPresent(General.self, forKey: .obligatorio)
        deportivo = try response.decodeIfPresent(General.self, forKey: .deportivo)
        electivo = try response.decodeIfPresent(General.self, forKey: .electivo)
    }
}
struct Mesh {
    let ciclo: [GraduateCurricula]?
    
    enum CodingKeys: String, CodingKey {
        case ciclo = "ciclos"
    }
}
extension Mesh: Decodable {
    
    init(from decoder: Decoder) throws {
        let response = try decoder.container(keyedBy: CodingKeys.self)
        ciclo = try response.decode([GraduateCurricula].self, forKey: .ciclo)
    }
}
struct GraduateCurricula {
    let ciclo: Int?
    let total: Int?
    let llevados: Int?
    let curso: [CourseMesh]?
    enum CodingKeys: String, CodingKey {
        case ciclo = "numeroCiclo"
        case total = "creditosTotal"
        case llevados = "creditosLlevados"
        case curso = "cursos"
    }
    
}
extension GraduateCurricula: Decodable {
    init(from decoder: Decoder) throws {
        let response = try decoder.container(keyedBy: CodingKeys.self)
        ciclo = try response.decodeIfPresent(Int.self, forKey: .ciclo)
        total = try response.decodeIfPresent(Int.self, forKey: .total)
        llevados = try response.decodeIfPresent(Int.self, forKey: .llevados)
        curso = try response.decodeIfPresent([CourseMesh].self, forKey: .curso)
    }
}

struct CourseMesh {
    let estado: String?
    let codigo: String?
    let nombre: String?
    let credito: Int?
    let breve: String?
    let registrado: Bool?
    let letra: String?
    let id: Int?
    
    enum CodingKeys: String, CodingKey {
        case estado
        case codigo
        case nombre
        case credito = "creditos"
        case breve = "nombreCortocaracter"
        case registrado
        case letra = "primerasLetras"
        case id
    }
    
}
extension CourseMesh: Decodable {
    init(from decoder: Decoder) throws {
        let response = try decoder.container(keyedBy: CodingKeys.self)
        estado = try response.decodeIfPresent(String.self, forKey: .estado)
        codigo = try response.decodeIfPresent(String.self, forKey: .codigo)
        nombre = try response.decodeIfPresent(String.self, forKey: .nombre)
        credito = try response.decodeIfPresent(Int.self, forKey: .credito)
        breve = try response.decodeIfPresent(String.self, forKey: .breve)
        registrado = try response.decodeIfPresent(Bool.self, forKey: .registrado)
        letra = try response.decodeIfPresent(String.self, forKey: .letra)
        id = try response.decodeIfPresent(Int.self, forKey: .id)
    }
}
