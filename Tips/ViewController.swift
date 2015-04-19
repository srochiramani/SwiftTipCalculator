//
//  ViewController.swift
//  Tips
//
//  Created by Sunny Rochiramani on 4/16/15.
//  Copyright (c) 2015 Sunny Rochiramani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // default label text's
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // select user's default preferred tip setting
        tipControl.selectedSegmentIndex = NSUserDefaults.standardUserDefaults().integerForKey("tip_percentage_value")
        onBillAmountChanged(animated)
    }

    @IBAction func onBillAmountChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.20, 0.30];
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onTipChanged(sender: AnyObject) {
        onBillAmountChanged(sender)
    }

}

