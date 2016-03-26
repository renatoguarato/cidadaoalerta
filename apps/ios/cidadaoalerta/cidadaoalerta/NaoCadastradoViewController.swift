//
//  NaoCadastradoViewController.swift
//  cidadaoalerta
//
//  Created by Renato Guarato on 25/03/16.
//  Copyright © 2016 Renato Guarato. All rights reserved.
//

import UIKit

class NaoCadastradoViewController: UIViewController {

    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    @IBOutlet weak var lblMensagem: UILabel!
    
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
    
    @IBAction func btnSalvar(sender: UIButton) {
        
        if (self.txtNome.text != "" && self.txtEmail.text != "" && self.txtUsuario.text != "" && self.txtSenha.text != "") {
            self.lblMensagem.hidden = false
        }
        else {
            self.presentViewController(Alert.message("Cadastro", message: "Informe todos os campos para concluir o cadastro."), animated: true, completion: nil)
        }
        
        dismissKeyboard()
    }
}
