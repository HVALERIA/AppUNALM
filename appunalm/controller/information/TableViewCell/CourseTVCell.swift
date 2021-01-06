//
//  CourseTVCell.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/30/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

import UIKit

class CourseTVCell: UITableViewCell {
    
    @IBOutlet weak var lblBreve: UILabel!
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblCodigo: UILabel!
    @IBOutlet weak var lblCredito: UILabel!
    @IBOutlet weak var lblEstado: UILabel!
    @IBOutlet weak var lblPromedio: UILabel!
    
    func setCourse(cell: CourseCell){
        lblBreve.text = cell.letra
        lblNombre.text = cell.nombre
        
        lblCodigo.text = "\(cell.codigo)"
        lblCredito.text = "\(cell.credito)"
        lblEstado.text = "\(cell.estado)"
        lblPromedio.text = "\(cell.promedio.description)"
    }

}
