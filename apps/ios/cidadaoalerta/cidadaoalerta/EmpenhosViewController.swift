//
//  EmpenhosViewController.swift
//  cidadaoalerta
//
//  Created by Renato Guarato on 25/03/16.
//  Copyright © 2016 Renato Guarato. All rights reserved.
//

import UIKit

class EmpenhosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

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
        
        self.items = [DetalheTabela("Número: 2008NE800004", "Valor: R$ 666.666,67"), DetalheTabela("Número: 2008NE800005", "Valor: R$ 235.000,00"), DetalheTabela("Número: 2008NE800006", "Valor: R$ 7.540.451,18"), DetalheTabela("Número: 2008NE800009", "Valor: R$ 2.301.592,83")]
    }

    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btnAjuda(sender: UIBarButtonItem) {
        
        self.presentViewController(Alert.message("Ajuda", message: "O empenho representa o primeiro estágio da despesa orçamentária. É registrado no momento da contratação do serviço, aquisição do material ou bem, obra e amortização da dívida."), animated: true, completion: nil)
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
            
            cell.lblColunaEmpenho.text = empenho.coluna
            cell.lblValorEmpenho.text = empenho.valor
        
        return cell
    }
}
