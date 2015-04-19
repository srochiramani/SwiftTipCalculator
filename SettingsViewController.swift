//
//  SettingsViewController.swift
//  Tips
//
//  Created by Sunny Rochiramani on 4/18/15.
//  Copyright (c) 2015 Sunny Rochiramani. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let tip_default_key = "tip_percentage_value"

    @IBOutlet weak var tipValueSegmentControl: UISegmentedControl!
    
    var user_defaults : NSUserDefaults;
    
    required init(coder aDecoder: NSCoder) {
        user_defaults = NSUserDefaults.standardUserDefaults()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var defaultUserTipIndex = user_defaults.integerForKey(tip_default_key)
        tipValueSegmentControl.selectedSegmentIndex = defaultUserTipIndex
    }

    @IBAction func onTipValueChanged(sender: AnyObject) {
        let tipSegmentControlSelectedIndex = tipValueSegmentControl.selectedSegmentIndex
        
        // store the value
        user_defaults.setInteger(tipSegmentControlSelectedIndex, forKey: tip_default_key)
        user_defaults.synchronize()
        
    }

}
