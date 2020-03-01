//
//  HistoryTableViewController.swift
//  An ESPecially Good App
//
//  Created by S531823 on 2/25/20.
//  Copyright © 2020 S531823. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        NotificationCenter.default.addObserver(self, selector: #selector(attemptAdded(notification:)), name: NSNotification.Name(rawValue: "Added Prediction"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(attemptAdded(notification:)), name: NSNotification.Name("Added Prediction"), object: nil)
    }
    
    @objc func attemptAdded(notification: Notification) {
        tableView.reloadData()
    }
    
    var actualIVTag: Int = 100
    var predictedIVTag: Int = 200
    var resultLBLTag: Int = 300
    
    let optimalRowHeight: CGFloat = 150

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return optimalRowHeight
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Predictions.shared.numAttempted()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "espCell", for: indexPath)
        if let shape = Predictions.shared.question(at: indexPath.row) {
            let actualIV = cell.viewWithTag(actualIVTag) as! UIImageView
            let predictedIV = cell.viewWithTag(predictedIVTag) as! UIImageView
            let resultLBL = cell.viewWithTag(resultLBLTag) as! UILabel
            
            var actualImage: UIImage
            if shape.actualShape == Shape.circle {
                actualImage = UIImage(named: "circle.png")!
                actualIV.image = actualImage
            }
            else if shape.actualShape == Shape.star {
                actualImage = UIImage(named: "star.png")!
                actualIV.image = actualImage
            }
            else if shape.actualShape == Shape.triangle {
                actualImage = UIImage(named: "triangle.png")!
                actualIV.image = actualImage
            }
            
            var predictedImage: UIImage
            if shape.predictedShape == Shape.circle {
                predictedImage = UIImage(named: "circle.png")!
                predictedIV.image = predictedImage
            }
            else if shape.predictedShape == Shape.star {
                predictedImage = UIImage(named: "star.png")!
                predictedIV.image = predictedImage
            }
            else if shape.predictedShape == Shape.triangle {
            predictedImage = UIImage(named: "triangle.png")!
            predictedIV.image = predictedImage
            }
            
            if shape.isCorrect == true {
                resultLBL.text = "😀"
            }
            else {
                resultLBL.text = "😡"
            }
        }
        return cell
    }

}
