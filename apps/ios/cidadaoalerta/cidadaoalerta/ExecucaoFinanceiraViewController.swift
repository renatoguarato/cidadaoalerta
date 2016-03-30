//
//  ExecucaoFinanceiraViewController.swift
//  cidadaoalerta
//
//  Created by Renato Guarato on 25/03/16.
//  Copyright © 2016 Renato Guarato. All rights reserved.
//

import UIKit

class ExecucaoFinanceiraViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var items = [DetalheTabela]()

    override func viewDidLoad() {

        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "tableCell")
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 160.0
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.items = [DetalheTabela("Data: 08/12/2008", "Valor: R$ 347.926,32"), DetalheTabela("Data: 22/12/2008", "Valor: 402.314,00"), DetalheTabela("Data: 09/12/2008", "Valor: R$ 1.509.987,99"), DetalheTabela("Data: 10/11/2008", "Valor: R$ 11.124,80")]
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
    
    @IBAction func btnAjuda(sender: UIBarButtonItem) {
        
        self.presentViewController(Alert.message("Ajuda", message: "Execução financeira é a utilização dos recursos financeiros visando atender à realização dos subprojetos e/ou subatividades, atribuídos às unidades orçamentárias."), animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! DetailViewCell
        
        let empenho = self.items[indexPath.row]
        
        cell.lblColunaExecucaoFinanceira.text = empenho.coluna
        cell.lblValorExecucaoFinanceira.text = empenho.valor
        
        return cell
    }

}
