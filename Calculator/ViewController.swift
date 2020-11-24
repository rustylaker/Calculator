//
//  ViewController.swift
//  Calculator
//
//  Created by 韦子龙 on 2020/10/15.
//


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelResult: UILabel!
    var firstOperand: Double = 0.0
    var secondOperand: Double = 0.0
    var decimalPointFlag: Bool = false
    var isSecond: Bool = false
    var operatorFlag: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func buttonTap(sender: UIButton) {
        if labelResult.text == "0" || (isSecond && secondOperand == 0.0) {
            labelResult.text = ""
        }
        labelResult.text = labelResult.text! + sender.titleLabel!.text!
        
        if isSecond {
            secondOperand = NSString(string: labelResult.text!).doubleValue
        }else {
            firstOperand = NSString(string: labelResult.text!).doubleValue
        }
        print(firstOperand)
    }
    
    
    @IBAction func decimalPointTap() {
        if !decimalPointFlag {
            labelResult.text = labelResult.text! + "."
            if isSecond {
                secondOperand = (labelResult.text! as NSString).doubleValue
            }else {
                firstOperand = (labelResult.text! as NSString).doubleValue
            }
            
            decimalPointFlag = !decimalPointFlag
        }
    }
    
    
    @IBAction func operatorTap(sender: UIButton) {
        if firstOperand != 0 {
            isSecond = true
            decimalPointFlag = false
            switch sender.titleLabel!.text! {
            case "➕":
                operatorFlag = "+"
            case "➖":
                operatorFlag = "-"
            case "✖️":
                operatorFlag = "*"
            case "➗":
                operatorFlag = "/"
            default:
                operatorFlag = " "
            }
        }
    }
    
    
    @IBAction func resultTap(sender: UIButton) {
        if isSecond {
            if operatorFlag == "/" && secondOperand == 0 {
                return
            }
            var result: Double = 0.0
            switch operatorFlag {
            case "+":
                result = firstOperand + secondOperand
            case "-":
                result = firstOperand - secondOperand
            case  "*":
                result = firstOperand * secondOperand
            case  "/":
                result = firstOperand / secondOperand
            default :
                result = 0.0
            }
            labelResult.text = result.description
        }
    }
    
    
    @IBAction func clear(sender: UIButton) {
        labelResult.text = "0"
        firstOperand = 0.0
        secondOperand = 0.0
        decimalPointFlag = false
        isSecond = false
        operatorFlag = ""
    }
}


