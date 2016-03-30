//
//  ConveniosViewController.swift
//  cidadaoalerta
//
//  Created by Renato Guarato on 12/03/16.
//  Copyright © 2016 Renato Guarato. All rights reserved.
//

import UIKit

class ConveniosViewController: UIViewController, UIPickerViewDelegate, UITextFieldDelegate, UIPickerViewDataSource {

    @IBOutlet weak var txtEstados: UITextField!
    @IBOutlet weak var txtCidades: UITextField!
    @IBOutlet weak var txtDataInicial: UITextField!
    @IBOutlet weak var txtDataFinal: UITextField!
    
    var estados = ["Distrito Federal", "Minas Gerais", "São Paulo"]
    var cidades = ["Brasília", "Belo Horizonte", "Ribeirão Preto"]
    
    var pickerEstados: UIPickerView!
    var pickerCidades: UIPickerView!
    
    var itemsSearched = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.pickerEstados = UIPickerView()
        self.pickerEstados.tag = 0
        self.pickerEstados.delegate = self
        self.pickerEstados.dataSource = self
        
        self.pickerCidades = UIPickerView()
        self.pickerCidades.tag = 1
        self.pickerCidades.delegate = self
        self.pickerCidades.dataSource = self
        
        let selectEstados = Selector("dismissEstados")
        let toolbarEstados = createToolbar(selectEstados)
        self.txtEstados.inputView = self.pickerEstados
        self.txtEstados.inputAccessoryView = toolbarEstados

        let selectCidades = Selector("dismissCidades")
        let toolbarCidades = createToolbar(selectCidades)
        self.txtCidades.inputView = self.pickerCidades
        self.txtCidades.inputAccessoryView = toolbarCidades
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    func dismissEstados() {
        
        self.txtEstados.resignFirstResponder()
    }
    
    func dismissCidades() {
        
        self.txtCidades.resignFirstResponder()
    }
    
    func dismissInicial() {
        
        self.txtDataInicial.resignFirstResponder()
    }

    func dismissFinal() {
        
        self.txtDataFinal.resignFirstResponder()
    }
    
