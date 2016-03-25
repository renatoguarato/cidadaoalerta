//
//  Convenio.swift
//  cidadaoalerta
//
//  Created by Renato Guarato on 24/03/16.
//  Copyright © 2016 Renato Guarato. All rights reserved.
//

import Foundation

class Convenio {
    
    var numero: String = ""
    var nome: String = ""
    var comentarios: Int = 0
    
    init() {
        
    }
    
    init(_ numero: String, _ nome: String, _ comentarios: Int) {
        
        self.numero = numero
        self.nome = nome
        self.comentarios = comentarios
    }
}