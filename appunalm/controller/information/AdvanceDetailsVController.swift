//
//  AdvanceDetailsVController.swift
//  appunalm
//
//  Created by Valeria H. Choque on 11/12/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

import UIKit

class AdvanceDetailsVController: UIViewController,  UITableViewDelegate, UITableViewDataSource  {
    

    let network = InformationNetwork()
    
    @IBOutlet weak var tableView: UITableView!
    
    var items: [AdvanceDetailCell] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
        self.Inicialize()
    }
    
    func Inicialize() {
        do {
            if Funcions.isConnectedToNetwork() {
                var alumno = "\(UserDefaults.standard.string(forKey: Constants.alumno)!)"
                var curso = "\(UserDefaults.standard.string(forKey: Constants.curso)!)"
                
                
                network.advanceDetail(byId: alumno, byId: curso){ (detail) in
                    if (detail != nil){
                        
                        /*
                        let row = AdvanceDetailCell(breve: detail.estado , curso: detail?.nombre , codigo: detail?.codigo, creCurso: detail?.creditos, requisito: detail?.prerequisito, creRequisito: detail?.registrado, aula: "", fecha: "", estado: detail?.estado) */
                        let item = AdvanceDetailCell(breve: detail!.estado!, curso: detail!.nombre! , codigo: "", creCurso: "\(detail!.creditos!)", requisito: "", creRequisito: "\(detail!.creditos!)", aula: "", fecha: "", estado: "")
                        
                        self.items.append(item)
                    }
                    
                    self.tableView.reloadData()
                    
                }
            } else {
                ShowAlert.ShowAlertError(title: " " ,message: Constants.msg_internet)
            }
        } catch is NSException {
            ShowAlert.ShowAlertError(title: Constants.title_error ,message: Constants.msg_error)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdvanceDetailsTVCell", for: indexPath) as! AdvanceDetailsTVCell
        cell.setDetail(cell: row)
        //cell.navigationController = self.navigationController
        //cell.setAdvance(cell: row)
        return cell
    }
    
}
