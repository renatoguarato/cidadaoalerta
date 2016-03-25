//
//  DetalhesConveniosViewController.swift
//  cidadaoalerta
//
//  Created by Renato Guarato on 23/03/16.
//  Copyright © 2016 Renato Guarato. All rights reserved.
//

import UIKit

class DetalhesConveniosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var segmentDetalhes: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnAdd: UIBarButtonItem!
    
    var convenio: Convenio = Convenio()
    var itemsDetalhes = [DetalheConvenio]()
    var itemsComentarios = [ComentarioConvenio]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "tableCell")
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 160.0
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.itemsDetalhes = [DetalheConvenio("Número Convênio", "700026"), DetalheConvenio("Proponente", "PROMOÇÃO E PARTICIPAÇÃO EM EVENTOS TURISTICOS NACIONAIS E INTERNACIONAIS - EMENDAS"), DetalheConvenio("UF Proponente", "DF"), DetalheConvenio("Cidade Proponente", "Brasília"), DetalheConvenio("Data Inclusão Proposta", "29/08/2009"), DetalheConvenio("Situação", "Proposta/Plano de Trabalho Aprovados")]
        
        self.itemsComentarios = [ComentarioConvenio("Renato Guarato", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."), ComentarioConvenio("João da Silva", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "), ComentarioConvenio("Maria Eduarda", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."), ComentarioConvenio("Renato Guarato", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")]
    }

    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()
    }

    @IBAction func btnVoltar(sender: UIBarButtonItem) {
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func btnAdd(sender: UIBarButtonItem) {
        
        var alertController:UIAlertController?
        alertController = UIAlertController(title: "Comentário",
            message: "Informe o comentário no campo abaixo",
            preferredStyle: .Alert)
        
        alertController!.addTextFieldWithConfigurationHandler(
            {(textField: UITextField!) in
        })
        
        let action = UIAlertAction(title: "Salvar",
            style: UIAlertActionStyle.Default,
            handler: {[weak self]
                (paramAction:UIAlertAction!) in
                if let textFields = alertController?.textFields{
                    let theTextFields = textFields as [UITextField]
                    let enteredText = theTextFields[0].text
                    
                    let comentario = ComentarioConvenio("Renato", enteredText!)
                    self!.itemsComentarios.insert(comentario, atIndex: 0)
                    self!.tableView.reloadData()
                }
            })
        
        alertController?.addAction(action)
        self.presentViewController(alertController!,
            animated: true,
            completion: nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (self.segmentDetalhes.selectedSegmentIndex == 0 ) {
            return self.itemsDetalhes.count
        }
        else {
            return self.itemsComentarios.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! DetailViewCell
        
        if (self.segmentDetalhes.selectedSegmentIndex == 0) {
            let detalheConvenio = self.itemsDetalhes[indexPath.row] 
        
            cell.lblColuna.text = detalheConvenio.coluna
            cell.lblValor.text = detalheConvenio.valor
        }
        else {
            let comentarioConvenio = self.itemsComentarios[indexPath.row] 
            
            cell.lblColuna.text = comentarioConvenio.usuario
            cell.lblValor.text = comentarioConvenio.texto
        }
        
        return cell
    }

    @IBAction func segmentDetalhes(sender: UISegmentedControl) {
        
        if (sender.selectedSegmentIndex == 1) {
            btnAdd.enabled = true
        }
        else {
            btnAdd.enabled = false
        }
        
        self.tableView.reloadData()
        self.tableView.setContentOffset(CGPointZero, animated:true)
    }

}