    func createToolbar(closeFunc: Selector) -> UIToolbar {
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.Default
        toolBar.translucent = true
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Fechar", style: UIBarButtonItemStyle.Plain, target: self, action: closeFunc)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([spaceButton, spaceButton, doneButton], animated: false)
        toolBar.userInteractionEnabled = true
        
        return toolBar
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
    
    func dismissKeyboard() {
        
        view.endEditing(true)
    }
    
    @IBAction func txtDataInicial(sender: UITextField) {
        
        let pickerDataInicial: UIDatePicker = UIDatePicker()
        pickerDataInicial.datePickerMode = UIDatePickerMode.Date
        pickerDataInicial.addTarget(self, action: Selector("changeDataInicial:"), forControlEvents: UIControlEvents.ValueChanged)
        
        let df = NSDateFormatter()
        df.dateFormat = "dd/MM/yyyy"
        let date = df.dateFromString(sender.text!)
        if let unwrappedDate = date {
            pickerDataInicial.setDate(unwrappedDate, animated: false)
        }
        
        let selectInicial = Selector("dismissInicial")
        let toolbarInicial = createToolbar(selectInicial)
        self.txtDataInicial.inputView = pickerDataInicial
        self.txtDataInicial.inputAccessoryView = toolbarInicial
    }
    
    func changeDataInicial(sender: UIDatePicker) {
        
        self.txtDataInicial.text = sender.date.formatted
    }
    
    @IBAction func txtDataFinal(sender: UITextField) {
        
        let pickerDataFinal: UIDatePicker = UIDatePicker()
        pickerDataFinal.datePickerMode = UIDatePickerMode.Date
        pickerDataFinal.addTarget(self, action: Selector("changeDataFinal:"), forControlEvents: UIControlEvents.ValueChanged)
        
        let df = NSDateFormatter()
        df.dateFormat = "dd/MM/yyyy"
        let date = df.dateFromString(sender.text!)
        if let unwrappedDate = date {
            pickerDataFinal.setDate(unwrappedDate, animated: false)
        }
        
        let selectFinal = Selector("dismissFinal")
        let toolbarFinal = createToolbar(selectFinal)
        self.txtDataFinal.inputView = pickerDataFinal
        self.txtDataFinal.inputAccessoryView = toolbarFinal
    }
    
    func changeDataFinal(sender: UIDatePicker) {
        
        self.txtDataFinal.text = sender.date.formatted
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int  {
        
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 0 {
            return self.estados.count
        } else if pickerView.tag == 1 {
            return self.cidades.count
        }
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 0 {
            return self.estados[row]
        } else if pickerView.tag == 1 {
            return self.cidades[row]
        }
        return ""
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)  {
        
        if pickerView.tag == 0 {
            self.txtEstados.text = self.estados[row]
        } else if pickerView.tag == 1 {
            self.txtCidades.text = self.cidades[row]
        }
    }
    
    @IBAction func btnAjuda(sender: UIBarButtonItem) {
        
        self.presentViewController(Alert.message("Ajuda", message: "O convênio é o instrumento que disciplina os compromissos que devem reger as relações de dois ou mais participantes (Governo Federal e prefeitura, por exemplo) que tenham interesse em atingir um objetivo comum, mediante a formação de uma parceria."), animated: true, completion: nil)
    }
    
    @IBAction func btnPesquisar(sender: UIButton) {
        
        view.endEditing(true)

        print(txtEstados.text)
        print(txtCidades.text)
        print(txtDataInicial.text)
        print(txtDataFinal.text)
        
        let df = NSDateFormatter()
        df.dateFormat = "dd/MM/yyyy"
        let dateInicial = df.dateFromString(txtDataInicial.text!)
        let dateFinal = df.dateFromString(txtDataFinal.text!)
        
        if dateInicial == nil || dateFinal == nil {
            print("Informe as duas datas")
        }
        else {
            if dateInicial != nil && dateFinal != nil {
                if dateInicial!.compare(dateFinal!) == NSComparisonResult.OrderedDescending {
                    print("Data inicial maior que data final");
                }
            }
        }
        
        // TODO: incluir chamada ao serviço
        itemsSearched = [Convenio("700026", "PROMOÇÃO E PARTICIPAÇÃO EM EVENTOS TURISTICOS NACIONAIS E INTERNACIONAIS - EMENDAS", 3),
            Convenio("700027", "0152 - Sistema Nacional de Atendimento Socioeducativo ao Adolescente em Conflito com a Lei - Pró-Sinase - CONVÊNIOS", 0),
            Convenio("700028", "Aquisição de Alimentos Provenientes da Agricultura Familiar", 1000),
            Convenio("700029", "Apoio à Agricultura Urbana, Periurbana e Sistemas Coletivos de Produção para o Autoconsumo", 10),
            Convenio("700030", "Turismo Social no Brasil: Uma Viagem de Inclusão - Convênios", 1),
            Convenio("700031", "PROMOÇÃO E PARTICIPAÇÃO EM EVENTOS TURISTICOS NACIONAIS E INTERNACIONAIS - PROGRAMAÇÃO", 5),
            Convenio("700032", "1008 -  Inclusão Digital / Ação Observatório Nacional de Inclusão Digital", 1),
            Convenio("700033", "1025 - Promoção da Sustentabilidade de Espaços Sub-Regionais - PROMESO - Ação 04.845.1025.005E.0210 - Apoio a Projetos de Desenvolvimento Sustentável Local Integrado - em Subregiões - No Estado do Piauí", 100),
            Convenio("700034", "Programa de Apoio a Núcleos de Excelência - PRONEX", 9)]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "segueBuscaConvenios" {
            
            let buscaConveniosController = segue.destinationViewController as! BuscaConveniosViewController
            buscaConveniosController.items = itemsSearched
        }
    }
}

extension NSDate {
    var formatted: String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return  formatter.stringFromDate(self)
    }
}

