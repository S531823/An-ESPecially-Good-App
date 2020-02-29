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
    
    /// Returns the # of restaurants
    
    func numRestaurants() -> Int {
        return restaurants.count
    }
    
    // Alternatively, we could subscript Restaurants, so usage would be Restaurants.shared[5]
    
    subscript(index:Int) -> Restaurant? {
        return index >= 0 && index < restaurants.count ? restaurants[index] : nil
    }
    
    /// Adds a restaurant to the collection
    /// Example usage: Restaurants.shared.add(restaurant:Restaurant(name:"A & G", rating:4))
    /// - Parameter restaurant: restaurant to add
    
    func add(restaurant:Restaurant){
        restaurants.append(restaurant)
    }
    
    /// Now we can delete restaurants too..
    /// - Parameter at: <#at description#>
    func delete(at:Int){
        restaurants.remove(at: at)
    }
    
}
