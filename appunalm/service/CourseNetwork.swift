//
//  CourseNetwork.swift
//  appunalm
//
//  Created by Valeria H. Choque on 30/01/21.
//  Copyright © 2021 Valeria H. Choque. All rights reserved.
//

import UIKit
import Alamofire

class CourseNetwork: NSObject {
    func resumen(byId IdAlumno: String, completion: @escaping ([CourseSummary]?) -> Void) {
        let url = String(format: "\(ApiClient.domain)alumno/%@/matricula/", IdAlumno)
        print(url)
        
        Alamofire.request(url).response { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode([CourseSummary].self, from: data)
                completion(response)
            } catch let error {
                print(error)
                completion(nil)
            }
        }
    }
 
    //: http://200.4.215.35:8088/v1/alumno/28167/evaluacion/615/
    func detail(byId IdAlumno: String, IdCurso: String, completion: @escaping (CourseDetail?) -> Void) {
        let url = String(format: "\(ApiClient.domain)alumno/%@/evaluacion/%@/", IdAlumno,IdCurso)
        print(url)
        
        Alamofire.request(url).response { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(CourseDetail.self, from: data)
                completion(response)
            } catch let error {
                print(error)
                completion(nil)
            }
        }
    }
}
