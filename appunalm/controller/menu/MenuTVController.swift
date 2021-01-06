//
//  MenuTVController.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/28/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

import UIKit

enum MenuType: Int {
    case home
    case profile
    case information
    case formalities
    case comunication
    case notification
    case setting
    case logoff
}

class MenuTVController: UITableViewController {

    var didTapMenuType : ((MenuType) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else {return }
        dismiss(animated: true){ [weak self] in
            print("Dismissing: \(menuType)")
            self?.didTapMenuType?(menuType)
        }
    }

   
}
