//
//  Authentification.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/27/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

struct Authentification
{
    var respuesta: String?
    var observacion: String?
    var usuario: User?
    
    enum CodingKeys: String, CodingKey {
         case respuesta = "rpta"
         case observacion
         case usuario = "user"
    }
    
}
extension Authentification : Decodable {
    
    init(from decoder: Decoder) throws {
        let response = try decoder.container(keyedBy: CodingKeys.self)
        
        respuesta = try response.decodeIfPresent(String.self, forKey: .respuesta)
        observacion = try response.decodeIfPresent(String.self, forKey: .observacion)
        usuario = try! response.decodeIfPresent(User.self, forKey: .usuario)
    }
    /*
        {
            "rpta": "OK",
            "observacion": "Acceso Existoso",
            "user": {
                "estado": "ACT",
                "idPersona": 39041,
                "alumno": [
                    {
                        "codigo": "19689003",
                        "tipo": "Posgrado",
                        "yearCicloAcademico": 1969,
                        "situacion": "Desertor",
                        "carreraId": 32,
                        "carreraCodigo": "090",
                        "carreraNombre": "Escuela de Post-Grado",
                        "tipoCodigo": "EPG",
                        "idAlumno": 76500
                    },
                    {
                        "codigo": "19676038",
                        "tipo": "Posgrado",
                        "yearCicloAcademico": 1969,
                        "situacion": "Desertor",
                        "carreraId": 103,
                        "carreraCodigo": "03",
                        "carreraNombre": "Entomología",
                        "tipoCodigo": "EPG",
                        "idAlumno": 59154
                    },
                    {
                        "codigo": "19620336",
                        "tipo": "Pregrado",
                        "yearCicloAcademico": 1967,
                        "situacion": "Egresado",
                        "carreraId": 6,
                        "carreraCodigo": "010",
                        "carreraNombre": "Agronomía",
                        "tipoCodigo": "PRE",
                        "idAlumno": 76263
                    }
                ],
                "id": 2861
            }
        }
        */
    
}
