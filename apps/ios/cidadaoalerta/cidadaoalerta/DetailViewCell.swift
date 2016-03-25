//
//  DetailViewCell.swift
//  cidadaoalerta
//
//  Created by Renato Guarato on 24/03/16.
//  Copyright © 2016 Renato Guarato. All rights reserved.
//

import UIKit

class DetailViewCell: UITableViewCell {

    @IBOutlet weak var lblColuna: UILabel!
    @IBOutlet weak var lblValor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
