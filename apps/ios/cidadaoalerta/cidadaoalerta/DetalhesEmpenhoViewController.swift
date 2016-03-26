//
//  DetalhesEmpenhoViewController.swift
//  cidadaoalerta
//
//  Created by Renato Guarato on 26/03/16.
//  Copyright © 2016 Renato Guarato. All rights reserved.
//

import UIKit

class DetalhesEmpenhoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

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
        
        self.items = [DetalheTabela("Número Empenho", "2008NE800004"), DetalheTabela("Situação", "Registrado SIAFI"), DetalheTabela("Tipo de Nota", "Empenho Original"), DetalheTabela("Valor", "R$ 2.301.592,83")]
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
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! DetailViewCell
        
        let empenho = self.items[indexPath.row]
        
        cell.lblColunaDetalheEmpenho.text = empenho.coluna
        cell.lblValorDetalheEmpenho.text = empenho.valor
        
        return cell
    }
}
