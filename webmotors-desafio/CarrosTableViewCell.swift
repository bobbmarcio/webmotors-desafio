//
//  CarrosTableViewCell.swift
//  webmotors-desafio
//
//  Created by Márcio Flores on 13/12/21.
//

import UIKit

class CarrosTableViewCell: UITableViewCell {
    
    @IBOutlet weak var carroImage: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var precoLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
