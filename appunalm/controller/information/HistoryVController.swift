//
//  HistoryVController.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/29/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

import UIKit

class HistoryVController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var lblCursados: UILabel!
    @IBOutlet weak var lblAprobados: UILabel!
    @IBOutlet weak var lblAcumulado: UILabel!
    @IBOutlet weak var lblPonderado: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    let network = InformationNetwork()
    var itemsCell: [GraduateCell] = []
    
    //let table = GraduateTVController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self

        Inicialize()

        // Do any additional setup after loading the view.
    }
    
    func Inicialize(){
        //let id = "28114"
        
        do {
            if Funcions.isConnectedToNetwork() {
                let id = UserDefaults.standard.string(forKey: Constants.alumno)!
                network.Resumen(byId: id) { (historysummary) in
                    if (historysummary != nil) {
                        self.lblCursados.text = historysummary?.cursados?.description
                        self.lblAprobados.text = historysummary?.aprobados?.description
                        self.lblAcumulado.text = historysummary?.cursosAprobado?.description
                        let prom = String(format: "%.1f", historysummary?.promedioAcumulado! as! CVarArg)
                        self.lblPonderado.text = prom
                        //print(historysummary?.promedioAcumulado)
                        //print(prom)
                        
                        self.listado()
                       
                    }
                }
            } else {
                ShowAlert.ShowAlertError(title: " " ,message: Constants.msg_internet)
            }
        
        } catch is NSException {
            ShowAlert.ShowAlertError(title: Constants.title_error ,message: Constants.msg_error)
        }
    }
    
    func listado()  {
        //let id = "30154"
        do {
            if Funcions.isConnectedToNetwork() {
                
                let id = UserDefaults.standard.string(forKey: Constants.alumno)!
                //var items: [GraduateCell] = []
                network.Listado(byId: id){(graduate) in
                    if(graduate != nil){
                    
                        for  i in graduate! {
                            //print("Ciclo: \(i.descripcion), promedio: \(i.promedio?.description)")
                            var ciclo:String = Funcions.ConvertirNumero(cadena: i.descripcion!)
                            var prom:String = String(format: "%.1f", i.promedio! as! CVarArg)
                            
                            var item = GraduateCell(id: i.id!, ciclo: ciclo, promedio: prom, cursos: i.curso ?? [])
                            self.itemsCell.append(item)
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
        return self.itemsCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let graduate = itemsCell[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "GraduateTVCell", for: indexPath) as! GraduateTVCell
        cell.setGraduate(cell: graduate)
        //Constants.defaults.set(authentification?.usuario?.students?[0].idAlumno!, forKey: Constants.ciclo)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(self.tableArray[indexPath.row])
        let graduate = itemsCell[indexPath.row]
        Constants.defaults.set(graduate.id, forKey: Constants.ciclo)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "CourseViewController") as? CourseViewController
        self.navigationController?.pushViewController(controller!, animated: true)
        
    }
    

}
