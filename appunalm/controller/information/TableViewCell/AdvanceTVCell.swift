//
//  AdvanceTVCell.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/30/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

import UIKit

class AdvanceTVCell: UITableViewCell {

    @IBOutlet weak var lblCiclo: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblLlevado: UILabel!
    
    @IBOutlet weak var lblCurso1: UILabel!
    @IBOutlet weak var lblCurso2: UILabel!
    @IBOutlet weak var lblCurso3: UILabel!
    @IBOutlet weak var lblCurso4: UILabel!
    @IBOutlet weak var lblCurso5: UILabel!
    @IBOutlet weak var lblCurso6: UILabel!
    
    @IBOutlet weak var lblCredito1: UILabel!
    @IBOutlet weak var lblCredito2: UILabel!
    @IBOutlet weak var lblCredito3: UILabel!
    @IBOutlet weak var lblCredito4: UILabel!
    @IBOutlet weak var lblCredito5: UILabel!
    @IBOutlet weak var lblCredito6: UILabel!
    
    @IBOutlet weak var lblEstado1: UILabel!
    @IBOutlet weak var lblEstado2: UILabel!
    @IBOutlet weak var lblEstado3: UILabel!
    @IBOutlet weak var lblEstado4: UILabel!
    @IBOutlet weak var lblEstado5: UILabel!
    @IBOutlet weak var lblEstado: UILabel!
     
    @IBOutlet weak var imgContrl1: UIImageView!
    @IBOutlet weak var imgContrl2: UIImageView!
    @IBOutlet weak var imgContrl3: UIImageView!
    @IBOutlet weak var imgContrl4: UIImageView!
    @IBOutlet weak var imgContrl5: UIImageView!
    @IBOutlet weak var imgContrl6: UIImageView!
    
    
    func setAdvance(cell: AdvanceCell){
        print("Cargando Viewcell")
        
        lblCiclo.text = "Ciclo: \(cell.ciclo)º"
        lblTotal.text = "\(cell.total)"
        lblLlevado.text = "\(cell.llevado)"
        
        lblCurso1.text = cell.curso1
        lblCurso2.text = cell.curso2
        lblCurso3.text = cell.curso3
        lblCurso4.text = cell.curso4
        lblCurso5.text = cell.curso5
        lblCurso6.text = cell.curso6
        
        lblCredito1.text = cell.credito1
        lblCredito2.text = cell.credito2
        lblCredito3.text = cell.credito3
        lblCredito4.text = cell.credito4
        lblCredito5.text = cell.credito5
        lblCredito6.text = cell.credito6
        
        lblEstado1.text = cell.estado1
        lblEstado2.text = cell.estado2
        lblEstado3.text = cell.estado3
        lblEstado4.text = cell.estado4
        lblEstado5.text = cell.estado5
        lblEstado.text = cell.estado6
        
        if ((cell.curso1?.isEmpty) == nil) { imgContrl1.isHidden = true }
        if ((cell.curso2?.isEmpty) == nil) { imgContrl2.isHidden = true }
        if ((cell.curso3?.isEmpty) == nil) { imgContrl3.isHidden = true }
        if ((cell.curso4?.isEmpty) == nil) { imgContrl4.isHidden = true }
        if ((cell.curso5?.isEmpty) == nil) { imgContrl5.isHidden = true }
        if ((cell.curso6?.isEmpty) == nil) { imgContrl6.isHidden = true }
        
        //let tapGestureFc = UITapGestureRecognizer(target: self, action: #selector(handleTapInfo(sender:)))
        
        print("Fin Viewcell")
    }
    
    /*
    @objc func handleTapInfo(sender: UITapGestureRecognizer){
        do{
            if Funcions.isConnectedToNetwork() {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "ResumenVController") as? ResumenVController
               
                self.navigationController?.pushViewController(controller!, animated: true)
            } else{
                ShowAlert.ShowAlertError(title: " " ,message: Constants.msg_internet)
            }
        } catch is NSException {
            ShowAlert.ShowAlertError(title: " " ,message: Constants.msg_error)
        }
    }*/
}
