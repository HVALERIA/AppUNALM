//
//  SplashPresenter.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/27/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

import UIKit
protocol SplashViewPresenter {
    init(view: SplashViewController )
    func callDataGenerals()
    func successData()
   // func checkNewVersionService()
}

class SplashPresenter: SplashViewPresenter,ShowAlertErrorDelegate,SplashViewControllerDelegate {
    unowned let view: SplashViewController
    
    required init(view: SplashViewController) {
        self.view = view
    }
    
    func loadDelegates(){
        self.view.delegateSplash = self
    }
    
    func splashViewDidLoad(){
        self.setDefaultRemoteConfig()
        self.callDataGenerals()
    }
    
    func callDataGenerals() {
        let Defaults = UserDefaults.standard
        
        let view:ViewController = ViewController()
        let presenter = AuthenticatePresenter(view: view)
        
        self.view.loadAuthenticate(vc: view)
                 presenter.fillTypeDocuments()
    }

}
