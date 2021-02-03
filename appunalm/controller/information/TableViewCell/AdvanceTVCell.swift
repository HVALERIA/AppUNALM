//
//  AdvanceTVCell.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/30/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

import UIKit


class AdvanceTVCell: UITableViewCell {
    //var delegate:AdvanceTVCellDelegate!
    //var myViewController: AdvanceVController!
    
    var navigationController:UINavigationController!
    
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
    @IBOutlet weak var vwHeader: UIView!
    
    
    func setAdvance(cell: AdvanceCell){
        print("Cargando Viewcell")
        vwHeader.layer.cornerRadius = 8
        
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
        
        lblEstado1.text = cell.estado1!.uppercased()
        lblEstado2.text = cell.estado2!.uppercased()
        lblEstado3.text = cell.estado3!.uppercased()
        lblEstado4.text = cell.estado4!.uppercased()
        lblEstado5.text = cell.estado5!.uppercased()
        lblEstado.text = cell.estado6!.uppercased()
        
        if ((cell.curso1?.isEmpty) == nil) { imgContrl1.isHidden = true }
        if ((cell.curso2?.isEmpty) == nil) { imgContrl2.isHidden = true }
        if ((cell.curso3?.isEmpty) == nil) { imgContrl3.isHidden = true }
        if ((cell.curso4?.isEmpty) == nil) { imgContrl4.isHidden = true }
        if ((cell.curso5?.isEmpty) == nil) { imgContrl5.isHidden = true }
        if ((cell.curso6?.isEmpty) == nil) { imgContrl6.isHidden = true }
        
        let tapGestureFc1 = UITapGestureRecognizer(target: self, action: #selector(handleTapInfo1(sender:)))
        let tapGestureFc2 = UITapGestureRecognizer(target: self, action: #selector(handleTapInfo2(sender:)))
        let tapGestureFc3 = UITapGestureRecognizer(target: self, action: #selector(handleTapInfo3(sender:)))
        let tapGestureFc4 = UITapGestureRecognizer(target: self, action: #selector(handleTapInfo4(sender:)))
        let tapGestureFc5 = UITapGestureRecognizer(target: self, action: #selector(handleTapInfo5(sender:)))
        let tapGestureFc6 = UITapGestureRecognizer(target: self, action: #selector(handleTapInfo6(sender:)))
        
        if ((cell.curso1?.isEmpty) != nil) {
            imgContrl1.isUserInteractionEnabled = true
            imgContrl1.addGestureRecognizer(tapGestureFc1)
            imgContrl1.tag = cell.curso[0].id!
        }
        
        if ((cell.curso2?.isEmpty) != nil) {
            imgContrl2.isUserInteractionEnabled = true
            imgContrl2.addGestureRecognizer(tapGestureFc2)
            imgContrl2.tag = cell.curso[1].id!
        }
        
        if ((cell.curso3?.isEmpty) != nil) {
            imgContrl3.isUserInteractionEnabled = true
            imgContrl3.addGestureRecognizer(tapGestureFc3)
            imgContrl3.tag = cell.curso[2].id!
        }
    
        if ((cell.curso4?.isEmpty) != nil) {
            imgContrl4.isUserInteractionEnabled = true
            imgContrl4.addGestureRecognizer(tapGestureFc4)
            imgContrl4.tag = cell.curso[3].id!
        }
        
        if ((cell.curso5?.isEmpty) != nil) {
            imgContrl5.isUserInteractionEnabled = true
            imgContrl5.addGestureRecognizer(tapGestureFc5)
            imgContrl5.tag = cell.curso[4].id!
        }
        
        if ((cell.curso6?.isEmpty) != nil) {
            imgContrl6.isUserInteractionEnabled = true
            imgContrl6.addGestureRecognizer(tapGestureFc6)
            imgContrl6.tag = cell.curso[5].id!
        }
        
        print("Fin Viewcell")
    }
    
    
    @objc func handleTapInfo1(sender: UITapGestureRecognizer){
        do{
            if Funcions.isConnectedToNetwork() {
                
                Constants.defaults.set(imgContrl1.tag, forKey: Constants.curso)
                let numId = String(imgContrl1.tag) //Funcions.ConvertirNumero(cadena: "\(imgContrl1.tag!)")
                //self.delegate.didPressCell(id: numId)
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "AdvanceDetailsVController") as? AdvanceDetailsVController
                print("click 1")
                self.navigationController?.pushViewController(controller!, animated: true)
                
            } else{
                ShowAlert.ShowAlertError(title: " " ,message: Constants.msg_internet)
            }
        } catch is NSException {
            ShowAlert.ShowAlertError(title: " " ,message: Constants.msg_error)
        }
    }
    
    @objc func handleTapInfo2(sender: UITapGestureRecognizer){
        do{
            if Funcions.isConnectedToNetwork() {
                
                Constants.defaults.set(imgContrl2.tag, forKey: Constants.curso)
                let numId = String(imgContrl2.tag) //Funcions.ConvertirNumero(cadena: "\(imgContrl1.tag!)")
                //self.delegate.didPressCell(id: numId)
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "AdvanceDetailsVController") as? AdvanceDetailsVController
                print("click 1")
                self.navigationController?.pushViewController(controller!, animated: true)
                
            } else{
                ShowAlert.ShowAlertError(title: " " ,message: Constants.msg_internet)
            }
        } catch is NSException {
            ShowAlert.ShowAlertError(title: " " ,message: Constants.msg_error)
        }
    }
    
    @objc func handleTapInfo3(sender: UITapGestureRecognizer){
        do{
            if Funcions.isConnectedToNetwork() {
                
                Constants.defaults.set(imgContrl3.tag, forKey: Constants.curso)
                let numId = String(imgContrl3.tag) //Funcions.ConvertirNumero(cadena: "\(imgContrl1.tag!)")
                //self.delegate.didPressCell(id: numId)
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "AdvanceDetailsVController") as? AdvanceDetailsVController
                print("click 1")
                self.navigationController?.pushViewController(controller!, animated: true)
                
            } else{
                ShowAlert.ShowAlertError(title: " " ,message: Constants.msg_internet)
            }
        } catch is NSException {
            ShowAlert.ShowAlertError(title: " " ,message: Constants.msg_error)
        }
    }
    
    @objc func handleTapInfo4(sender: UITapGestureRecognizer){
        do{
            if Funcions.isConnectedToNetwork() {
                
                Constants.defaults.set(imgContrl4.tag, forKey: Constants.curso)
                let numId = String(imgContrl4.tag) //Funcions.ConvertirNumero(cadena: "\(imgContrl1.tag!)")
                //self.delegate.didPressCell(id: numId)
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "AdvanceDetailsVController") as? AdvanceDetailsVController
                print("click 1")
                self.navigationController?.pushViewController(controller!, animated: true)
                
            } else{
                ShowAlert.ShowAlertError(title: " " ,message: Constants.msg_internet)
            }
        } catch is NSException {
            ShowAlert.ShowAlertError(title: " " ,message: Constants.msg_error)
        }
    }
    
    @objc func handleTapInfo5(sender: UITapGestureRecognizer){
        do{
            if Funcions.isConnectedToNetwork() {
                
                Constants.defaults.set(imgContrl5.tag, forKey: Constants.curso)
                let numId = String(imgContrl5.tag) //Funcions.ConvertirNumero(cadena: "\(imgContrl1.tag!)")
                //self.delegate.didPressCell(id: numId)
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "AdvanceDetailsVController") as? AdvanceDetailsVController
                print("click 1")
                self.navigationController?.pushViewController(controller!, animated: true)
                
            } else{
                ShowAlert.ShowAlertError(title: " " ,message: Constants.msg_internet)
            }
        } catch is NSException {
            ShowAlert.ShowAlertError(title: " " ,message: Constants.msg_error)
        }
    }
    
    @objc func handleTapInfo6(sender: UITapGestureRecognizer){
        do{
            if Funcions.isConnectedToNetwork() {
                
                Constants.defaults.set(imgContrl6.tag, forKey: Constants.curso)
                let numId = String(imgContrl6.tag) //Funcions.ConvertirNumero(cadena: "\(imgContrl1.tag!)")
                //self.delegate.didPressCell(id: numId)
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "AdvanceDetailsVController") as? AdvanceDetailsVController
                print("click 1")
                self.navigationController?.pushViewController(controller!, animated: true)
                
            } else{
                ShowAlert.ShowAlertError(title: " " ,message: Constants.msg_internet)
            }
        } catch is NSException {
            ShowAlert.ShowAlertError(title: " " ,message: Constants.msg_error)
        }
    }
}
