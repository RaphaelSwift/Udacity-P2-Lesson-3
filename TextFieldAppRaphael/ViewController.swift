//
//  ViewController.swift
//  TextFieldAppRaphael
//
//  Created by Raphael Neuenschwander on 23.04.15.
//  Copyright (c) 2015 Raphael Neuenschwander. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    
    @IBOutlet weak var textControl: UISwitch!
    
    
    let zipCodeTextFieldDelegate = ZipCodeTextFieldDelegate()
    let cashTextFieldDelegate = CashTextFieldDelegate()
    
    // Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the delegates
        self.textField1.delegate = zipCodeTextFieldDelegate
        self.textField2.delegate = cashTextFieldDelegate
        self.textField3.delegate = self

    }
    
    
    // Text field delegate methods
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        if textControl.on {
            return true
        } else {
            return false }
        
    }
    
    
    // Textfield 3 resigns and becomes first responder upon toggling the switch button
    @IBAction func switchEditing(sender: UISwitch) {
        if textControl.on == false {
            textField3.resignFirstResponder()
        } else { textField3.becomeFirstResponder()
    }

}
}
