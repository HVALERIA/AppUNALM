//
//  ResumenVController.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/27/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ResumenVController: UIViewController {
    
    @IBOutlet weak var lblEstudiante: UILabel!
    @IBOutlet weak var lblSituacion: UILabel!
    @IBOutlet weak var lblEspecialidad: UILabel!
    @IBOutlet weak var lblCodigo: UILabel!
    @IBOutlet weak var lblDni: UILabel!
    @IBOutlet weak var im_fondo: UIImageView!
    @IBOutlet weak var im_foto: UIImageView!
    
    //let network = ProfileNetwork()
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
        
        im_fondo.layer.masksToBounds = true
        im_fondo.layer.cornerRadius = im_fondo.bounds.width / 2
        
        im_foto.layer.masksToBounds = true
        im_foto.layer.cornerRadius = im_foto.bounds.width / 2
        
        let size = CGSize(width: 30, height: 30)
        let selectedIndicatorIndex = 16
        let indicatorType = presentingIndicatorTypes[selectedIndicatorIndex]
       
        
        if (lblEstudiante != nil) {
            inicialize()
        }
        
        // Do any additional setup after loading the view.
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
    
    func inicialize(){
        limpiar();
        //let id = "30154"
        do {
            if Funcions.isConnectedToNetwork() {
                
                let id:String = UserDefaults.standard.string(forKey: Constants.alumno)!
                network.Resumen(byId: id) { (studensummary) in
                    if (studensummary != nil) {
                        
                        self.lblCodigo.text = studensummary?.codigo
                        self.lblEstudiante.text = studensummary?.nombres
                        self.lblDni.text = studensummary?.dni
                        self.lblEspecialidad.text = studensummary?.carrera
                        self.lblSituacion.text = studensummary?.situacion
                        let url = URL(string: studensummary!.foto!)!
                        self.downloadImage(from: url)
                    }
                }
            } else{
                ShowAlert.ShowAlertError(title: " " ,message: Constants.msg_internet)
            }
        
        } catch is NSException {
            ShowAlert.ShowAlertError(title: Constants.title_error ,message: Constants.msg_error)
        }
    }

    func limpiar(){
        lblEstudiante.text = nil
        lblSituacion.text = nil
        lblEspecialidad.text = nil
        lblCodigo.text = nil
        lblDni.text = nil
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
                self?.im_foto.image = UIImage(data: data)
            }
        }
    }
}

extension ResumenVController : UIViewControllerTransitioningDelegate {
   
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}
