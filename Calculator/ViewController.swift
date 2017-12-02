//
//  ViewController.swift
//  Calculator
//
//  Created by Kelvin Lui on 12/1/17.
//  Copyright © 2017 Kelvin Lui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var savedValue: Double!
    var savedOperator: String!
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if(userIsInTheMiddleOfTyping) {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }
    
    func clearDisplay() {
        if(displayValue != 0) {
            display.text = String(0)
            userIsInTheMiddleOfTyping = false
        }
    }
    
    @IBAction func clearData(_ sender: UIButton) {
        clearDisplay()
        savedValue = nil
        savedOperator = nil
    }
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        userIsInTheMiddleOfTyping = false 
        if let mathSymbol = sender.currentTitle {
            switch mathSymbol {
            case "√":
                displayValue = sqrt(displayValue)
            case "+":
                savedValue = displayValue
                savedOperator = "+"
                clearDisplay()
            case "-":
                savedValue = displayValue
                savedOperator = "-"
                clearDisplay()
            case "/":
                savedValue = displayValue
                savedOperator = "/"
                clearDisplay()
            case "*":
                savedValue = displayValue
                savedOperator = "*"
                clearDisplay()
            default:
                break
            }
        }
    }
    
    @IBAction func execute(_ sender: UIButton) {
        if(savedValue != nil && savedOperator != nil) {
            switch savedOperator {
            case "-":
                displayValue = savedValue - displayValue
            case "+":
                displayValue = savedValue + displayValue
            case "*":
                displayValue = savedValue * displayValue
            case "/":
                displayValue = savedValue / displayValue
            default:
                break
            }
            savedValue = nil
            savedOperator = nil
            userIsInTheMiddleOfTyping = false;
        }
    }
    
}

