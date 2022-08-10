//
//  TableViewController.swift
//  BuscaCEP
//
//  Created by Maysa on 09/08/22.
//

import UIKit

class TableViewController: UITableViewController {

    var enderecos:[Any] = ["teste1", "teste2", "teste3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func viewDidAppear(_ animated:Bool) {
        
        //aqui chamar função atualizar lista de endereços
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            
            let endereco =  EnderecoUserDefaults()
            endereco.remover(indice: indexPath.row)
            atualizarListaEnderecos()
            
        }
        
    }
    func atualizarListaEnderecos(){
        let endereco = EnderecoUserDefaults()
        self.enderecos = endereco.listar() as! [Any] 
        tableView.reloadData()
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return enderecos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)
        
        celula.textLabel?.text = enderecos[indexPath.row] as! String
        
        return celula
    }
}
