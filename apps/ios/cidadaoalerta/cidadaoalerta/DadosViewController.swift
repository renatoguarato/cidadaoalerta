//
//  DadosViewController.swift
//  cidadaoalerta
//
//  Created by Renato Guarato on 06/04/16.
//  Copyright © 2016 Renato Guarato. All rights reserved.
//

import UIKit

class DadosViewController: UIViewController {

    override func viewDidLoad() {

        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
    
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btnVoltar(sender: UIBarButtonItem) {
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func btnTransparencia(sender: UIButton) {
        
        UIApplication.sharedApplication().openURL(NSURL(string: "http://transparencia.gov.br/")!)

    }
    
    @IBAction func btnConvenios(sender: UIButton) {
        
        UIApplication.sharedApplication().openURL(NSURL(string: "https://portal.convenios.gov.br/pagina-inicial")!)

    }
}
