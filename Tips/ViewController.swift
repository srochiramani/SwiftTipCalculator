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
        
        let userPrefs = NSUserDefaults.standardUserDefaults()
        var now = NSDate()
        var last: AnyObject? = userPrefs.objectForKey("last_exit_time")
        if last != nil {
            let cal = NSCalendar.currentCalendar()
            let unit:NSCalendarUnit = .CalendarUnitMinute
            var lastDate : NSDate = last! as NSDate
            let components = cal.components(unit, fromDate: lastDate, toDate: now, options: nil)
            if components.minute <= 10 {
                billField.text = userPrefs.stringForKey("bill_amount")
            }
        }
        
        // auto-focus on total bill amount
        billField.becomeFirstResponder()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // select user's default preferred tip setting
        tipControl.selectedSegmentIndex = NSUserDefaults.standardUserDefaults().integerForKey("tip_percentage_value")
        onBillAmountChanged(animated)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        NSUserDefaults.standardUserDefaults().setObject(NSDate(), forKey: "last_exit_time")
        NSUserDefaults.standardUserDefaults().synchronize()
    }

    @IBAction func onBillAmountChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.20, 0.30];
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        // store the bill amount in shared prefs
        NSUserDefaults.standardUserDefaults().setDouble(billAmount, forKey: "bill_amount")
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onTipChanged(sender: AnyObject) {
        onBillAmountChanged(sender)
    }

}

