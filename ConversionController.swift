//
//  ConversionController.swift
//  WorldTrotter
//
//  Created by Rodrigo Carballo on 10/26/16.
//  Copyright © 2016 Rodrigo Carballo. All rights reserved.
//

import UIKit

class ConversionController : UIViewController, UITextFieldDelegate {
    
    @IBOutlet var celsiusLabel : UILabel!
    @IBOutlet var textField: UITextField!
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
        
    }()
    
    var fahrenheitValue: Double! {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Double? {
        if let value = fahrenheitValue {
            
            return (value-32) * (5/9)
        }
        else {
            return nil
        }
    }
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        
        
        if let text = textField.text , let value = Double(text) {

            fahrenheitValue = value

        }
        
        else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel() {
        
       
        
        if let value = celsiusValue {
            
            celsiusLabel.text = numberFormatter.string(from: value as NSNumber)
            print( "Stop here")
            
        }
            
        else {
            celsiusLabel.text = "????"
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // Check for letter characters
        if string.rangeOfCharacter(from: NSCharacterSet.letters) != nil {
            return false
        }
        
    
        let existingTextHasDecimalSeparators = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparators = string.range(of: ".")
        
        if existingTextHasDecimalSeparators != nil &&  replacementTextHasDecimalSeparators != nil  {
            return false
        }
        else {
            
            return true
        }
        
    }
    
}
