//
//  BuscaConveniosViewController.swift
//  cidadaoalerta
//
//  Created by Renato Guarato on 12/03/16.
//  Copyright © 2016 Renato Guarato. All rights reserved.
//

import UIKit

class BuscaConveniosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let items = ["PROMOÇÃO E PARTICIPAÇÃO EM EVENTOS TURISTICOS NACIONAIS E INTERNACIONAIS - EMENDAS","0152 - Sistema Nacional de Atendimento Socioeducativo ao Adolescente em Conflito com a Lei - Pró-Sinase - CONVÊNIOS","Aquisição de Alimentos Provenientes da Agricultura Familiar","Apoio à Agricultura Urbana, Periurbana e Sistemas Coletivos de Produção para o Autoconsumo","Turismo Social no Brasil: Uma Viagem de Inclusão - Convênios","PROMOÇÃO E PARTICIPAÇÃO EM EVENTOS TURISTICOS NACIONAIS E INTERNACIONAIS - PROGRAMAÇÃO","1008 -  Inclusão Digital / Ação Observatório Nacional de Inclusão Digital","1025 - Promoção da Sustentabilidade de Espaços Sub-Regionais - PROMESO - Ação 04.845.1025.005E.0210 - Apoio a Projetos de Desenvolvimento Sustentável Local Integrado - em Subregiões - No Estado do Piauí","Programa de Apoio a Núcleos de Excelência - PRONEX"]
    
    @IBOutlet weak var tableView: UITableView!
    
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

    @IBAction func btnVoltar(sender: UIBarButtonItem) {
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = self.items[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        UIView.setAnimationsEnabled(false)
        performSegueWithIdentifier("segueDetalhesConvenios", sender: self)
//        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "segueDetalhesConvenios" {
            
            let detalhesConveniosController = segue.destinationViewController as! DetalhesConveniosViewController
        }
    }
    
}
