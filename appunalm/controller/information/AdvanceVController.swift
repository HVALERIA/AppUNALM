//
//  AdvanceVController.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/30/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

import UIKit

class AdvanceVController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    

    @IBOutlet weak var tableView: UITableView!
    let network = InformationNetwork()
    
    var items: [AdvanceCell] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        Inicialize()
        // Do any additional setup after loading the view.
    }
    
    func Inicialize(){
        
        do {
            if Funcions.isConnectedToNetwork() {
                //let id = "28114"
                let id =  UserDefaults.standard.string(forKey: Constants.alumno)!
                print("Code: \(id)")
                network.curricula(byId: id){ (credit) in
                   
                    if(credit != nil){
                        
                        let malla = credit?.malla?.ciclo ?? []
                        
                        for f in malla {
                            
                            let row = AdvanceCell(ciclo: f.ciclo?.description ?? "", total: f.total?.description ?? "", llevado: f.llevados?.description ?? "", curso: f.curso ?? [],curso1: "",curso2: "",curso3: "",curso4: "",curso5: "",curso6: "",credito1: "",credito2: "",credito3: "",credito4: "",credito5: "",credito6: "",estado1: "",estado2: "",estado3: "",estado4: "",estado5: "",estado6: "")
                            
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
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdvanceTVCell", for: indexPath) as! AdvanceTVCell
        
        cell.setAdvance(cell: row)
        return cell
    }
     
}
