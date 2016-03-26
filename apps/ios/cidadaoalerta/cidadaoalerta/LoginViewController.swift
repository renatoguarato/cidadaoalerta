
//
//  LoginViewController.swift
//  cidadaoalerta
//
//  Created by Renato Guarato on 25/03/16.
//  Copyright © 2016 Renato Guarato. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()

    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    
    @IBOutlet weak var lblUsuarioLogado: UILabel!
    @IBOutlet weak var lblLogin: UILabel!
    @IBOutlet weak var btnSair: UIButton!
    
    @IBOutlet weak var btnEntrar: UIButton!
    @IBOutlet weak var btnEsqueceu: UIButton!
    @IBOutlet weak var btnNaoCadastrado: UIButton!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        let userLogged = defaults.stringForKey(Constants.USER_LOGGED)
        if (userLogged != nil) {
            entrar(userLogged!)
        }
        else {
            sair()
        }
        
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
    
    @IBAction func btnEntrar(sender: UIButton) {
        
        if (self.txtUsuario.text != "") {
            if (self.txtUsuario.text == "jose") {
                self.presentViewController(Alert.message("Login", message: "Usuário não cadastrado."), animated: true, completion: nil)

            }
            else {
                defaults.setValue(self.txtUsuario.text, forKey: Constants.USER_LOGGED)
                entrar(self.txtUsuario.text!)
            }
        }
        
        dismissKeyboard()
    }
    
    @IBAction func btnSair(sender: UIButton) {
        
        defaults.removeObjectForKey(Constants.USER_LOGGED)
        sair()
    }
    
    func sair() {
        
        self.btnSair.hidden = true
        self.lblUsuarioLogado.hidden = true
        self.lblLogin.hidden = true
        self.txtUsuario.hidden = false
        self.txtSenha.hidden = false
        self.btnEntrar.hidden = false
        self.btnEsqueceu.hidden = false
        self.btnNaoCadastrado.hidden = false
    }
    
    func entrar(usuario: String) {
        
        self.btnSair.hidden = false
        self.lblUsuarioLogado.hidden = false
        self.lblLogin.hidden = false
        self.txtUsuario.hidden = true
        self.txtSenha.hidden = true
        self.btnEntrar.hidden = true
        self.btnEsqueceu.hidden = true
        self.btnNaoCadastrado.hidden = true
        self.lblLogin.text = usuario
    }
}
