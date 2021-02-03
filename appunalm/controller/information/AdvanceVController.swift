//
//  AdvanceVController.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/30/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class AdvanceVController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
  
    @IBOutlet weak var lblCarrera: UILabel!
    @IBOutlet weak var vwHeader: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var lblEstudio: UILabel!
    @IBOutlet weak var lblFacultad: UILabel!
    @IBOutlet weak var lblEspecialidad: UILabel!
    @IBOutlet weak var lblElectivo: UILabel!
    
    
    let network = InformationNetwork()
    
    var items: [AdvanceCell] = []
    let activityData = ActivityData()
    
    private let presentingIndicatorTypes = {
           return NVActivityIndicatorType.allCases.filter { $0 != .blank }
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vwHeader.layer.cornerRadius = 8
        
        self.limpiar()
        
        let size = CGSize(width: 30, height: 30)
        let selectedIndicatorIndex = 16
        let indicatorType = presentingIndicatorTypes[selectedIndicatorIndex]
        
        tableView.delegate = self
        tableView.dataSource = self
        
        loadingOpen()
        Inicialize()
        // Do any additional setup after loading the view.
    }
    
    func limpiar() {
        self.lblCarrera.text = "Carrera: "
        self.lblEstudio.text = "00/00"
        self.lblFacultad.text = "00/00"
        self.lblEspecialidad.text = "00/00"
        self.lblElectivo.text = "00/00"
    }
    
    func Inicialize(){
        
        do {
            self.lblCarrera.text = "Carrera: \(UserDefaults.standard.string(forKey: Constants.carrera)!)"
            
            if Funcions.isConnectedToNetwork() {
                //let id = "28114"
                let id =  UserDefaults.standard.string(forKey: Constants.alumno)!
                print("Code: \(id)")
                network.curricula(byId: id){ (credit) in
                   
                    if (credit != nil) {
                        
                        let malla = credit?.malla?.ciclo ?? []
                        
                        for f in malla {
                            
                            let row = AdvanceCell(ciclo: f.ciclo?.description ?? "", total: f.total?.description ?? "", llevado: f.llevados?.description ?? "", curso: f.curso ?? [],curso1: "",curso2: "",curso3: "",curso4: "",curso5: "",curso6: "",credito1: "",credito2: "",credito3: "",credito4: "",credito5: "",credito6: "",estado1: "",estado2: "",estado3: "",estado4: "",estado5: "",estado6: "")
                            
                            self.items.append(row)
                            
                        }
                        
                        self.tableView.reloadData()
                        
                    }
                    
                    self.network.curriculaSummary(byId: id){ (summary) in
                        
                        if summary != nil {
                            self.lblEstudio.text = "\(Funcions.NumeroCeroDecimal(valor: summary![0].llevados!))/\(Funcions.NumeroCeroDecimal(valor: summary![0].total!))"
                            self.lblFacultad.text = "\(Funcions.NumeroCeroDecimal(valor: summary![1].llevados!))/\(Funcions.NumeroCeroDecimal(valor: summary![1].total!))"
                            self.lblEspecialidad.text = "\(Funcions.NumeroCeroDecimal(valor: summary![2].llevados!))/\(Funcions.NumeroCeroDecimal(valor: summary![2].total!))"
                            self.lblElectivo.text = "\(Funcions.NumeroCeroDecimal(valor: summary![3].llevados!))/\(Funcions.NumeroCeroDecimal(valor: summary![3].total!))"
                        }
                    }
                }
                
                loagingClose()
            
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
        cell.navigationController = self.navigationController
        cell.setAdvance(cell: row)
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
