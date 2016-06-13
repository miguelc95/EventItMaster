//
//  SpecialCell.swift
//  EventItMaster
//
//  Created by Miguel Cuellar on 4/18/16.
//  Copyright © 2016 Miguel Cuellar. All rights reserved.
//

import UIKit

class SpecialCell: UITableViewCell {
    
    @IBOutlet var Nombre: UILabel!
    @IBOutlet var Tipo: UILabel!
    @IBOutlet var Descripcion: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
