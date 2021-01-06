//
//  Cell.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/29/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

import Foundation

class Cell {
}

class GraduateCell {
    var id: Int
    var ciclo: String
    var promedio: String
    var cursos: [Course]
    
    init(id: Int, ciclo: String, promedio: String, cursos:[Course]){
        self.id = id
        self.ciclo = ciclo
        self.promedio = promedio
        self.cursos = cursos
    }
}

class CourseCell {
    var letra: String
    var nombre: String
    var codigo: String
    var credito: String
    var estado: String
    var promedio: String
    
    init(letra: String, nombre: String, codigo: String, credito: String, estado: String, promedio: String){
           self.letra = letra
           self.nombre = nombre
           self.codigo = "Codigo de curso: \(codigo)"
           self.credito = "Creditos: \(credito)"
           self.estado = "Estado: \(estado)"
           self.promedio = "Promedio ponderado: \(promedio)"
    }
}

class AdvanceCell {
    var ciclo: String
    var total: String
    var llevado: String
    var curso: [CourseMesh]
    
    var curso1:String?
    var curso2:String?
    var curso3:String?
    var curso4:String?
    var curso5:String?
    var curso6:String?
    
    var credito1: String?
    var credito2: String?
    var credito3: String?
    var credito4: String?
    var credito5: String?
    var credito6: String?
    
    var estado1: String?
    var estado2: String?
    var estado3: String?
    var estado4: String?
    var estado5: String?
    var estado6: String?
    
    init(ciclo: String, total: String, llevado: String, curso: [CourseMesh],
         curso1: String, curso2: String, curso3: String, curso4: String, curso5: String, curso6: String,
         credito1: String, credito2: String, credito3: String, credito4: String, credito5: String, credito6: String,
         estado1: String, estado2: String, estado3: String, estado4: String, estado5: String, estado6: String) {
        
        print("Cargando cell")
        var option: String
        var estado: String = ""
        
        self.ciclo = ciclo
        self.total = total
        self.llevado = llevado
        self.curso = curso
        
        for var i in 0...curso.count-1
        {
            option = "No"
            if curso[i].estado != nil { estado = curso[i].estado! }
            if( estado == "Habilitado") { option = "Si" }
            
            if (i == 0){
                self.curso1 = curso[i].nombre ?? ""
                self.credito1 = curso[i].credito?.description ?? "0"
                self.estado1 = option
            }
            
            if (i == 1){
                self.curso2 = curso[i].nombre ?? ""
                self.credito2 = curso[i].credito?.description ?? "0"
                self.estado2 = option
            }
            
            if (i == 2){
                self.curso3 = curso[i].nombre ?? ""
                self.credito3 = curso[i].credito?.description ?? "0"
                self.estado3 = option
            }
            
            if (i == 4){
                self.curso4 = curso[i].nombre ?? ""
                self.credito4 = curso[i].credito?.description ?? "0"
                self.estado4 = option
            }
            
            if (i == 5){
               self.curso5 = curso[i].nombre ?? ""
               self.credito5 = curso[i].credito?.description ?? "0"
               self.estado5 = option
            }
           
            if (i == 6){
               self.curso6 = curso[i].nombre ?? ""
               self.credito6 = curso[i].credito?.description ?? "0"
               self.estado6 = option
            }
        }
        print("Fin cell")
    }
    
}
