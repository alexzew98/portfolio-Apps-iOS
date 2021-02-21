//  ResultViewController.swift
//  Tippssyyy - Tip calculator app
//  Created by Alexandru Meta on 21/02/2021.

//  Portfolio app - Junior iOS Developer

import UIKit

class ResultViewController: UIViewController {
    
    //MARK: - IBOutlets for this ViewController
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    //MARK: - Properties
    var result = "0.0"
    var tip = 10
    var split = 2

    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = result
        settingsLabel.text = "Split between \(split) people, with \(tip)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
