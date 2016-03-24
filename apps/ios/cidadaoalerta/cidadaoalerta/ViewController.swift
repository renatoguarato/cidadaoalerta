//
//  ViewController.swift
//  cidadaoalerta
//
//  Created by Renato Guarato on 11/03/16.
//  Copyright © 2016 Renato Guarato. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let section = ["Despesas", "Receitas", "Convênios", "Sanções", "Servidores", "CEPIM", "Imóveis Funcionais"]
    
    let items = [["Recursos registrados (mensais): R$ 17.230.389.176.818,80", "Quantidade de informações registradas: 2.110.034.573"],
        ["Dados atualizados em: 7 de Março de 2016", "Recursos envolvidos: 14.002.041.307.201,60", "Quantidade de informações registradas: 97.807"],
        ["Dados atualizados em: 28 de Fevereiro de 2016", "Recursos envolvidos: R$ 1.117.827.701.503,73", "Quantidade de informações registradas: 468.893"],
        ["Dados atualizados em: 8 de Março de 2016 (CEIS e CNEP) e 1 de Março de 2016 (servidores punidos)", "Quantidade de informações registradas CEIS: 12.229", "Quantidade de informações registradas CNEP: 1", "Quantidade de informações registradas: 3.568 (servidores punidos)"],
        ["Dados atualizados em: 31 de Janeiro de 2016 (servidores) e 1 de Março de 2016 (servidores punidos)", "Quantidade de informações registradas: 1.173.179 (servidores)", "Quantidade de informações registradas: 3.568 (servidores punidos)"],
        ["Dados atualizados em: 7 de Março de 2016", "Quantidade de informações registradas: 3.100"],
        ["Dados atualizados em: 2 de Fevereiro de 2016", "Quantidade de informações registradas: 2.865"]]

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "tableCell")

        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 160.0
        
        self.automaticallyAdjustsScrollViewInsets = false
        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
    
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if let sectionArrays = self.section as [String]? {
            return sectionArrays[section]
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return self.section.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.items[section].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = self.items[indexPath.section][indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        
        return cell
        
    }
    
}

