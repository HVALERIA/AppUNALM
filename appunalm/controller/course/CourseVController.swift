//
//  CouseVController.swift
//  appunalm
//
//  Created by Valeria H. Choque on 29/01/21.
//  Copyright © 2021 Valeria H. Choque. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class CourseVController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var Ciclo_lbl: UILabel!
    @IBOutlet weak var Facultad_lbl: UILabel!
    @IBOutlet weak var Especialidad_lbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let network = CourseNetwork()
    let activityData = ActivityData()
    
    var itemsCell: [CourseSummaryCell] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.Inicialize()
        // Do any additional setup after loading the view.
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

    
    
    func Inicialize(){
        do {
           
            self.Ciclo_lbl.text  = UserDefaults.standard.string(forKey: Constants.ciclo)!
            self.Facultad_lbl.text = UserDefaults.standard.string(forKey: Constants.carrera)!
            self.Especialidad_lbl.text = UserDefaults.standard.string(forKey: Constants.carrera)!
            
        
            self.Listar()
            self.loagingClose()
        }catch is NSException {
            ShowAlert.ShowAlertError(title: Constants.title_error ,message: Constants.msg_error)
        }
    }
    
    
    func Listar(){
        do {
       
            if Funcions.isConnectedToNetwork() {
                let alumno =  UserDefaults.standard.string(forKey: Constants.alumno)!
                network.resumen(byId: alumno){ (course) in
                    if (course != nil) {
                        for  i in course! {
                            //var credt = Funcions.NumeroCeroDecimal(valor: )
                            var numero = i.credito
                            var item = CourseSummaryCell(id: i.id!,curso: "\(i.nombre!)", clave: i.codigo!, docente: i.docente!, credito: "\(i.credito!)", ciclo: "00", aula: i.aula!)
                            //var item = CourseSummaryCell(id: 0 ,curso: "", clave: "", docente: "", credito: "00", ciclo: "", aula: "")
                            self.itemsCell.append(item)
                        }
                        self.tableView.reloadData()
                    }
                }
            } else {
                ShowAlert.ShowAlertError(title: " " ,message: Constants.msg_internet)
            }
            self.loagingClose()
        }catch is NSException {
            ShowAlert.ShowAlertError(title: Constants.title_error ,message: Constants.msg_error)
        }
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemsCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let graduate = itemsCell[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CourseCabTVCell", for: indexPath) as! CourseCabTVCell
        cell.setGraduate(cell: graduate)
        //Constants.defaults.set(authentification?.usuario?.students?[0].idAlumno!, forKey: Constants.ciclo)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(self.tableArray[indexPath.row])
        let graduate = itemsCell[indexPath.row]
        Constants.defaults.set(graduate.id, forKey: Constants.ciclo)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "DetailCourseVController") as? DetailCourseVController
        self.navigationController?.pushViewController(controller!, animated: true)
        
    }

}
