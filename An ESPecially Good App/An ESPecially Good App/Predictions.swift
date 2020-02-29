//
//  Predictions.swift
//  An ESPecially Good App
//
//  Created by S531823 on 2/28/20.
//  Copyright © 2020 S531823. All rights reserved.
//

import Foundation

enum Shape {
    case circle
    case star
    case triangle
}

struct Question {
    var actualShape: Shape!
    var predictedShape: Shape!
    
    var isCorrect: Bool? {
        if actualShape == predictedShape {
            return true
        }
        else if actualShape != predictedShape {
            return false
        }
        else {
            return nil
        }
    }
    
}

class Predictions {
    
    private static var _shared:Predictions! // Only visible in this struct
    
    static var shared:Predictions {         // To access this anywhere, in the app just write Predictions.shared
        if _shared == nil {
            _shared = Predictions()
        }
        return _shared
    }
    
    private var questions: [Question] = []
    private var currentQuestion: Question!
    
    private init(){
        generateQuestion()
    }
    
    func generateQuestion() {
        let choice = Int.random(in: 1 ... 3)
        switch choice{
        case 1: currentQuestion = Question(actualShape: Shape.circle, predictedShape: nil)
        case 2: currentQuestion = Question(actualShape: Shape.star, predictedShape: nil)
        case 3: currentQuestion = Question(actualShape: Shape.triangle, predictedShape: nil)
        default: currentQuestion = Question(actualShape: nil, predictedShape: nil)
        }
    }
    
    func check(prediction: Shape) {
        currentQuestion.predictedShape = prediction
        questions.append(currentQuestion)
        
        if currentQuestion.isCorrect == true {
            print("Smiley")
        }
        else {
            print("Frowny")
        }
    }
    
    // Returns number of attempts
    func numAttempted() -> Int {
        return questions.count
    }

    // Returns the number of correct predictions
    func numCorrect() -> Int {
        var correctSum: Int = 0
        for question in questions {
            if question.isCorrect == true {
                correctSum += 1
            }
        }
        return correctSum
    }
    
    // Resets questions to an empty array
    func clearResults() {
        questions = []
    }
    
    func question(at: Int) -> Question! {
        if at >= 0 && at < questions.count {
            return questions[at]
        }
        else {
            return nil
        }
    }
}
