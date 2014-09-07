//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Julien Lecomte on 9/7/14.
//  Copyright (c) 2014 Julien Lecomte. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var roundupSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()

        var defaults = NSUserDefaults.standardUserDefaults()
        let roundup = defaults.boolForKey("roundup")
        roundupSwitch.setOn(roundup, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func roundupValueChanged(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(roundupSwitch.on, forKey: "roundup")
        defaults.synchronize()
    }
}
