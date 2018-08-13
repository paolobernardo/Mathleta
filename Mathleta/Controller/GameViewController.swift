//
//  ViewController.swift
//  Mathleta
//
//  Created by Paolo Bernardo on 13/08/18.
//  Copyright © 2018 Paolo Bernardo. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    
    @IBOutlet weak var equationQuestionLabel: UILabel!
    
    @IBOutlet weak var buttonOneLabel: UIButton!
    @IBOutlet weak var buttonTwoLabel: UIButton!
    @IBOutlet weak var buttonThreeLabel: UIButton!
    @IBOutlet weak var buttonFourLabel: UIButton!
    
    var question = Equation(currentLevel: 1) // This is initial value
    
    var name : String = ""
    var score : Int = 0
    var correctAnswers : Int = 0
    var level : Int = 1
    
    var pickedAnswer : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func answerButton(_ sender: AnyObject) {
        if sender.tag == 1{
            pickedAnswer = question.randomAnswers[0]
        }else if sender.tag == 2{
            pickedAnswer = question.randomAnswers[1]
        }else if sender.tag == 3{
            pickedAnswer = question.randomAnswers[2]
        }else if sender.tag == 4{
            pickedAnswer = question.randomAnswers[3]
        }
        
        checkAnswer()
        
        nextQuestion()
        
    }
    
    
    func nextQuestion(){
        if correctAnswers <= 10{
            question = Equation(currentLevel: level)
            updateUI()
        }
        
    }
    
    func updateUI(){
        equationQuestionLabel.text = question.fullEquation
        buttonOneLabel.setTitle("\(question.randomAnswers[0])", for: .normal)
        buttonTwoLabel.setTitle("\(question.randomAnswers[1])", for: .normal)
        buttonThreeLabel.setTitle("\(question.randomAnswers[2])", for: .normal)
        buttonFourLabel.setTitle("\(question.randomAnswers[3])", for: .normal)
        
        
        
    }
    
    func checkAnswer(){
        if pickedAnswer == question.correctAnswer{
            score += 1
            print("Correct")
        }else{
            print("Incorrect")
        }
    }
    

    


}

