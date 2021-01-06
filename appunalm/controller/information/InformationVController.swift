//
//  InformationVController.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/29/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

import UIKit

class InformationVController: UIViewController {

    @IBOutlet weak var History_vw: UIView!
    @IBOutlet weak var Advanced_vw: UIView!
    @IBOutlet weak var Courses_vw: UIView!
    @IBOutlet weak var Exams_vw: UIView!
    @IBOutlet weak var Schedule_vw: UIView!
    @IBOutlet weak var Mesh_vw: UIView!
    @IBOutlet weak var Calendar_vw: UIView!
    @IBOutlet weak var Finance_vw: UIView!
    @IBOutlet weak var Carrera_lbl: UILabel!
    
    let transition = SliderInTransition()
    var topView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        History_vw.layer.cornerRadius = 8
        Advanced_vw.layer.cornerRadius = 8
        Courses_vw.layer.cornerRadius = 8
        Exams_vw.layer.cornerRadius = 8
        Schedule_vw.layer.cornerRadius = 8
        Mesh_vw.layer.cornerRadius = 8
        Calendar_vw.layer.cornerRadius = 8
        Finance_vw.layer.cornerRadius = 8
        
        let tgHistory = UITapGestureRecognizer(target: self, action: #selector(handleTapHistory(sender:)))
        let tgAdvanced = UITapGestureRecognizer(target: self, action: #selector(handleTapAdvanced(sender:)))
        let tgCourses = UITapGestureRecognizer(target: self, action: #selector(handleTapCourses(sender:)))
        let tgExams = UITapGestureRecognizer(target: self, action: #selector(handleTapExams(sender:)))
        let tgSchedule = UITapGestureRecognizer(target: self, action: #selector(handleTapSchedule(sender:)))
        let tgMesh = UITapGestureRecognizer(target: self, action: #selector(handleTapMesh(sender:)))
        let tgCalendar = UITapGestureRecognizer(target: self, action: #selector(handleTapCalendar(sender:)))
        let tgFinance = UITapGestureRecognizer(target: self, action: #selector(handleTapFinance(sender:)))
        
        self.History_vw.addGestureRecognizer(tgHistory)
        self.Advanced_vw.addGestureRecognizer(tgAdvanced)
        self.Courses_vw.addGestureRecognizer(tgCourses)
        self.Exams_vw.addGestureRecognizer(tgExams)
        self.Schedule_vw.addGestureRecognizer(tgSchedule)
        self.Mesh_vw.addGestureRecognizer(tgMesh)
        self.Calendar_vw.addGestureRecognizer(tgCalendar)
        self.Finance_vw.addGestureRecognizer(tgFinance)
        
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
    
    @objc func handleTapHistory(sender: UITapGestureRecognizer){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "HistoryVController") as? HistoryVController
        self.navigationController?.pushViewController(controller!, animated: true)
    }
    
    @objc func handleTapAdvanced(sender: UITapGestureRecognizer){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "AdvanceVController") as? AdvanceVController
        self.navigationController?.pushViewController(controller!, animated: true)
        
    }
    @objc func handleTapCourses(sender: UITapGestureRecognizer){
    }
    @objc func handleTapExams(sender: UITapGestureRecognizer){
    }
    @objc func handleTapSchedule(sender: UITapGestureRecognizer){
    }
    @objc func handleTapMesh(sender: UITapGestureRecognizer){
    }
    @objc func handleTapCalendar(sender: UITapGestureRecognizer){
    }
    @objc func handleTapFinance(sender: UITapGestureRecognizer){
    }
     
}
extension InformationVController : UIViewControllerTransitioningDelegate {
   
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}
