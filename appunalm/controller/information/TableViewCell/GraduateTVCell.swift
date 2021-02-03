//
//  GraduateTVCell.swift
//  appunalm
//
//  Created by Valeria H. Choque on 8/29/20.
//  Copyright © 2020 Valeria H. Choque. All rights reserved.
//

import UIKit

class GraduateTVCell: UITableViewCell {

    @IBOutlet weak var Conteiner_vw: UIView!
    @IBOutlet weak var lblCodigo: UILabel!
    @IBOutlet weak var lblPromedio: UILabel!
    @IBOutlet weak var imDetail: UIImageView!
    
    func setGraduate(cell: GraduateCell){
        Conteiner_vw.layer.cornerRadius = 8
        lblCodigo.text = "Ciclo: \(cell.ciclo)"
        lblPromedio.text = "Promedio: \(cell.promedio)"
    } 
    
    /*
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    } */

}
