//
//  DetalhesCarroViewController.swift
//  webmotors-desafio
//
//  Created by Márcio Flores on 14/12/21.
//

import UIKit
import Alamofire

class DetalhesCarroViewController: UIViewController {
    
    let carro: Carro
    
    @IBOutlet weak var carroImage: UIImageView!
    @IBOutlet weak var marcaLabel: UILabel!
    @IBOutlet weak var modeloLabel: UILabel!
    @IBOutlet weak var precoLabel: UILabel!
    @IBOutlet weak var kmLabel: UILabel!
    @IBOutlet weak var anoLabel: UILabel!
    
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
        let photoUrl = carro.Image.replacingOccurrences(of: "http", with: "https")
        
        AF.download(photoUrl).responseData { response in
            switch response.result {
            case .success(let data):
                self.carroImage.image = UIImage(data: data)
                print("Setando a imagem \(photoUrl) para o carro \(self.carro.ID) - \(Date.now)")
            default:
                break
            }
        }
        
        marcaLabel.text = carro.Make
        modeloLabel.text = carro.Model
        precoLabel.text = carro.Price
        kmLabel.text = String(carro.KM)
        anoLabel.text = "\(carro.YearFab)/\(carro.YearModel)"
    }
}
