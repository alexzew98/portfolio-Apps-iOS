//  ViewController.swift
//  Tippssyyy - Tip calculator app
//  Created by Alexandru Meta on 21/02/2021.

//  Portfolio app - Junior iOS Developer

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlets for the ViewController
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    //MARK: - Global variables
    
    var splitBetweenNumber = 0
    var billTotal: Float?
    var finalResults = "Empty"
    var tip = 0.00
    
    
    //MARK: - ViewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Functions
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let title = sender.currentTitle!
        let formattedTitle = String(title.dropLast())
        let finalTitle = Double(formattedTitle)!
        
        tip = Double(finalTitle / 100)
    }
    
    // When the stepper's value is changed
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        splitBetweenNumber = Int(sender.value)
    }
    
    // Editing Did End
    @IBAction func textFieldEditingDidEnd(_ sender: UITextField) {
        
        print(String(sender.text ?? "error"))
        billTotal = Float(sender.text ?? "0.0")
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let total = Float(billTotal ?? 0.0) / Float(splitBetweenNumber)
        var totalSplit = 0.0
        
        // Could've been done better but I made this app back in August 2020
        if zeroPctButton.isSelected {
            totalSplit = Double(total)
        } else if tenPctButton.isSelected {
            totalSplit = Double(total) + Double(total * 0.1)
        } else {
            totalSplit = Double(total) + Double(total * 0.2)
        }
        
        let formattedString = String(format: "%.1f", totalSplit)
        print(formattedString)
        
        finalResults = formattedString
        performSegue(withIdentifier: "segueToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToResults" {
            
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = finalResults
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = splitBetweenNumber
        }
    }
}

