//
//  Equation.swift
//  Mathleta
//
//  Created by Paolo Bernardo on 13/08/18.
//  Copyright © 2018 Paolo Bernardo. All rights reserved.
//

import Foundation

class Equation {
    
    var fullEquation : String = ""
    var firstOperand : Int = 0
    var secondOperand : Int = 0
    var equationOperator : String = ""
    var correctAnswer : Int = 0
    var randomAnswers = [Int]()
    
    var level = 0
    
    var numberRange = 0
    var operatorRange = 0
    
    var operatorsList : [String] = ["+", "-", "*", "/"]
    
    
    
    init(currentLevel : Int){ //Future - add new levels here
        level = currentLevel
        switch (self.level) {
        case 1:
            numberRange = 10
            operatorRange = 0
        case 2:
            numberRange = 10
            operatorRange = 1
        case 3:
            numberRange = 10
            operatorRange = 2
        case 4:
            numberRange = 15
            operatorRange = 2
        case 5:
            numberRange = 20
            operatorRange = 2
        default:
            numberRange = 10
            operatorRange = 0
        }
        createEquation()
    }
    
    
    func createEquation(){
        firstOperand = (Int(arc4random_uniform(UInt32(numberRange)+1)))
        secondOperand = (Int(arc4random_uniform(UInt32(numberRange)+1)))
        equationOperator = operatorsList[(Int(arc4random_uniform(UInt32(operatorRange)+1)))]
        
        if equationOperator == "+"{
            correctAnswer = firstOperand + secondOperand
            fullEquation = "\(firstOperand) + \(secondOperand)"
        }else if equationOperator == "-"{
            correctAnswer = firstOperand - secondOperand
            fullEquation = "\(firstOperand) - \(secondOperand)"
        }else if equationOperator == "*"{
            correctAnswer = firstOperand * secondOperand
            fullEquation = "\(firstOperand) \u{00D7} \(secondOperand)"
        }
        
        createRandomAnswers()
    }
    
    
    func createRandomAnswers(){
        var i = 1
        var checkerInt = 0
        
        while(i <= 3){
            checkerInt = generateRandomAnswer(lower: correctAnswer-10, upper: correctAnswer+10)
            if !(randomAnswers.contains(checkerInt)){
                randomAnswers.append(checkerInt)
                i += 1;
            }
        }
        
        randomAnswers.append(correctAnswer)
        randomAnswers.shuffle()
        
    }
    
    
    func generateRandomAnswer (lower: Int , upper: Int) -> Int {
        var randomAnswer = correctAnswer
        
        while(randomAnswer == correctAnswer){
            randomAnswer = lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
        }
        
        return randomAnswer
    }
    
    
}


//Used to shuffle the list of random answers to be used in the button labels
//Obtained from https://stackoverflow.com/questions/24026510/how-do-i-shuffle-an-array-in-swift
extension MutableCollection {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            // Change `Int` in the next line to `IndexDistance` in < Swift 4.1
            let d: Int = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            let i = index(firstUnshuffled, offsetBy: d)
            swapAt(firstUnshuffled, i)
        }
    }
}
