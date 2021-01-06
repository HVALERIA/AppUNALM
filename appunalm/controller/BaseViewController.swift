//
//  BaseViewController.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/27/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

enum NavigationType {
    case popOver
    case push
}

protocol BaseViewControllerDelegate: class {
    func BaseViewController(sender: BaseViewController, didChangeFrontView newView: UINavigationController)
}

class BaseViewController: ViewController {

    
    var currentSegment:OptionSegment!
    static weak var previocurrentView: UIViewController?
    
    static weak var currentView: UIViewController?{
        willSet{
            previocurrentView = currentView
        }
        
        didSet{
            if currentView != nil {print("🍉\(currentView!.description)")}
        }
    }
    
    var screenSize: CGRect! = nil
    let valuePro:CGFloat  = CGFloat(truncating: NSNumber.getPropotionalValueDevice())
    
    
    private let presentingIndicatorTypes = {
           return NVActivityIndicatorType.allCases.filter { $0 != .blank }
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let size = CGSize(width: 30, height: 30)
        let selectedIndicatorIndex = 16
        let indicatorType = presentingIndicatorTypes[selectedIndicatorIndex]
       
      
        // Do any additional setup after loading the view.
        self.screenSize = self.view.frame
    }
    
    
    func loadViewController(controllerIdentifier:String,storyboardName:String,type:NavigationType,animated:Bool) -> BaseViewController {

            // update the UI
            let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: controllerIdentifier)
            
            switch type {
            case .popOver:
                self.present(controller, animated: animated, completion: nil)
                break
                
            case .push:
                self.navigationController?.pushViewController(controller, animated: animated)
                break
            }
        return controller as! BaseViewController
    }
    
    func loadController(controller:BaseViewController,type:NavigationType,animated:Bool) {
    // update the UI
        switch type {
        case .popOver:
            self.present(controller, animated: animated, completion: nil)
            break
            
        case .push:
            self.navigationController?.pushViewController(controller, animated: animated)
            break
        }
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
    
    func isIPHONE() -> Bool{
          let deviceIdiom = UIScreen.main.traitCollection.userInterfaceIdiom
          
          if deviceIdiom == .pad {
              return false
          } else {
              return true
          }
      }
    
      func popController(isTrue:Bool){
          self.navigationController?.popViewController(animated: isTrue)
    
      }
      
      func popViewControllerss(popViews: Int, animated: Bool = true) {
          if self.navigationController!.viewControllers.count > popViews
          {
              let vc = self.navigationController!.viewControllers[self.navigationController!.viewControllers.count - popViews - 1]
              self.navigationController?.popToViewController(vc, animated: animated)
          }
      }
}
