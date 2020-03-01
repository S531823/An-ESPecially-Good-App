//
//  FirstViewController.swift
//  An ESPecially Good App
//
//  Created by S531823 on 2/25/20.
//  Copyright © 2020 S531823. All rights reserved.
//

import UIKit
import Foundation

class GuessViewController: UIViewController {
    
    @IBOutlet weak var circleBTN: UIButton!
    @IBOutlet weak var starBTN: UIButton!
    @IBOutlet weak var triangleBTN: UIButton!
    
    @IBOutlet weak var resultLBL: UILabel!
    @IBOutlet weak var scoreLBL: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedCircle(sender: UIButton) {
        switch Predictions.shared.check(prediction: Shape.circle) {
        case true:
            let happyFaces = Int.random(in: 1 ... 3)
            switch happyFaces{
            case 1: resultLBL.text = "😀"
            case 2: resultLBL.text = "😃"
            case 3: resultLBL.text = "😄"
            default: resultLBL.text = "?"
            }
            resetResult()
        case false:
            let sadFaces = Int.random(in: 1 ... 3)
            switch sadFaces{
            case 1: resultLBL.text = "😡"
            case 2: resultLBL.text = "🤬"
            case 3: resultLBL.text = "👿"
            default: resultLBL.text = "?"
            }
            resetResult()
        }
        
        Predictions.shared.generateQuestion()
        
        scoreLBL.text = String(Predictions.shared.numCorrect()) + "/" + String(Predictions.shared.numAttempted())
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Added Prediction"), object: nil)
    }
    
    @IBAction func tappedStar(sender: UIButton) {
        switch Predictions.shared.check(prediction: Shape.star) {
        case true:
            let happyFaces = Int.random(in: 1 ... 3)
            switch happyFaces{
            case 1: resultLBL.text = "😀"
            case 2: resultLBL.text = "😃"
            case 3: resultLBL.text = "😄"
            default: resultLBL.text = "?"
            }
            resetResult()
        case false:
            let sadFaces = Int.random(in: 1 ... 3)
            switch sadFaces{
            case 1: resultLBL.text = "😡"
            case 2: resultLBL.text = "🤬"
            case 3: resultLBL.text = "👿"
            default: resultLBL.text = "?"
            }
            resetResult()
        }

        Predictions.shared.generateQuestion()
        
        scoreLBL.text = String(Predictions.shared.numCorrect()) + "/" + String(Predictions.shared.numAttempted())
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Added Prediction"), object: nil)
    }
    
    @IBAction func tappedTriangle(sender: UIButton) {
        switch Predictions.shared.check(prediction: Shape.triangle) {
        case true:
            let happyFaces = Int.random(in: 1 ... 3)
            switch happyFaces{
            case 1: resultLBL.text = "😀"
            case 2: resultLBL.text = "😃"
            case 3: resultLBL.text = "😄"
            default: resultLBL.text = "?"
            }
            resetResult()
        case false:
            let sadFaces = Int.random(in: 1 ... 3)
            switch sadFaces{
            case 1: resultLBL.text = "😡"
            case 2: resultLBL.text = "🤬"
            case 3: resultLBL.text = "👿"
            default: resultLBL.text = "?"
            }
            resetResult()
        }
        
        Predictions.shared.generateQuestion()
        
        scoreLBL.text = String(Predictions.shared.numCorrect()) + "/" + String(Predictions.shared.numAttempted())
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Added Prediction"), object: nil)
    }
    
    func resetResult() {
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.resetResultText), userInfo: nil, repeats: false)
    }
    
    @objc func resetResultText() {
        resultLBL.text = "?"
    }

}

