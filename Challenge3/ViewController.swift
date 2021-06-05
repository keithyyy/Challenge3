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
    var letterButtons = [UIButton]()
    var usedLetters = [String]()
    
    var chosenWord = ""
    
    var scoreLabel: UILabel!
    var promptWord: UILabel!
    var userInput: UITextField!
    var wordDisplayed = ""
    
    
    var newWordOptions = [String]()
    
    
    
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
        
        
        promptWord = UILabel()
        promptWord.translatesAutoresizingMaskIntoConstraints = false
        promptWord.font = UIFont.systemFont(ofSize: 24)
//        promptWord.text = wordOptions.randomElement()!
        view.addSubview(promptWord)
        
        
        let lettersBox = UIView()
        lettersBox.translatesAutoresizingMaskIntoConstraints = false
        lettersBox.layer.borderWidth = 1
        lettersBox.layer.cornerRadius = 10
        lettersBox.layer.borderColor = UIColor.lightGray.cgColor
        view.addSubview(lettersBox)
        
        
        
        
        
        NSLayoutConstraint.activate([
        
            scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scoreLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            
            
            
            promptWord.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            promptWord.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            
            
            lettersBox.widthAnchor.constraint(equalToConstant: 300),
            lettersBox.heightAnchor.constraint(equalToConstant: 300),
            lettersBox.topAnchor.constraint(equalTo: promptWord.bottomAnchor, constant: 100),
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
        
        usedLetters.append(buttonTitle)
//        print(usedLetters)
//        sender.isHidden = true
        
        
        for (index, letter) in chosenWord.enumerated() {
            let strLetter = String(letter)
            
            
            if usedLetters.contains(strLetter) {
                print(strLetter)
                var transformedWordDisplayed = Array(wordDisplayed)
                transformedWordDisplayed[index] = letter
//                    print(transformedWordDisplayed[index])
                wordDisplayed = String(transformedWordDisplayed)
                
                
            }
            
           
        }
        
        promptWord.text? = wordDisplayed
        
        
        if wordDisplayed == chosenWord {
            wordDisplayed = ""
            
            score += 5
            
            
            let ac = UIAlertController(title: "You got it!", message: "Word was guessed correctly, onto the next!", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default))
            present(ac, animated: true)
            nextLevel(wordToRemove: chosenWord)
        }
        
        
    }
    
    func nextLevel(wordToRemove: String) {
            newWordOptions = wordOptions.filter {$0 != wordToRemove}
            wordOptions = newWordOptions
            usedLetters.removeAll()
            loadLevel()
        
    }
    
    
    func loadLevel() {
        
        chosenWord = wordOptions.randomElement()!
//        promptWord.text = chosenWord
//        promptWord.text = wordOptions.randomElement()!
        
        
        print(chosenWord)
        
        
        for _ in chosenWord {
//            let strLetter = String(letter)
            print(chosenWord)
            wordDisplayed+="?"
        }
        
        promptWord.text = wordDisplayed
        
        
        for i in 0..<26 {
            letterButtons[i].setTitle(letterOptions[i], for: .normal)
        }
        
    }

}

