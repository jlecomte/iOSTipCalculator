//
//  ViewController.swift
//  TipCalculator
//
//  Created by Julien Lecomte on 9/7/14.
//  Copyright (c) 2014 Julien Lecomte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfCheckAmount: UITextField!
    @IBOutlet weak var scTipPercentage: UISegmentedControl!
    @IBOutlet weak var lbTipAmount: UILabel!
    @IBOutlet weak var lbTotalAmount: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(animated: Bool) {
        computeTipAndTotalAmount()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func checkAmountChanged(sender: AnyObject) {
        computeTipAndTotalAmount();
    }

    @IBAction func onTipPercentageChanged(sender: AnyObject) {
        computeTipAndTotalAmount();
    }

    func computeTipAndTotalAmount() {
        let tipPercentages = [0.15, 0.2, 0.25]

        var defaults = NSUserDefaults.standardUserDefaults()
        let roundup = defaults.boolForKey("roundup")

        var checkAmount = NSString(string: tfCheckAmount.text).doubleValue
        var tipPercentage = tipPercentages[scTipPercentage.selectedSegmentIndex]
        var tipAmount = checkAmount * tipPercentage
        var totalAmount = checkAmount + tipAmount

        if roundup {
            totalAmount = ceil(totalAmount)
            tipAmount = totalAmount - checkAmount
        }

        lbTipAmount.text = String(format: "$%.2f", tipAmount)
        lbTotalAmount.text = String(format: "$%.2f", totalAmount)
    }
}
