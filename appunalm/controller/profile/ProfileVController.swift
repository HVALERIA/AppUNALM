//
//  ProfileVController.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/28/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ProfileVController: UIViewController {
    
    
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtDni: UITextField!
    @IBOutlet weak var txtCodigo: UITextField!
    @IBOutlet weak var txtEspecialidad: UITextField!
    @IBOutlet weak var txtAdmision: UITextField!
    @IBOutlet weak var txtCorreo: UITextField!
    @IBOutlet weak var txtPrograma: UITextField!
    @IBOutlet weak var txtCurriculum: UITextField!
    @IBOutlet weak var txtSituacion: UITextField!
    @IBOutlet weak var im_Foto: UIImageView!
    
    let network = ProfileNetwork()
    
    let transition = SliderInTransition()
    var topView: UIView?
    
    let activityData = ActivityData()
    
    private let presentingIndicatorTypes = {
           return NVActivityIndicatorType.allCases.filter { $0 != .blank }
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        
        //Añadir evento circular
        im_Foto.layer.masksToBounds = true
        im_Foto.layer.cornerRadius = im_Foto.bounds.width / 2
        
        let size = CGSize(width: 30, height: 30)
        let selectedIndicatorIndex = 16
        let indicatorType = presentingIndicatorTypes[selectedIndicatorIndex]
       
        //Cargando
        self.loadingOpen()
        inicialize()
    }
    
    func inicialize(){
        do {
            limpiar();
            if Funcions.isConnectedToNetwork() {
                //let id = "30154"
                let id:String = UserDefaults.standard.string(forKey: Constants.alumno)!
                network.Resumen(byId: id) { (studensummary) in
                    if (studensummary != nil) {
                      self.txtNombre.text = studensummary?.nombres
                      self.txtDni.text = studensummary?.dni
                      self.txtCodigo.text = studensummary?.codigo
                      self.txtEspecialidad.text = studensummary?.carrera
                      self.txtAdmision.text = studensummary?.tipo
                      self.txtCorreo.text = studensummary?.email
                      self.txtPrograma.text = studensummary?.descripcion
                      self.txtSituacion.text = studensummary?.situacion
                      let url = URL(string: studensummary!.foto!)!
                      self.downloadImage(from: url)
                    }
                }
            } else{
                ShowAlert.ShowAlertError(title: " " ,message: Constants.msg_internet)
            }
            
            self.loagingClose()
            
        }catch is NSException {
            ShowAlert.ShowAlertError(title: Constants.title_error ,message: Constants.msg_error)
        }
      
      }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() { [weak self] in
                self?.im_Foto.image = UIImage(data: data)
            }
        }
    }
    
    @IBAction func didMenu(_ sender: Any) {
        guard let menuViewController = storyboard?.instantiateViewController(identifier: "MenuTVController") as? MenuTVController else {return}
       menuViewController.didTapMenuType = { menuType in
           self.transitionToNew(menuType)
           print(menuType)
       }
       menuViewController.modalPresentationStyle = .overCurrentContext
       menuViewController.transitioningDelegate = self
       present(menuViewController, animated: true)
    }
    
    func transitionToNew(_ menuType: MenuType){
        let title = String(describing: menuType).capitalized
        //self.title = title
        
        topView?.removeFromSuperview()
        switch menuType {
        case .home:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "ResumenVController") as? ResumenVController
            self.navigationController?.pushViewController(controller!, animated: true)
             
            break
            
        case .profile:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "ProfileVController") as? ProfileVController
            self.navigationController?.pushViewController(controller!, animated: true)
            break
            
        case .information:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "InformationVController") as? InformationVController
             self.navigationController?.pushViewController(controller!, animated: true)
            break
            
        default:
            break
        }
    }
    
      func limpiar(){
          self.txtNombre.text = nil
          self.txtDni.text = nil
          self.txtCodigo.text = nil
          self.txtEspecialidad.text = nil
          self.txtAdmision.text = nil
          self.txtCorreo.text = nil
          self.txtPrograma.text = nil
          self.txtSituacion.text = nil
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
extension ProfileVController : UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
    
}
