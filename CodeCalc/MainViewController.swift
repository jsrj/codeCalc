//
//  MainViewController.swift
//  CodeCalc
//
//  Created by Arjay Jones on 12/26/17.
//  Copyright © 2017 ArjayCodes. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var displayValue:     String = ""
    var selectedDisplay:  String = "mainDisplay"
    
    var mainVal:          String?
    var calculatedMain:   Int?
    var varA:             String?
    var calculatedA:      Int?
    var varB:             String?
    var calculatedB:       Int?
    var varX:             String?
    var calculatedX:      Int?
    var varY:             String?
    var calculatedY:      Int?
    
    // Main Display
    @IBOutlet weak var mainDisplay: UITextField?
    // General Variable Displays
    @IBOutlet weak var variableA_display: UITextField?
    @IBOutlet weak var variableB_display: UITextField?
    @IBOutlet weak var variableX_display: UITextField?
    @IBOutlet weak var variableY_display: UITextField?
    
    // Display-Specific Functionality
    func updateDisplay(val: String = "", target: String = "mainDisplay", append: Bool = false) -> Void {
        if (val == "[CLEAR]"){
            displayValue = ""
        } else {
            displayValue = append ? displayValue + val : val
        }
        
        switch target
        {
        case "variableA_display":
            varA = varA == nil ? "" : varA
            varA = append ? varA! + displayValue : displayValue
            variableA_display?.text! = varA!
            displayValue = ""
        case "variableB_display":
            varB = varB == nil ? "" : varB
            varB = append ? varB! + displayValue : displayValue
            variableB_display?.text! = varB!
            displayValue = ""
        case "variableX_display":
            varX = varX == nil ? "" : varX
            varX = append ? varX! + displayValue : displayValue
            variableX_display?.text! = varX!
            displayValue = ""
        case "variableY_display":
            varY = varY == nil ? "" : varY
            varY = append ? varY! + displayValue : displayValue
            variableY_display?.text! = varY!
            displayValue = ""
        case "mainDisplay":
            mainVal = mainVal == nil ? "" : mainVal
            mainVal = append ? mainVal! + displayValue : displayValue
            mainDisplay?.text! = mainVal!
            displayValue = ""
        default:
            break
        }
    }
    func outlineSelected(display: String = "mainDisplay"){
        variableA_display!.layer.borderWidth = 0
        variableB_display!.layer.borderWidth = 0
        variableX_display!.layer.borderWidth = 0
        variableY_display!.layer.borderWidth = 0
        switch display
        {
            case "mainDisplay":
                variableA_display!.layer.borderWidth = 0
                variableB_display!.layer.borderWidth = 0
                variableX_display!.layer.borderWidth = 0
                variableY_display!.layer.borderWidth = 0
            case "variableA_display":
                variableA_display!.layer.borderWidth = 2
                variableA_display!.layer.borderColor! = UIColor.white.cgColor
            case "variableA_display":
                variableB_display!.layer.borderWidth = 2
                variableB_display!.layer.borderColor! = UIColor.white.cgColor
            case "variableA_display":
                variableX_display!.layer.borderWidth = 2
                variableX_display!.layer.borderColor! = UIColor.white.cgColor
            case "variableA_display":
                variableY_display!.layer.borderWidth = 2
                variableY_display!.layer.borderColor! = UIColor.white.cgColor
        default:
            break
        }
    }
    
    // Display Selector
    @IBAction func select_main_display(_ mainDisplay: UITextField?) -> Void {
        selectedDisplay = "mainDisplay"
        outlineSelected()
    }
    @IBAction func select_varA_display(_ variableA_display: UITextField?) -> Void {
        selectedDisplay = "variableA_display"
        outlineSelected(display: "variableA_display")
    }
    @IBAction func select_varB_display(_ variableB_display: UITextField?) -> Void {
        selectedDisplay = "variableB_display"
        outlineSelected(display: "variableB_display")
    }
    @IBAction func select_varX_display(_ variableX_dislay: UITextField?) -> Void {
        selectedDisplay = "variableX_display"
        outlineSelected(display: "variableB_display")
    }
    @IBAction func select_varY_display(_ variableY_display: UITextField?) -> Void {
        selectedDisplay = "variableY_display"
        outlineSelected(display: "variableB_display")
    }
    @IBAction func match_display_value(_ mainDisplay: UITextField?) -> Void {
        displayValue = mainDisplay!.text!
    }
    
