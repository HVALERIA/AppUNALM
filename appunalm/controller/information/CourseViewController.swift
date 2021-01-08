//
//  CourseViewController.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/30/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class CourseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var vwHeader: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblCarrera: UILabel!
    @IBOutlet weak var lblCiclo: UILabel!
    @IBOutlet weak var lblPromedio: UILabel!
    
    let network = InformationNetwork()
    let activityData = ActivityData()
    var items: [CourseCell] = []
    
    private let presentingIndicatorTypes = {
           return NVActivityIndicatorType.allCases.filter { $0 != .blank }
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.vwHeader.layer.cornerRadius = 8
        tableView.delegate = self
        tableView.dataSource = self
        
        let size = CGSize(width: 30, height: 30)
        let selectedIndicatorIndex = 16
        let indicatorType = presentingIndicatorTypes[selectedIndicatorIndex]
       
        self.loadingOpen()
        Inicialize()
        // Do any additional setup after loading the view.
    }
    
    func Inicialize() {
        //let alumno = "30154"
        //let ciclo = "394"
        do {
            self.lblCarrera.text = "Carrera: \(UserDefaults.standard.string(forKey: Constants.carrera)!)"
            
            if Funcions.isConnectedToNetwork() {
                let alumno = UserDefaults.standard.string(forKey: Constants.alumno)!
                let ciclo = UserDefaults.standard.string(forKey: Constants.ciclo)!
                var estado = "Desaprobado"
                network.courseLista(byId: alumno, byId: ciclo){ (graduate) in
                    if (graduate != nil) {
                       
                        /*
                        self.lblCarrera.text = "Carrera: \(Funcions.Separator(cadena: graduate!.carrera!, valor: ":")[2])"
                        */
                        
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
            
            self.loagingClose()
        
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
    
    func loadingOpen(){
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
    }
    
    func loagingClose (){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3 ) {
            //self.stopAnimating(nil)
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
        }
    }

}
