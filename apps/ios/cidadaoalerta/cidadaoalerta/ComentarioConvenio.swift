//
//  ComentarioConvenio.swift
//  cidadaoalerta
//
//  Created by Renato Guarato on 24/03/16.
//  Copyright © 2016 Renato Guarato. All rights reserved.
//

import Foundation

class ComentarioConvenio {
    
    var usuario: String = ""
    var texto: String = ""
    
    init() {
        
    }
    
    init(_ usuario: String, _ texto: String) {
        
        self.usuario = usuario
        self.texto = texto
    }
}