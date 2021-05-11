//
//  ViewController.swift
//  Challenge3
//
//  Created by Keith Crooc on 2021-05-10.
//

import UIKit

class ViewController: UIViewController {
    
    
    var wordOptions = ["RHYTHM", "AWESOME", "TWICE", "CHARGE"]
    var word = ""
    
    
    var scoreLabel: UILabel!
    var chosenWord: UILabel!
    var userInput: UITextField!
    
    
    
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }

    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.text = "Score: 0"
        view.addSubview(scoreLabel)
        
        
        chosenWord = UILabel()
        chosenWord.translatesAutoresizingMaskIntoConstraints = false
        chosenWord.font = UIFont.systemFont(ofSize: 24)
        view.addSubview(chosenWord)
        
        
        
        
        
        NSLayoutConstraint.activate([
        
            scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scoreLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            
            
            
            chosenWord.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            
            
            
            
        
        
        
        
        
        ])
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

}

