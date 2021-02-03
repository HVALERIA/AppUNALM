//
//  CourseTVCell.swift
//  appunalm
//
//  Created by Valeria H. Choque on 30/01/21.
//  Copyright © 2021 Valeria H. Choque. All rights reserved.
//

import UIKit

class CourseCabTVCell: UITableViewCell {

    @IBOutlet weak var Docente_lbl: UILabel!
    @IBOutlet weak var Credito_lbl: UILabel!
    @IBOutlet weak var Ciclo_lbl: UILabel!
    @IBOutlet weak var Aula_lbl: UILabel!
    @IBOutlet weak var Clave_lbl: UILabel!
    @IBOutlet weak var Cab_lbl:UILabel!
    
    func setGraduate(cell: CourseSummaryCell){
        self.Docente_lbl.text = cell.docente
        self.Credito_lbl.text = cell.credito
      //  self.Ciclo_lbl.text = cell.ciclo
        self.Aula_lbl.text = cell.aula
        self.Clave_lbl.text = cell.clave
        self.Cab_lbl.text = cell.curso
    }
    
    /*
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }*/

}
