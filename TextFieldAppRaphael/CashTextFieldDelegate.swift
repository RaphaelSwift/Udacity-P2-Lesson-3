//
//  CashTextFieldDelegate.swift
//  TextFieldAppRaphael
//
//  Created by Raphael Neuenschwander on 23.04.15.
//  Copyright (c) 2015 Raphael Neuenschwander. All rights reserved.
//

import Foundation
import UIKit

class CashTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        var newText: Double?
        var pennies: Int?
        
        // Control variable to replace or not the text
        var replaceText = false
        
        
        // Set the formatter to Currency US
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        
        // Checks if the field text is of format Currency US and if it can be converted to a double value, if yes -> convert, if not -> assign 0.00
        
        if let toDouble = formatter.numberFromString(textField.text as String) as? Double {
            newText = toDouble
        } else {
            newText = 0.00 }
        
        // Checks whether the input is a string convertible to an integer, if yes, convert it, assign it to pennies and set replaceText to true, if not, assign 0
        
        if let penniesToInt = string.toInt() {
            pennies = penniesToInt
            replaceText = true
            }
        else { pennies = 0
        }
        
        // Compute the new  cash field, move the digit to the left my multiplying by 10 and add the pennies
        newText = newText! * 10 + Double(pennies!) / 100
        
        
        // Replace the text field with the new computed text field if the user entered a digit
        
        if replaceText == true {
        
        textField.text = formatter.stringFromNumber(newText!)
        return false
        } else {
            return true
        }
        
        
    }
}

