//
//  DetalhesCarroViewController.swift
//  webmotors-desafio
//
//  Created by Márcio Flores on 14/12/21.
//

import UIKit

class DetalhesCarroViewController: UIViewController {
    
    let carro: Carro
    
    @IBOutlet weak var marcaLabel: UILabel!
    @IBOutlet weak var modeloLabel: UILabel!
    @IBOutlet weak var precoLabel: UILabel!
    
    init(_ carro: Carro) {
        self.carro = carro
        super.init(nibName: "DetalhesCarroViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        marcaLabel.text = carro.Make
        modeloLabel.text = carro.Model
        precoLabel.text = carro.Price
    }
}
