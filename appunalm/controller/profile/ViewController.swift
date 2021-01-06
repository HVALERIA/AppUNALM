//
//  ViewController.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/25/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn
import FBSDKCoreKit
import FBSDKLoginKit

import NVActivityIndicatorView
//import NVActivityIndicatorViewExtended

class ViewController: UIViewController, GIDSignInDelegate{

    @IBOutlet weak var Facebook_vw: UIView!
    @IBOutlet weak var Google_vw: UIView!
    
    let network = LoginNetwork()
    let activityData = ActivityData()
    
    private let presentingIndicatorTypes = {
           return NVActivityIndicatorType.allCases.filter { $0 != .blank }
       }()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        let size = CGSize(width: 30, height: 30)
        let selectedIndicatorIndex = 16
        let indicatorType = presentingIndicatorTypes[selectedIndicatorIndex]
       
      
        if Facebook_vw != nil{
            
            Facebook_vw.layer.cornerRadius = 8
            Google_vw.layer.cornerRadius = 8
              
            let tapGestureGL = UITapGestureRecognizer(target: self, action: #selector(handleTapGoogle(sender:)))
                     
            let tapGestureFc = UITapGestureRecognizer(target: self, action: #selector(handleTapFacebook(sender:)))
            
            self.Google_vw.addGestureRecognizer(tapGestureGL)
            self.Facebook_vw.addGestureRecognizer(tapGestureFc)
        }
    }
    
    func loading(){
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
    }
    
    func currentUserName(correo:String){
        if let currentUser = Auth.auth().currentUser {
            //mensaje
            
            //var id = "730679270460101"
            //network.getFacebook(byId: id) { (authentification) in
            network.getGoogle(byId: correo) { (authentification) in
                //print(authentification)
               
                if(authentification != nil){
                    if Funcions.WS_Respuesta(cadena: authentification!.respuesta!) {
                        Constants.defaults.set(authentification?.usuario?.students?[0].idAlumno!, forKey: Constants.alumno)
                        Constants.defaults.set(correo, forKey: "correo")
                        
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let controller = storyboard.instantiateViewController(withIdentifier: "ResumenVController") as? ResumenVController
                        self.navigationController?.pushViewController(controller!, animated: true)
                    } 
                  
                }
            }
        }
    }
     
    
    @objc func handleTapGoogle(sender: UITapGestureRecognizer){
        do {
            NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
            
            if Funcions.isConnectedToNetwork() {
                GIDSignIn.sharedInstance()?.clientID = "762678016257-rnqo9onjfqpf98v0vifpes6tsr3q3jj7.apps.googleusercontent.com"
                GIDSignIn.sharedInstance().delegate = self
                GIDSignIn.sharedInstance()?.presentingViewController = self
                GIDSignIn.sharedInstance()?.signIn()
            } else{
                ShowAlert.ShowAlertError(title: " " ,message: Constants.msg_internet)
            }
            self.LoagingClose()
        } catch is NSException {
            ShowAlert.ShowAlertError(title: " " ,message: Constants.msg_error)
        }
    }

    @objc func handleTapFacebook(sender: UITapGestureRecognizer){
        do {
            NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
            if Funcions.isConnectedToNetwork() {
                let loginManager = LoginManager()
                loginManager.logIn(permissions: ["public_profile","email"], from: self ){ (result, error) in
                    if let error = error {
                        print ("Failed to login: \(error.localizedDescription)")
                        self.LoagingClose()
                        ShowAlert.ShowAlertError(title: " " ,message: Constants.msg_error)
                        return
                    }
                    
                    guard let accessToken = AccessToken.current else {
                        print("Failed to get token")
                        self.LoagingClose()
                        ShowAlert.ShowAlertError(title: " " ,message: Constants.msg_error)
                        return
                    }
                    
                    let credencial = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
                    Auth.auth().signIn(with: credencial, completion: { (user, error) in
                        if let error = error {
                            print("Login error: \(error.localizedDescription )")
                            self.LoagingClose()
                            ShowAlert.ShowAlertError(title: " " ,message: Constants.msg_error)
                            
                        }else{
                            self.currentUserName(correo: "")
                        }
                    })
                }
                self.LoagingClose()
            } else{
                ShowAlert.ShowAlertError(title: " " ,message: Constants.msg_internet)
            }
        }
        catch is NSException {
            ShowAlert.ShowAlertError(title: " " ,message: Constants.msg_error)
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
           NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
           if error != nil {
               self.LoagingClose()
               return
           }
           
           guard let authentication = user.authentication else { return }
        
           let credencial = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
           Auth.auth().signIn(with: credencial, completion: {(authResult, error) in
               if (error != nil){
                    NSLog("Google error : \(error)")
                    //ShowAlert.ShowAlertError(title: Constants.title_error ,message: Constants.msg_error)
                    self.LoagingClose()
                    ShowAlert.ShowAlertError(title: " " ,message: Constants.msg_error)
                    return
               }else {
                //print("Correo: \(authResult!.user.email! ?? "")")
                
                self.currentUserName(correo: authResult!.user.email! ?? "")
               }
           })
        
        self.LoagingClose()
    }
    
    func LoagingClose (){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3 ) {
            //self.stopAnimating(nil)
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
           //Perform operation
        NSLog("ingreso")
    }
}

