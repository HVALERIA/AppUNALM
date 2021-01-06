//
//  SplashVController.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/27/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

import UIKit

protocol SplashViewControllerDelegate:class {
    func splashViewDidLoad()
    func googleAnalytics(coordLatitud:String , coordLongitud:String)
}

class SplashViewController: BaseViewController {

    var delegateSplash:SplashViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController!.isNavigationBarHidden = true
        //For Initialisized Message Alert Views
        screenSize = view.frame
        delegateSplash?.splashViewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func loadAuthenticate(vc:BaseViewController)  {
           self.loadController(controller: vc, type: .push, animated: true)
    }

    override func didReceiveMemoryWarning() {
        
      super.didReceiveMemoryWarning()

        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
