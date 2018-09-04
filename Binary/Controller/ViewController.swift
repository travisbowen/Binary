//
//  ViewController.swift
//  Binary
//
//  Created by Travis Bowen on 8/30/18.
//  Copyright © 2018 UpscaleApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var binaryButton: UIButton!
    @IBOutlet weak var decimalbutton: UIButton!
    
    let placeHolder = NSAttributedString(string: "Enter a value", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), NSAttributedStringKey.font: UIFont(name: "Menlo", size: 30)!])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.attributedPlaceholder = placeHolder
        
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        disableButtons()
    }
    
    @objc func textFieldDidChange(){
        if textField.text == ""{
            disableButtons()
        } else {
            enableButtons()
        }
    }
    
    func disableButtons(){
        binaryButton.isEnabled = false
        binaryButton.alpha = 0.3
        decimalbutton.isEnabled = false
        decimalbutton.alpha = 0.3
    }
    
    func enableButtons(){
        binaryButton.isEnabled = true
        binaryButton.alpha = 1.0
        decimalbutton.isEnabled = true
        decimalbutton.alpha = 1.0
    }
    
    @IBAction func binaryButtonPressed(_ sender: Any) {
        if textField.text != ""{
            binaryButton.alpha = 1.0
            decimalbutton.alpha = 0.3
            guard let string = textField.text, let intFromString = Int(string) else {return}
            let binaryDigit = BinaryDecimal.init(decimal: intFromString)
            textField.text = "\(binaryDigit.calculateBinaryValueForInt())"
        }
    }
    
    @IBAction func decimalButtonPressed(_ sender: Any) {
        if textField.text != ""{
            binaryButton.alpha = 0.3
            decimalbutton.alpha = 1.0
            guard let string = textField.text else {return}
            let bitsFromString = string.map{ Int(String($0))!}
            let binaryDigit = BinaryDecimal.init(bits: bitsFromString)
            textField.text = "\(binaryDigit.calculateIntValueForBinary())"
        }
    }
}

