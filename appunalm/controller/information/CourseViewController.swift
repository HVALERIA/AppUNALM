//
//  CourseViewController.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/30/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

import UIKit

class CourseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblCarrera: UILabel!
    @IBOutlet weak var lblCiclo: UILabel!
    @IBOutlet weak var lblPromedio: UILabel!
    
    let network = InformationNetwork()
    var items: [CourseCell] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        Inicialize()
        // Do any additional setup after loading the view.
    }
    
    func Inicialize() {
        //let alumno = "30154"
        //let ciclo = "394"
        do {
            if Funcions.isConnectedToNetwork() {
                let alumno = UserDefaults.standard.string(forKey: Constants.alumno)!
                let ciclo = UserDefaults.standard.string(forKey: Constants.ciclo)!
                var estado = "Desaprobado"
                network.courseLista(byId: alumno, byId: ciclo){ (graduate) in
                    if (graduate != nil) {
                       
                        self.lblCarrera.text = graduate?.carrera
                        self.lblCiclo.text = "Ciclo: \(graduate!.nroCiclo!)º"
                        let prom = String(format: "%.2f", graduate?.ciclo! as! CVarArg)
                        self.lblPromedio.text = "Promedio: \(prom)"
                        
                        let lista = graduate?.curso ?? []
                        for c in lista {
                            
                            if (c.aprobado!)
                            {
                                //estado = "Aprobado"
                                estado = "Habilitado"
                            }
                            
                            var row = CourseCell(letra: c.letra ?? "", nombre: c.breve ?? "", codigo: c.codigo ?? "", credito: "\(c.credito!)", estado: estado, promedio: c.nota?.description ?? "")
                            self.items.append(row)
                        }
                        self.tableView.reloadData()
                    }
                }
            
            } else {
                ShowAlert.ShowAlertError(title: " " ,message: Constants.msg_internet)
            }
        
        } catch is NSException {
            ShowAlert.ShowAlertError(title: Constants.title_error ,message: Constants.msg_error)
        }
    }
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let course = self.items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CourseTVCell", for: indexPath) as! CourseTVCell
        
        cell.setCourse(cell: course)
        
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
