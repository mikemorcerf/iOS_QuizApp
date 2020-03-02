//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Michael Moura on 2/15/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
        
    ]
    
    var questionNumber: Int
    var maxQuestionNumber: Int
    var userScore: Int
    var gameOver: Bool
    var finalScore: Int
    
    init() {
        questionNumber = 0
        maxQuestionNumber = quiz.count
        userScore = 0
        gameOver = false
        finalScore = 0
    }
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].rightAnswer {
            userScore += 1
            return true;
        } else {
            return false;
        }
    }
    
    mutating func nextQuestion(){
        if (questionNumber<(maxQuestionNumber-1)){
            questionNumber += 1
        } else{
            gameOver = true
            questionNumber = 0
            finalScore = userScore
            userScore = 0
        }
    }
    
    func isGameOver() -> Bool {
        return gameOver
    }
    
    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(maxQuestionNumber)
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getScore() -> Int {
        return userScore
    }
    
    func getFinalScore() -> Int {
        return finalScore
    }
    
    func getFirstOption() -> String? {
        return quiz[questionNumber].answer[0]
    }
    
    func getSecondOption() -> String? {
        return quiz[questionNumber].answer[1]
    }
    
    func getThirdOption() -> String? {
        return quiz[questionNumber].answer[2]
    }
}
