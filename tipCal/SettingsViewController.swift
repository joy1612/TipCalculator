//
//  SettingsViewController.swift
//  tipCal
//
//  Created by Jay Zalawadia on 8/14/17.
//  Copyright © 2017 Jay Zalawadia. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipValue: UISegmentedControl!
    @IBOutlet weak var defaultSplitByPeople: UISegmentedControl!
    var tipPerSet = [10,20,30]
    var splitBySet = [2,3,4]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        defTipValue()
        
        defaultSplitValue()
        
        
    }
    
    func defTipValue(){
        
        let selectedDefaultTipValue = tipPerSet[defaultTipValue.selectedSegmentIndex]
        let defaults = UserDefaults.standard
        defaults.set(selectedDefaultTipValue, forKey: "defaultTip")
        defaults.synchronize()
        
    }
    
    func defaultSplitValue(){
        
        let selectedDefaultSplitBy = splitBySet[defaultSplitByPeople.selectedSegmentIndex]
        let defaults = UserDefaults.standard
        defaults.set(selectedDefaultSplitBy, forKey: "defaultSplitBy")
        defaults.synchronize()
        
    }
    
    
    
    

    @IBAction func defTipValue(_ sender: Any) {
        
        defTipValue()
        
    }
    
    @IBAction func defSplitByPeople(_ sender: Any) {
        
        defaultSplitValue()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
