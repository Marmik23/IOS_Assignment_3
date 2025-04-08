//
//  ResultViewController.swift
//  Quiz App
//
//  Created by Marmik Nalinkumar Patel on 2025-04-01.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!

    var correctCount = 0
    var totalQuestions = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        calculateAndDisplayResult()
    }

    private func calculateAndDisplayResult() {
        guard totalQuestions > 0 else {
            resultLabel.text = "Quiz Completed!"
            scoreLabel.text = "No questions were answered."
            return
        }

        let scorePercentage = Double(correctCount) / Double(totalQuestions) * 100
        resultLabel.text = "Quiz Completed!"
        scoreLabel.text = "Your score is \(String(format: "%.2f", scorePercentage))%"
    }
}

