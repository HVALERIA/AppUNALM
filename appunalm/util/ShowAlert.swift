//
//  ShowAlert.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/12/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

import Foundation
import UIKit

final class ShowAlert {
    
    public static func ShowAlertError(title:String, message:String)
    {
        let alerta = UIAlertController(title: title,
                                       message: message,
                                       preferredStyle: .alert)
        
        //let accion = UIAlertAction(title: "Cerrar", style: .default) { _ in alerta.dismiss(animated: true, completion: nil) };)
        var imageView = UIImageView(frame: CGRect(x: 110, y: 0, width: 40, height: 40))
        imageView.image = UIImage(named: "iconError")
        
        let accion = UIAlertAction(title: "Cerrar", style: .default)
        
        alerta.view.addSubview(imageView)
        alerta.addAction(accion)
        //self.presentViewController(alerta, animated: true, completion: nil)
        
        UIApplication.shared.keyWindow?.rootViewController?.present(alerta, animated: true, completion: nil)
        
    }
}
