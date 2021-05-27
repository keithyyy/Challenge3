//
//  ViewController.swift
//  Challenge3
//
//  Created by Keith Crooc on 2021-05-10.
//

import UIKit

class ViewController: UIViewController {
    
    
    var wordOptions = ["RHYTHM", "AWESOME", "TWICE", "CHARGE"]
    var letterOptions = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    var word = ""
    var letterButtons = [UIButton]()
    
    
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
        chosenWord.text = wordOptions.randomElement()!
        view.addSubview(chosenWord)
        
        
        let lettersBox = UIView()
        lettersBox.translatesAutoresizingMaskIntoConstraints = false
        lettersBox.layer.borderWidth = 1
        lettersBox.layer.cornerRadius = 10
        lettersBox.layer.borderColor = UIColor.lightGray.cgColor
        view.addSubview(lettersBox)
        
        
        
        
        
        NSLayoutConstraint.activate([
        
            scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scoreLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            
            
            
            chosenWord.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            chosenWord.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            
            
            lettersBox.widthAnchor.constraint(equalToConstant: 300),
            lettersBox.heightAnchor.constraint(equalToConstant: 300),
            lettersBox.topAnchor.constraint(equalTo: chosenWord.bottomAnchor, constant: 100),
            lettersBox.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            lettersBox.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20)
            
            
        
        ])
        
        let width = 50
        let height = 50
        
        for row in 0..<5 {
            for column in 0..<6 {
                let letterButton = UIButton(type: .system)
                letterButton.titleLabel?.font = UIFont.systemFont(ofSize: 36)
                
                letterButton.setTitle("", for: .normal)
                letterButton.addTarget(self, action: #selector(letterTapped), for: .touchUpInside)
                
                let frame = CGRect(x: column * width, y: row * height, width: width, height: height)
                letterButton.frame = frame
                lettersBox.addSubview(letterButton)
                letterButtons.append(letterButton)
                
            }
        }
        
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadLevel()
    }
    
    @objc func letterTapped(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel?.text else { return }
        
        print(buttonTitle)
    }
    
    
    func loadLevel() {
        
        for i in 0..<26 {
            letterButtons[i].setTitle(letterOptions[i], for: .normal)
        }
        
    }

}

