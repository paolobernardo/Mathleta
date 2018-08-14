//
//  ViewController.swift
//  Mathleta
//
//  Created by Paolo Bernardo on 13/08/18.
//  Copyright © 2018 Paolo Bernardo. All rights reserved.
//

import UIKit
import RealmSwift

class GameViewController: UIViewController {

    
    @IBOutlet weak var timerLabel: UILabel!
    var timer = Timer()
    var timerCounter = 60
    
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var equationQuestionLabel: UILabel!
    
    @IBOutlet weak var buttonOneLabel: UIButton!
    @IBOutlet weak var buttonTwoLabel: UIButton!
    @IBOutlet weak var buttonThreeLabel: UIButton!
    @IBOutlet weak var buttonFourLabel: UIButton!
    
    var question = Equation(currentLevel: 1) // This is initial value
    
    let realm = try! Realm()
    var player : Player?
    
    var name : String = "" //Used Player class - to delete
    var score : Int = 0 //Used Player class - to delete
    var nextLevelCount : Int = 0
    var level : Int = 1 //Used Player class - to delete
    
    var pickedAnswer : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(player!.name)
        
        timerLabel.text = "Time: \(timerCounter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.updateTimer), userInfo: nil, repeats: true)
        
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
        if nextLevelCount < 10{
            question = Equation(currentLevel: player!.level)
            updateUI()
        }else{
            player!.level += 1
            if player!.level == 5{ //Player has completed the game, save details, go back to main menu
                print("Congrats you finished the game!")
                let alert = UIAlertController(title: "Congratulations!", message: "You have succesfully completed Mathleta!", preferredStyle: .alert)
                let restartAction = UIAlertAction(title: "Main Menu", style: .default, handler: { (UIAlertAction) in
                    self.backToMainMenu()
                })
                alert.addAction(restartAction)
                present(alert, animated: true, completion: nil)
            }else{
                nextLevelCount = 0
                question = Equation(currentLevel: player!.level)
                timerCounter = 60
                updateUI()
            }
            
        }
        
    }
    
    func updateUI(){
        equationQuestionLabel.text = question.fullEquation
        buttonOneLabel.setTitle("\(question.randomAnswers[0])", for: .normal)
        buttonTwoLabel.setTitle("\(question.randomAnswers[1])", for: .normal)
        buttonThreeLabel.setTitle("\(question.randomAnswers[2])", for: .normal)
        buttonFourLabel.setTitle("\(question.randomAnswers[3])", for: .normal)
        scoreLabel.text = "Score: \(player!.score)"
        levelLabel.text = "Level: \(player!.level)"
        
        
        
        
    }
    
    func checkAnswer(){
        if pickedAnswer == question.correctAnswer{
            player!.score += 1
            nextLevelCount += 1
            print("Correct")
        }else{
            print("Incorrect")
        }
    }
    
    
    @objc func updateTimer(){
        timerCounter -= 1
        timerLabel.text = "Time: \(timerCounter)"
        if timerCounter == 0{ //Timer has elapsed, save details, go back to main menu
            timer.invalidate()
            print("End game")
            let alert = UIAlertController(title: "Timer has elapsed", message: "Better luck next time!", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Main Menu", style: .default, handler: { (UIAlertAction) in
                self.backToMainMenu()
            })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func backToMainMenu(){
        do{
            try realm.write {
                realm.add(player!)
            }
        }catch{
            print("Error saving player data")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
}


