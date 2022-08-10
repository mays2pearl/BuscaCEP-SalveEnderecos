//
//  EnderecoUserDefaults.swift
//  BuscaCEP
//
//  Created by Maysa on 09/08/22.
//

import Foundation
import UIKit

class EnderecoUserDefaults {
    
    let chave = "listaEnderecos"
    var enderecos: [String] = []
    
    func salvar(endereco: String){
        
        self.enderecos = listar() as! [String]
        self.enderecos.append(endereco)
        UserDefaults.standard.set(endereco, forKey: chave)
        
    }
    
    func remover(indice: Int) {
        
        self.enderecos = listar() as! [String]
        self.enderecos.remove(at: indice)
        UserDefaults.standard.set(enderecos, forKey: chave)
        
    }
    
    func listar() -> Any{
        
        let dados = UserDefaults.standard.object(forKey: chave)
        
        if dados != nil {
            print(dados!)
            return dados as Any
            
        }else{
            return []
        }
        
    }
}
