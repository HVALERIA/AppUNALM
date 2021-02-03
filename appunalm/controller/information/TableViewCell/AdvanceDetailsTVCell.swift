//
//  AdvanceDetailsTVCell.swift
//  appunalm
//
//  Created by Valeria H. Choque on 19/01/21.
//  Copyright © 2021 Valeria H. Choque. All rights reserved.
//

import UIKit

class AdvanceDetailsTVCell: UITableViewCell {
    @IBOutlet weak var lblAbreviatura: UILabel!
    @IBOutlet weak var lblCurso: UILabel!
    @IBOutlet weak var lblCodigo: UILabel!
    @IBOutlet weak var lblCredito: UILabel!
    @IBOutlet weak var lblRequisito: UILabel!
    @IBOutlet weak var lblCreRequisito: UILabel!
    @IBOutlet weak var lblAula: UILabel!
    @IBOutlet weak var lblFecha: UILabel!
    @IBOutlet weak var lblEstado: UILabel!
    
    func setDetail(cell: AdvanceDetailCell){
        lblAbreviatura.text = cell.breve
        lblCurso.text = cell.curso
        lblCodigo.text = "Codigo de curso: \(cell.codigo)"
        lblCredito.text = "Creditos del Curso: \(cell.creditoCurso)"
        lblRequisito.text = "Pre requisitos: \(cell.requisito)"
        lblCreRequisito.text = "Credito Requisitos: \(cell.creditoRequisito)"
        lblAula.text = "Aula: \(cell.aula)"
        lblFecha.text = "Fecha: \(cell.fecha)"
        lblEstado.text = "Estado: \(cell.estado)"
    }
}
