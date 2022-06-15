//
//  ViewController.swift
//  ErrorHandlingApp
//
//  Created by Phil Wright on 6/14/22.
//

import UIKit

class MyViewModel {
    var playerMessage: String? {
        didSet {
            playerMessageChanged?(playerMessage)
        }
    }
    var playerMessageChanged: ((String?) -> Void)?
}

class ViewController: UIViewController {
    
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    var viewModel = MyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
        
        playerLabel.text = "Player 1"
    }
    
    private func setupBindings() {
        viewModel.playerMessageChanged = { [weak self] newMessage in
            self?.updateErrorMessage(with: newMessage)
        }
    }
    
    private func updateErrorMessage(with message: String?) {
        errorMessageLabel?.text = message
    }
    
    @IBAction func didTapRandomMessage(_ sender: UIButton) {
        viewModel.playerMessage = "Random Player Message: \(createWord(maxSize: 15))"
    }
    
    private func createWord(maxSize: Int) -> String {
        var word = ""
        for _ in 1...maxSize {
            let randomChar = String(format: "%c", Int.random(in: 97..<123)) as String
            word += randomChar
        }
        return word
    }
    
}

