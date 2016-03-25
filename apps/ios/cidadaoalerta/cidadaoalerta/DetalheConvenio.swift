//
//  DetalheConvenio.swift
//  cidadaoalerta
//
//  Created by Renato Guarato on 24/03/16.
//  Copyright © 2016 Renato Guarato. All rights reserved.
//

import Foundation

class DetalheConvenio {
    
    var coluna: String = ""
    var valor: String = ""
    
    init() {
        
    }
    
    init(_ coluna: String, _ valor: String) {
        
        self.coluna = coluna
        self.valor = valor
    }
    
}