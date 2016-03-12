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
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.pickerEstados = UIPickerView()
        self.pickerEstados.tag = 0
        self.pickerEstados.delegate = self
        
        self.pickerCidades = UIPickerView()
        self.pickerCidades.tag = 1
        self.pickerCidades.delegate = self
        
        self.txtEstados.inputView = self.pickerEstados
        self.txtCidades.inputView = self.pickerCidades
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
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
        
        self.txtDataInicial.inputView = pickerDataInicial
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
        
        self.txtDataFinal.inputView = pickerDataFinal
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
    }
}

extension NSDate {
    var formatted: String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return  formatter.stringFromDate(self)
    }
}

