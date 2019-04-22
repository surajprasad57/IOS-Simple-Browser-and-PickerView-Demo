//
//  ViewController.swift
//  PickerViewDemo
//
//  Created by Suraj Prasad on 19/02/19.
//  Copyright © 2019 Suraj Prasad. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIPickerViewDataSource, UIPickerViewDelegate{
    //MARK:- IBOutlets
    
    @IBOutlet weak var pickerViewDataLabel: UILabel!
    @IBOutlet weak var pickerViewOutlet: UIPickerView!
    @IBOutlet weak var showButtonOutlet: UIButton!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var goButton: UIButton!
    
    //MARK:- Global Variables
    var websites = ["Google","Facebook","Instagram","AKTU Result","YouTube","PayTm","LinkedIn","WhatsAppWeb"]
    var webUrl = ["https://www.google.com","https://www.facebook.com","https://www.instagram.com","https://erp.aktu.ac.in/WebPages/OneView/OneView.aspx","https://www.youtube.com","https://www.paytm.com","https://www.linkedin.com","https://web.whatsapp.com"]
    var rowNumber = 0
    var pickerRow = "Google"
    
    //MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        urlTextField.text = " "
    }
    //MARK:- IBAction Methods
    @IBAction func showLabelButton(_ sender: UIButton) {
        //On tap moves to next view
        urlTextField.text = " "
    }
    
    @IBAction func tapGoButton(_ sender: UIButton) {
    
       
    }
    
    @IBAction func tapCancelButton(_ sender: Any) {
       
        urlTextField.text = " "
    }
    //MARK:- Public Methods
    //sends data to connectd view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondView = segue.destination as! SecondViewController
        
        if showButtonOutlet.isTouchInside == true {
        secondView.websiteName = pickerRow
            secondView.webUrl = webUrl[rowNumber]
        }
        if goButton.isTouchInside == true {
            while urlTextField.text != " " {
        secondView.webUrl = urlTextField.text!
            print("url text field used")
              urlTextField.text = " "
                secondView.websiteName = "SRJ Browser"
            }}
        

        }
    //MARK:- Delegates for PickerVIew
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
     return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
             return websites.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return websites[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        pickerRow = websites[row]
        pickerViewDataLabel.text = pickerRow
        rowNumber = row
        }
    
}