//    @IBAction func clear_main_display(_ mainDisplay: UITextField?) -> Void {
//        updateDisplay(val: "[CLEAR]", target: "mainDisplay", append: false)
//    }
    
    // Number Pad Inputs
    @IBAction func in0(_ numpad_0: UIButton!) -> Void {
        updateDisplay(val: "0", target: selectedDisplay, append: true)
    }
    @IBAction func in1(_ numpad_1: UIButton!) -> Void {
        updateDisplay(val: "1", target: selectedDisplay, append: true)
    }
    @IBAction func in2(_ numpad_2: UIButton!) -> Void {
        updateDisplay(val: "2", target: selectedDisplay, append: true)
    }
    @IBAction func in3(_ numpad_3: UIButton!) -> Void {
        updateDisplay(val: "3", target: selectedDisplay, append: true)
    }
    @IBAction func in4(_ numpad_4: UIButton!) -> Void {
        updateDisplay(val: "4", target: selectedDisplay, append: true)
    }
    @IBAction func in5(_ numpad_5: UIButton!) -> Void {
        updateDisplay(val: "5", target: selectedDisplay, append: true)
    }
    @IBAction func in6(_ numpad_6: UIButton!) -> Void {
        updateDisplay(val: "6", target: selectedDisplay, append: true)
    }
    @IBAction func in7(_ numpad_7: UIButton!) -> Void {
        updateDisplay(val: "7", target: selectedDisplay, append: true)
    }
    @IBAction func in8(_ numpad_8: UIButton!) -> Void {
        updateDisplay(val: "8", target: selectedDisplay, append: true)
    }
    @IBAction func in9(_ numpad_9: UIButton!) -> Void {
        updateDisplay(val: "9", target: selectedDisplay, append: true)
    }
    @IBAction func dec(_ num_deci: UIButton!) -> Void {
        updateDisplay(val: ".", target: selectedDisplay, append: true)
    }
    
    // General Variable Selectors
    @IBAction func trigger_varA(_ varA_selector: UIButton!) -> Void {
        let varA_displayValue = variableA_display?.text!

        if (varA_displayValue!.count > 0) {
            updateDisplay(val: "A", target: selectedDisplay, append: true)
        } else {
            let parsedVal = displayValue.filter {
                "01234567890.BXY+-/*%".contains($0)
            }
            updateDisplay(val: parsedVal, target: "variableA_display")
            updateDisplay(val: "[CLEAR]", target: "mainDisplay")
        }
    }
    @IBAction func trigger_varB(_ varB_selector: UIButton!) -> Void {
        let varB_displayValue = variableB_display?.text!
        if (varB_displayValue!.count > 0) {
            updateDisplay(val: "B", target: selectedDisplay, append: true)
        } else {
            let parsedVal = displayValue.filter {
                "01234567890.AXY+-/*%".contains($0)
            }
            updateDisplay(val: parsedVal, target: "variableB_display")
            updateDisplay(val: "[CLEAR]", target: "mainDisplay")
        }
    }
    @IBAction func trigger_varX(_ varX_selector: UIButton!) -> Void {
        let varX_displayValue = variableX_display?.text!
        if (varX_displayValue!.count > 0) {
            updateDisplay(val: "X", target: selectedDisplay, append: true)
        } else {
            let parsedVal = displayValue.filter {
                "01234567890.ABY+-/*%".contains($0)
            }
            updateDisplay(val: parsedVal, target: "variableX_display")
            updateDisplay(val: "[CLEAR]", target: "mainDisplay")
        }
    }
    @IBAction func trigger_varY(_ varY_selector: UIButton!) -> Void {
        let varY_displayValue = variableY_display?.text!
        if (varY_displayValue!.count > 0) {
            updateDisplay(val: "Y", target: selectedDisplay, append: true)
        } else {
            let parsedVal = displayValue.filter {
                "01234567890.ABX+-/*%".contains($0)
            }
            updateDisplay(val: parsedVal, target: "variableY_display")
            updateDisplay(val: "[CLEAR]", target: "mainDisplay")
        }
    }
    
    // Operator Inputs
    var activeMethod: String?
    //var activeValue1: Int?   = nil
    //var activeValue2: Int?   = nil
    var currentSet:   String = "AB"
    
    @IBAction func multiply(_ pemdas_mult: UIButton!) -> Void {
        /*
         Find first empty variable to store current value.
         If none are empty, overwrite A and store it as first overwritten.
         If pressed again, overwrite or populate next variable (e.g. B, X, or Y).
        */
        activeMethod = "Multiply"
        
        
        if (currentSet == "AB") {
            calculatedB = calculatedA != nil ? Int(mainVal!) : nil
            calculatedA = calculatedB == nil ? Int(mainVal!) : calculatedA!
            if (calculatedA != nil) {
                varA        = String(calculatedA!)
                updateDisplay(val: varA!, target: "variableA_display", append: false)
            }
            if (calculatedB != nil) {
                varB        = String(calculatedB!)
                updateDisplay(val: varB!, target: "variableB_display", append: false)
            }
        }
        if (currentSet == "XY") {
            calculatedY = calculatedX != nil ? Int(mainVal!) : nil
            calculatedX = calculatedY == nil ? Int(mainVal!) : calculatedX!
            if (calculatedX != nil) {
                varX        = String(calculatedX!)
                updateDisplay(val: varX!, target: "variableX_display", append: false)
            }
            if (calculatedY != nil) {
                varY        = String(calculatedY!)
                updateDisplay(val: varY!, target: "variableY_display", append: false)
            }
        }

        
        if (currentSet == "AB" && (calculatedA != nil && calculatedB != nil)) {
            var newValue: Int?
                newValue = Int(
                    calculate(
                        method:       "Multiply",
                        Operator1:    Int(variableA_display!.text!)!,
                        Operator2:    Int(variableB_display!.text!)!
                ))
            updateDisplay(
                val:    String(newValue!),
                target: "mainDisplay",
                append: false
            )
            calculatedX = newValue
            calculatedY = nil
            currentSet  = "XY"
        }
        if (currentSet == "XY" && (calculatedX != nil && calculatedY != nil)) {
            var newValue: Int?
            newValue = Int(
                calculate(
                    method:       "Multiply",
                    Operator1:    Int(variableX_display!.text!)!,
                    Operator2:    Int(variableY_display!.text!)!
            ))
            updateDisplay(
                val:    String(newValue!),
                target: "mainDisplay",
                append: false
            )
            calculatedA = newValue
            calculatedB = nil
            currentSet  = "AB"
        }
        
        mainVal = ""
    }
    
    // Function Inputs
    // Evaluate
    func calculate(method: String = "", Operator1: Int, Operator2: Int, returnTarget: String? = "") -> String {
        var    evaluated: Int?
        
        switch method {
            case "Multiply":
                evaluated = Operator1*Operator2
            
            case "Divide":
                evaluated = Operator1/Operator2
            
            case "Add":
                evaluated = Operator1+Operator2
            
            case "Subtract":
                evaluated = Operator1-Operator2
            
            case "Modulo":
                evaluated = Operator1%Operator2
            default:
                break
        }
        switch returnTarget! {
            case "varA":
                varA = String(evaluated!)
            case "varB":
                varB = String(evaluated!)
            case "varX":
                varX = String(evaluated!)
            case "varY":
                varY = String(evaluated!)
            default:
                break
        }
        
        // Checks which variable set is clear, and then assigns operators accordingly, and sets the active values to those operators.
        // If the AB set is populated, then the XY set will be used, with X becoming the evaluation of the AB set.
        if (currentSet == "AB"){
            calculatedA = Int(variableA_display!.text!)
            calculatedB = Int(variableB_display!.text!)
        }
        if (currentSet == "XY"){
            calculatedX = Int(variableX_display!.text!)
            calculatedY = Int(variableY_display!.text!)
        }
        
        currentSet = (varA != nil || varA != "") && (varB != nil || varB != "") && currentSet == "AB" ? "XY" : "AB"
        return String(evaluated!)
    }
    @IBAction func evaluate(_ eval: UIButton!) -> Void {
        var dynamicOperator: Int?
        if (currentSet == "AB") {
            dynamicOperator     = calculatedB == nil ? Int(mainVal!) : calculatedB
            variableB_display!.text = String(dynamicOperator!)
            if (varB == nil) {
                varB         = String(dynamicOperator!)
                calculatedB  = Int(varB!)
                updateDisplay(val: varB!, target: "variableB_display", append: false)
            }
        }
        if (currentSet == "XY") {
            dynamicOperator     = calculatedY == nil ? Int(mainVal!) : calculatedY
            variableY_display!.text = String(dynamicOperator!)
            if (varX == nil) {
                varX         = String(dynamicOperator!)
                calculatedX  = Int(varX!)
                updateDisplay(val: varX!, target: "variableY_display", append: false)
            }
        }
        
        if (currentSet == "AB") {
            updateDisplay(
                val: calculate(
                    method: activeMethod!,
                    Operator1: Int(variableA_display!.text!)!,
                    Operator2: Int(variableB_display!.text!)!
                ),
                target: "mainDisplay",
                append: false
            )
            
            currentSet = "XY"
        }
        if (currentSet == "XY") {
            updateDisplay(
                val: calculate(
                    method: activeMethod!,
                    Operator1: Int(variableX_display!.text!)!,
                    Operator2: Int(variableY_display!.text!)!
                ),
                target: "mainDisplay",
                append: false
            )
            
            currentSet = "AB"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
