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
    @IBOutlet weak var kmLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
