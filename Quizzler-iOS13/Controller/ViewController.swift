//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var gameOverMessage: UILabel!
    @IBOutlet weak var gameOverScreen: UIView!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.00
        updateUI()
    }
    
    @IBAction func startOverPressed(_ sender: Any) {
        quizBrain.gameOver = false
        gameOverScreen.isHidden = true
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        if quizBrain.checkAnswer(userAnswer) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        if(quizBrain.isGameOver()){
            gameOverScreen.isHidden = false
            gameOverMessage.text = "You have finished all the questions. Your final score is: \(quizBrain.getFinalScore())"
        }
        self.firstButton.setTitle(quizBrain.getFirstOption(), for: .normal)
        self.secondButton.setTitle(quizBrain.getSecondOption(), for: .normal)
        self.thirdButton.setTitle(quizBrain.getThirdOption(), for: .normal)
        progressBar.progress = quizBrain.getProgress()
        questionLabel.text = quizBrain.getQuestionText()
        self.firstButton.backgroundColor = UIColor.clear
        self.secondButton.backgroundColor = UIColor.clear
        self.thirdButton.backgroundColor = UIColor.clear
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }
    
}

