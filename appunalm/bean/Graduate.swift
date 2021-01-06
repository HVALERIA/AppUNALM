//
//  Graduate.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/29/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

struct Graduate {
    let year: Int?
    let codigo: String?
    let descripcion: String?
    let ciclo: Int?
    let acumulado: Int?
    let promedioCiclo: Double?
    let promedio: Double?
    let puntaje: Int?
    let aprobado: Int?
    let carrera: String?
    let id: Int?
    let curso: [Course]?
    
    enum CodingKeys: String, CodingKey {
        case year
        case codigo
        case descripcion
        case ciclo = "creditosCursadosCiclo"
        case acumulado = "creditosAprobadosAcumulados"
        case promedioCiclo
        case promedio = "promedioAcumulado"
        case puntaje = "puntajeAcumulado"
        case aprobado = "cursosAprobados"
        case carrera
        case id
        case curso = "cursos"
    }
}
extension Graduate: Decodable {
    init(from decoder: Decoder) throws {
           let response = try decoder.container(keyedBy: CodingKeys.self)
        
           year = try response.decodeIfPresent(Int.self, forKey: .year)
           codigo = try response.decodeIfPresent(String.self, forKey: .codigo)
           descripcion = try response.decodeIfPresent(String.self, forKey: .descripcion)
           ciclo = try response.decodeIfPresent(Int.self, forKey: .ciclo)
           acumulado = try response.decodeIfPresent(Int.self, forKey: .acumulado)
           promedioCiclo = try response.decodeIfPresent(Double.self, forKey: .promedioCiclo)
           promedio = try response.decodeIfPresent(Double.self, forKey: .promedio)
           puntaje = try response.decodeIfPresent(Int.self, forKey: .puntaje)
           aprobado = try response.decodeIfPresent(Int.self, forKey: .aprobado)
           carrera = try response.decodeIfPresent(String.self, forKey: .carrera)
           id = try response.decodeIfPresent(Int.self, forKey: .id)
           curso = try response.decodeIfPresent([Course].self, forKey: .curso)
      }
}

struct GraduateDetails {
    let year: Int?
    let codigo: String?
    let tipo: String?
    let nivel: Int?
    let anula:  Int?
    let nroCiclo: String?
    let descripcion: String?
    //let semana: String?
   /* let quintoFaculta: String?
    let quintoCarrera: String?
    let tercioCiclo: String?
    let tercioFaculta: String?
    let creditoCursado: Int?
    let creditoAprobado: Int?
    let creditoAcumulado: Int?
    let convalidado: Int? */
    let ciclo: Double?
   /* let metrico: Double?
    let acumulado: Double?
    let puntajeCiclo: Int?
    let puntajeAcumulado: Int?
    let inscrito: Int?
    let aprobado: Int?
    let ordenCiclo: String?
    let ordenFacultad: String?
    let ordenCarrera: String?
    let cuadroCiclo: String?
    let cuadroFacultad: String?
    let cuadroCarrera: String?
    let quintoSuperior: String? */
    let carrera: String?
    let idDetail: Int?
    let curso: [CourseDetail]?
    
    enum CodingKeys: String, CodingKey {
        case year
        case codigo
        case tipo
        case nivel
        case anula = "motivoAnulacion"
        case nroCiclo = "numeroCiclo"
        case descripcion
       // case semana = "semanasClases"
        /*case quintoFaculta = "quintoSuperiorFacultad"
        case quintoCarrera = "quintoSuperiorCarrera"
        case tercioCiclo = "tercioSuperiorCiclo"
        case tercioFaculta = "tercioSuperiorFacultad"
        case creditoCursado = "creditosCursadosCiclo"
        case creditoAprobado = "creditosAprobadosCiclo"
        case creditoAcumulado = "creditosAprobadosAcumulados"
        case convalidado = "creditosConvalidados" */
        case ciclo = "promedioCiclo"
     /*   case metrico = "promedioCicloMerito"
        case acumulado = "promedioAcumulado"
        case puntajeCiclo
        case puntajeAcumulado
        case inscrito = "cursosInscritos"
        case aprobado = "cursosAprobados"
        case ordenCiclo = "ordenMeritoCiclo"
        case ordenFacultad = "ordenMeritoFacultad"
        case ordenCarrera = "ordenMeritoCarrera"
        case cuadroCiclo = "cuadroHonorCiclo"
        case cuadroFacultad = "cuadroHonorFacultad"
        case cuadroCarrera = "cuadroHonorCarrera"
        case quintoSuperior = "quintoSuperiorCiclo" */
        case carrera
        case idDetail = "id"
        case curso = "cursos"
    }
}
extension GraduateDetails: Decodable {
    init(from decoder: Decoder) throws {
        let response = try decoder.container(keyedBy: CodingKeys.self)
        year = try response.decodeIfPresent(Int.self, forKey: .year)
        codigo = try response.decodeIfPresent(String.self, forKey: .codigo)
        tipo = try response.decodeIfPresent(String.self, forKey: .tipo)
        nivel = try response.decodeIfPresent(Int.self, forKey: .nivel)
        anula = try response.decode(Int?.self, forKey: .anula)
        nroCiclo = try response.decodeIfPresent(String.self, forKey: .nroCiclo)
        descripcion = try response.decodeIfPresent(String.self, forKey: .descripcion)
   //     semana = try response.decode(String.self, forKey: .semana)
     /*   quintoFaculta = try response.decode(String.self, forKey: .quintoFaculta)
        quintoCarrera = try response.decode(String.self, forKey: .quintoCarrera)
        tercioCiclo = try response.decode(String.self, forKey: .tercioCiclo)
        tercioFaculta = try response.decode(String.self, forKey: .tercioFaculta)
        creditoCursado = try response.decode(Int.self, forKey: .creditoCursado)
        creditoAprobado = try response.decode(Int.self, forKey: .creditoAprobado)
        creditoAcumulado = try response.decode(Int.self, forKey: .creditoAcumulado)
        convalidado = try response.decode(Int.self, forKey: .convalidado) */
        ciclo = try response.decodeIfPresent(Double.self, forKey: .ciclo)
      /*  metrico = try response.decode(Double.self, forKey: .metrico)
        acumulado = try response.decode(Double.self, forKey: .acumulado)
        puntajeCiclo = try response.decode(Int.self, forKey: .puntajeCiclo)
        puntajeAcumulado = try response.decode(Int.self, forKey: .puntajeAcumulado)
        inscrito = try response.decode(Int.self, forKey: .inscrito)
        aprobado = try response.decode(Int.self, forKey: .aprobado)
        ordenCiclo = try response.decode(String.self, forKey: .ordenCiclo)
        ordenFacultad = try response.decode(String.self, forKey: .ordenFacultad)
        ordenCarrera = try response.decode(String.self, forKey: .ordenCarrera)
        cuadroCiclo = try response.decode(String.self, forKey: .cuadroCiclo)
        cuadroFacultad = try response.decode(String.self, forKey: .cuadroFacultad)
        cuadroCarrera = try response.decode(String.self, forKey: .cuadroCarrera)
        quintoSuperior = try response.decode(String.self, forKey: .quintoSuperior) */
        carrera = try response.decodeIfPresent(String.self, forKey: .carrera)
        idDetail = try response.decodeIfPresent(Int.self, forKey: .idDetail)
        curso = try response.decodeIfPresent([CourseDetail].self, forKey: .curso)
        
    }
}
