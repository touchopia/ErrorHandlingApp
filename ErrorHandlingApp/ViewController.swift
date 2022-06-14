//
//  ViewController.swift
//  ErrorHandlingApp
//
//  Created by Phil Wright on 6/14/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorMessageLabel.text = "The Error Message"
    }

}

