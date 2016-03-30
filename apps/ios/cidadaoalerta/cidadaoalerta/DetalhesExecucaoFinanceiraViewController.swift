//
//  DetalhesExecucaoFinanceiraViewController.swift
//  cidadaoalerta
//
//  Created by Renato Guarato on 26/03/16.
//  Copyright © 2016 Renato Guarato. All rights reserved.
//

import UIKit

class DetalhesExecucaoFinanceiraViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
        
        self.items = [DetalheTabela("Número Proposta", "1591"), DetalheTabela("Modalidade", "Prestação de Contas em Análise"), DetalheTabela("Órgão Superior", "MINISTERIO DO DESENV. SOCIAL E COMBATE A FOME"), DetalheTabela("Valor", "R$ 347.926,32")]
    }

    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btnVoltar(sender: AnyObject) {

        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! DetailViewCell
        
        let empenho = self.items[indexPath.row]
        
        cell.lblColunaDetalheExecucaoFinanceira.text = empenho.coluna
        cell.lblValorDetalheExecucaoFinanceira.text = empenho.valor
        
        return cell
    }

}
