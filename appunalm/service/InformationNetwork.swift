//
//  InformationNetwork.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/29/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

import UIKit
import Alamofire

class InformationNetwork: NSObject {

    func Resumen(byId IdAlumno: String, completion: @escaping (HistorySummary?) -> Void) {
        let url = String(format: "\(ApiClient.domain)alumno/%@/resumenhistorial", IdAlumno)
        print(url)
        
        Alamofire.request(url).response { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(HistorySummary.self, from: data)
                completion(response)
            } catch let error {
                print(error)
                completion(nil)
            }
        }
    }
    
    func Listado(byId IdAlumno: String, completion: @escaping ([Graduate]?) -> Void) {
        let url = String(format: "\(ApiClient.domain)alumno/%@/ciclo", IdAlumno)
        print(url)
        
        Alamofire.request(url).response { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode([Graduate].self, from: data)
                completion(response)
            } catch let error {
                print("Listado Error: \(error)")
                completion(nil)
            }
        }
    }
    
    func courseLista(byId IdAlumno: String, byId IdCiclo: String, completion: @escaping (GraduateDetails?) -> Void) {
        let url = String(format: "\(ApiClient.domain)alumno/%@/ciclo/%@", IdAlumno, IdCiclo)
        print(url)
        
        Alamofire.request(url).response { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(GraduateDetails.self, from: data)
                completion(response)
            } catch let error {
                print("Listado Error: \(error)")
                completion(nil)
            }
        }
    }
    
    func curriculaSummary(byId IdAlumno: String, completion: @escaping ([CreditSummary]?) -> Void) {
        let url = String(format: "\(ApiClient.domain)alumno/%@/resumencreditos", IdAlumno)
        print(url)
        
        Alamofire.request(url).response { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode([CreditSummary].self, from: data)
                completion(response)
            } catch let error {
                print("Listado Error: \(error)")
                completion(nil)
            }
        }
    }
    
    func curricula(byId IdAlumno: String, completion: @escaping (Credit?) -> Void) {
           let url = String(format: "\(ApiClient.domain)alumno/%@/curricula", IdAlumno)
           print(url)
           
           Alamofire.request(url).response { response in
               guard let data = response.data else { return }
               do {
                   let decoder = JSONDecoder()
                   let response = try decoder.decode(Credit.self, from: data)
                   print("Curricula exito")
                   completion(response)
               } catch let error {
                   print("Curricula Error: \(error)")
                   completion(nil)
               }
           }
       }
    
    
    func advanceDetail(byId IdAlumno: String,byId IdCurso: String, completion: @escaping (CourseDetailAdv?) -> Void) {
        let url = String(format: "\(ApiClient.domain)alumno/%@/curso/%@", IdAlumno, IdCurso)
        print(url)
        
        Alamofire.request(url).response { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(CourseDetailAdv.self, from: data)
                completion(response)
            } catch let error {
                print(error)
                completion(nil)
            }
        }
    }
       
    
}
