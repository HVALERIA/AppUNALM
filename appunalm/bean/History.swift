//
//  History.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/29/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

import UIKit

struct HistorySummary {
    let estado: String?
    let codigo: String?
    let cursados: Int?
    let aprobados: Int?
    let creditosCursados: Int?
    let creditosAprobados: Int?
    let inscritos: Int?
    let cursosAprobados: Int?
    let promedioAcumulado: Double?
    let cursosInscrito: Int?
    let cursosAprobado: Int?
    let carreraAcumulado: Decimal?
    let id: Int?
    
    enum CodingKeys: String, CodingKey {
        case estado
        case codigo
        case cursados = "creditosCursados"
        case aprobados = "creditosAprobados"
        case creditosCursados = "creditosCarreraCursados"
        case creditosAprobados = "creditosCarreraAprobados"
        case inscritos = "cursosCarreraInscritos"
        case cursosAprobados = "cursosCarreraAprobados"
        case promedioAcumulado
        case cursosInscrito = "cursosInscritos"
        case cursosAprobado = "cursosAprobados"
        case carreraAcumulado = "promedioCarreraAcumulado"
        case id
    }
    
}
extension HistorySummary: Decodable {
    
    init(from decoder: Decoder) throws {
         let response = try decoder.container(keyedBy: CodingKeys.self)
         estado = try response.decodeIfPresent(String.self, forKey: .estado)
         codigo = try response.decodeIfPresent(String.self, forKey: .codigo)
         cursados = try response.decodeIfPresent(Int.self, forKey: .cursados)
         aprobados = try response.decodeIfPresent(Int.self, forKey: .aprobados)
         creditosCursados = try response.decodeIfPresent(Int.self, forKey: .creditosCursados)
         creditosAprobados = try response.decodeIfPresent(Int.self, forKey: .creditosAprobados)
         inscritos = try response.decodeIfPresent(Int.self, forKey: .inscritos)
         cursosAprobados = try response.decodeIfPresent(Int.self, forKey: .cursosAprobados)
         promedioAcumulado = try response.decodeIfPresent(Double.self, forKey: .promedioAcumulado)
         cursosInscrito = try response.decodeIfPresent(Int.self, forKey: .cursosInscrito)
         cursosAprobado = try response.decodeIfPresent(Int.self, forKey: .cursosAprobado)
         carreraAcumulado = try response.decodeIfPresent(Decimal.self, forKey: .carreraAcumulado)
         id = try response.decodeIfPresent(Int.self, forKey: .id)
    }
}
