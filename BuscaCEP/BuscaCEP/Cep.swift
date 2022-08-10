//
//  Cep.swift
//  BuscaCEP
//
//  Created by Maysa on 08/08/22.
//

import Foundation

struct Cep: Decodable {
    var logradouro: String
    var localidade: String
    var uf: String
    var ddd: String
}
