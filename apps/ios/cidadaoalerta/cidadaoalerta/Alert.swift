//
//  Alert.swift
//  cidadaoalerta
//
//  Created by Renato Guarato on 25/03/16.
//  Copyright © 2016 Renato Guarato. All rights reserved.
//

import UIKit

class Alert {
    
    static func message(title: String, message: String) -> UIAlertController {
        
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        
        return alertController
    }
}