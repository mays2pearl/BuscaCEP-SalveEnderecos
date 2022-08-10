//
//  ViewController.swift
//  BuscaCEP
//
//  Created by Maysa on 08/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfCep: UITextField!
    
    @IBOutlet weak var lbLogradouro: UILabel!

    @IBOutlet weak var lbDdd: UILabel!
    
    @IBOutlet weak var lbLocalidade: UILabel!
    
    @IBOutlet weak var myButton: UIButton!
    
    @IBOutlet weak var myView: UIView!
    
    @IBOutlet weak var endSalvosBtn: UIButton!
    
    @IBOutlet weak var salvarEndBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.myView.layer.cornerRadius = 15
        self.myButton.layer.cornerRadius = 10
        
    }

    @IBAction func btPesquisar(_ sender: UIButton) {
        APIViaCep.pesquisarCEP(tfCep.text!) { (cep) in
            DispatchQueue.main.sync {
                self.lbLogradouro.text = "Logradouro: \(cep.logradouro)"
                self.lbLocalidade.text = "Localidade/UF: \(cep.localidade)/\(cep.uf)"
                self.lbDdd.text = "DDD: \(cep.ddd)"
                
            }
        }
    }
    
    @IBAction func actionSalvosBtn(_ sender: UIButton) {
        
        performSegue(withIdentifier: "enderecoSalvos", sender: self)
    }
    
    @IBAction func actionSalvarEnd(_ sender: UIButton) {
        
        if let logradouro = lbLogradouro.text {
            
    
            let endereco = EnderecoUserDefaults()
            endereco.salvar(endereco: logradouro)
            self.lbLogradouro.text!
            
            let dados = endereco.listar()
            
            print( dados )
            printContent(endereco)
        }
        
    }
    
    
    
}

