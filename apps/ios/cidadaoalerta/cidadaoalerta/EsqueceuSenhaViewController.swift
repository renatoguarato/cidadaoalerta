//
//  EsqueceuSenhaViewController.swift
//  cidadaoalerta
//
//  Created by Renato Guarato on 25/03/16.
//  Copyright © 2016 Renato Guarato. All rights reserved.
//

import UIKit

class EsqueceuSenhaViewController: UIViewController {

    @IBOutlet weak var lblMensagem: UILabel!
    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()
    }
    
    func dismissKeyboard() {
        
        view.endEditing(true)
    }
    
    @IBAction func btnVoltar(sender: UIBarButtonItem) {

        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func btnEnviar(sender: UIButton) {
        
        if (self.txtEmail.text != "") {
            self.lblMensagem.hidden = false
        }
        else {
            self.presentViewController(Alert.message("Recuperar Senha", message: "Informe o e-mail para envio do processo de recuperação de senha."), animated: true, completion: nil)
        }
        
        dismissKeyboard()
    }
}
