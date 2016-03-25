//
//  BuscaConveniosViewController.swift
//  cidadaoalerta
//
//  Created by Renato Guarato on 12/03/16.
//  Copyright © 2016 Renato Guarato. All rights reserved.
//

import UIKit

class BuscaConveniosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var items = []
    var convencioSelecionado: Convenio = Convenio()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
//        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "tableCell")
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 160.0
        
        self.automaticallyAdjustsScrollViewInsets = false
    }

    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()
    }

    @IBAction func btnVoltar(sender: UIBarButtonItem) {
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! SearchViewCell
        
        let convenio = self.items[indexPath.row] as! Convenio
        
        cell.lblConvenio.text = convenio.nome
        cell.lblComentario.text = String(convenio.comentarios)

//        cell.textLabel?.numberOfLines = 0
//        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        self.convencioSelecionado = self.items[indexPath.row] as! Convenio
        UIView.setAnimationsEnabled(false)
        performSegueWithIdentifier("segueDetalhesConvenios", sender: self)
//        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "segueDetalhesConvenios" {
            
            let detalhesConveniosController = segue.destinationViewController as! DetalhesConveniosViewController
            detalhesConveniosController.convenio = convencioSelecionado
            
        }
    }
    
}
