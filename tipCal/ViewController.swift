//
//  ViewController.swift
//  tipCal
//
//  Created by Jay Zalawadia on 8/10/17.
//  Copyright © 2017 Jay Zalawadia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var totalWithTip: UILabel!
    @IBOutlet weak var tipCalculated: UILabel!
    @IBOutlet weak var totalBill: UITextField!
    @IBOutlet weak var tipPerLbl: UILabel!
    
    @IBOutlet weak var splitByPeople: UIPickerView!
    @IBOutlet weak var displaySplitPerson: UILabel!
    
    @IBOutlet weak var totalSplitByPeople: UILabel!
    @IBOutlet weak var sliderOutside: UISlider!
    @IBAction func onTapExitKeypad(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    var splitByNum =  Array(1...50)
   // let totalBill
    
    
    @IBAction func tipSlider(_ sender: UISlider) {
        let defaults = UserDefaults.standard
        
        
        //let defaults = UserDefaults.standard
        let defaultTipSegment = defaults.integer(forKey: "defaultTip")
        tipPerLbl.text = String(defaultTipSegment)
        
        
        
        tipCalculation()
        
        
    }
    
    func tipCalculation(){
        
        tipPerLbl.text = String(Int(sliderOutside.value))
        
        let tipConvToPer = Float(tipPerLbl.text!)!/100
        
        let tipAmount = tipConvToPer * (Float(totalBill.text!) ?? 00.00)
        tipCalculated.text = String(format: "%.2f",tipAmount)
        tipCalculated.adjustsFontSizeToFitWidth = true
        tipCalculated.minimumScaleFactor = 0.05
        
        let totalBillWithTip =  (Float(totalBill.text!) ?? 00.00) + tipAmount
        totalWithTip.text = String(format: "%.2f", totalBillWithTip)
        totalWithTip.adjustsFontSizeToFitWidth = true
        totalWithTip.minimumScaleFactor = 0.05
        
        totalSplitByPeople.text = String(format: "%.2f", (Float(totalWithTip.text!) ?? 00.00) / Float(displaySplitPerson.text!)! )
        totalSplitByPeople.adjustsFontSizeToFitWidth = true
        totalSplitByPeople.minimumScaleFactor = 0.05
    }
    
    

    
    func defaultTip(){
        let defaults = UserDefaults.standard
        let defaultTipSegment = defaults.integer(forKey: "defaultTip")
        tipPerLbl.text = String(defaultTipSegment)
        sliderOutside.value = Float(defaultTipSegment)
    }
    
    func defaultSplitBy(){
        let defaults = UserDefaults.standard
        let defaultSplitBy = defaults.integer(forKey: "defaultSplitBy")
        displaySplitPerson.text = String(defaultSplitBy)
        splitByPeople.selectRow((defaultSplitBy - 1), inComponent: 0, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipPerLbl.text = String(Int(sliderOutside.value))
        splitByPeople.dataSource = self
        splitByPeople.delegate = self
        
        defaultTip()
        defaultSplitBy()
        
        
    }
    
    
    //to make default tip appear after the page changes to home page
    
    override func viewWillAppear(_ animated: Bool) {
        defaultTip()
        defaultSplitBy()
        tipCalculation()
    }
    
    @IBAction func changed(_ sender: Any) {
       tipCalculation()
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return splitByNum.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(splitByNum[row])
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        displaySplitPerson.text = String(splitByNum[row])
        let noOfPeople = Float(displaySplitPerson.text!)!
        
        totalSplitByPeople.text = String( (Float(totalWithTip.text!) ?? 00.00) / noOfPeople )
        
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributeString = NSAttributedString(string: String(splitByNum[row]), attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])
        return attributeString
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}

