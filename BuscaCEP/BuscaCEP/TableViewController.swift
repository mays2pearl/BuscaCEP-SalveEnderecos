//
//  TableViewController.swift
//  BuscaCEP
//
//  Created by Maysa on 09/08/22.
//

import UIKit

class TableViewController: UITableViewController {

    var enderecos:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        iniciar()
        
    }

    override func viewDidAppear(_ animated:Bool) {
        
        //aqui chamar função atualizar lista de endereços
    }
    
    func iniciar () {
        
        var enderecosRecuperados: [String]?
        
        enderecosRecuperados = UserDefaults.standard.object(forKey: "endereco") as? [String]
        
        if let  it = enderecosRecuperados {
            
            self.enderecos = it
        }
        
    }
  

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return enderecos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)
        
        celula.textLabel?.text = self.enderecos[indexPath.row]
        
        return celula
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            self.enderecos.remove(at: indexPath.row)
            
            UserDefaults.standard.removeObject(forKey: "endereco")
            
            UserDefaults.standard.set(self.enderecos, forKey: "endereco")
            UserDefaults.standard.synchronize()
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }else if editingStyle == .insert {
            
        }
        }
    }

