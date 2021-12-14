//
//  CarrosViewController.swift
//  webmotors-desafio
//
//  Created by Márcio Flores on 13/12/21.
//

import UIKit
import Alamofire

class CarrosViewController: UITableViewController {
    
    var carros = [Carro]()
    var flag: Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CarrosTableViewCell", bundle: nil), forCellReuseIdentifier: "CarrosCell")
        for page in 1...3 {
            fillCarros(page: page)
        }
    }
    
    private func fillCarros(page: Int) {
        AF.request("https://desafioonline.webmotors.com.br/api/OnlineChallenge/Vehicles?Page=\(page)").validate().responseJSON { response in
            guard response.error == nil else {
                let alert = UIAlertController(title: "Erro", message: "Algo errado aconteceu. Tente novamente mais tarde.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                    alert.dismiss(animated: true)
                }))
                self.present(alert, animated: true)
                return
            }
            
            do {
                if let data = response.data {
                    let models = try JSONDecoder().decode([Carro].self, from: data)
                    for model in models {
                        self.carros.append(model)
                    }
                    self.tableView.reloadData()
                }
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carros.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CarrosCell", for: indexPath) as? CarrosTableViewCell else {
            return UITableViewCell()
        }
        
        let carro = carros[indexPath.row]
        cell.nomeLabel.text = "\(carro.Make)  \(carro.Model)"
        cell.precoLabel.text = "R$ \(carro.Price)"
        
        cell.nomeLabel.backgroundColor = .red
        cell.precoLabel.backgroundColor = .red
                
        let photoUrl = carro.Image.replacingOccurrences(of: "http", with: "https")
        
        AF.download(photoUrl).responseData { response in
            switch response.result {
            case .success(let data):
                cell.carroImage.image = UIImage(data: data)
                //self.tableView.reloadData()
            default:
                break
            }
        }
        
        let press = UITapGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_:)))
        cell.addGestureRecognizer(press)
                
        return cell
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    @objc func mostrarDetalhes(_ gesture: UITapGestureRecognizer) {
        let cell = gesture.view as! UITableViewCell
        
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        
        let carro = carros[indexPath.row]
        
        let detalhesCarroViewController = DetalhesCarroViewController(carro)
        navigationController?.pushViewController(detalhesCarroViewController, animated: true)
    }
}

