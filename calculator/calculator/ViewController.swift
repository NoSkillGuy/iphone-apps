//
//  ViewController.swift
//  calculator
//
//  Created by siva praveen Rayapudi on 10/07/18.
//  Copyright © 2018 siva praveen Rayapudi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false;
    var previousOperator:Double = 0;
    
    @IBOutlet weak var variables_label: UILabel!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true
        {
            label.text = ""
            performingMath = false
        }
        label.text = label.text! + String(sender.tag-1)
        numberOnScreen = Double(label.text!)!
        variables_label.text = "NOS: " + String(numberOnScreen) + " PN: " + String(previousNumber) + " PM: " + String(performingMath) + " PO: " + String(previousOperator)
    }
    
    @IBAction func operators(_ sender: UIButton) {
        variables_label.text = "NOS: " + String(numberOnScreen) + " PN: " + String(previousNumber) + " PM: " + String(performingMath) + " PO: " + String(previousOperator)
        if label.text != "" && sender.tag != 11 && sender.tag != 12 && sender.tag != 13 && sender.tag != 18
        {
            previousNumber = Double(label.text!)!
            previousOperator = Double(sender.tag)
            performingMath = true;
            if sender.tag == 14 // Divide
            {
                label.text = "/"
            }
            else if sender.tag == 15 // Multipy
            {
                label.text = "*"
            }
            else if sender.tag == 16 // Minus
            {
                label.text = "-"
            }
            else if sender.tag == 17 // Plus
            {
                label.text = "+"
            }
        }
        else if sender.tag == 18 // Equals
        {
            if previousOperator == 14
            {
                label.text = String(previousNumber / numberOnScreen)
            }
            else if previousOperator == 15
            {
                label.text = String(previousNumber * numberOnScreen)
            }
            else if previousOperator == 16
            {
                label.text = String(previousNumber - numberOnScreen)
            }
            else if previousOperator == 17
            {
                label.text = String(previousNumber + numberOnScreen)
            }
            previousNumber = Double(label.text!)!
        }
        else if sender.tag == 11
        {
            numberOnScreen = 0
            previousOperator = 0
            performingMath = false
            label.text = ""
            previousNumber = 0
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

