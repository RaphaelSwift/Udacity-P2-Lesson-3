//
//  ZipCodeTextFieldDelegate.swift
//  TextFieldAppRaphael
//
//  Created by Raphael Neuenschwander on 23.04.15.
//  Copyright (c) 2015 Raphael Neuenschwander. All rights reserved.
//

import Foundation
import UIKit

class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let maxLenghtZipCode = 5
        var isAnInteger = false
        
    // check if the user enters a digit
        if let convertibleToString = string.toInt() {
            isAnInteger = true
        }
        
    // The user cannot add another digit if the number of character in the text field equals the maximum lenght autorised for a Zip code
        
        if count(textField.text) == maxLenghtZipCode && count(string) >= 1 || isAnInteger == false && count(string) >= 1{
        
            return false
        } else {
            return true
        }
        
    }
}
