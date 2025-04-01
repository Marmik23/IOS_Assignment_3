//
//  MyQuizViewController.swift
//  Quiz App
//
//  Created by Marmik Nalinkumar Patel on 2025-04-01.
//

import UIKit

class MyQuizViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    @IBOutlet weak var option4Button: UIButton!

    var questions = [Question]()
    var currentIndex = 0
    var score = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestion()
        progressBar.progress = 0.0
    }

    func loadQuestion() {
        if currentIndex < questions.count {
            let currentQuestion = questions[currentIndex]
            questionLabel.text = currentQuestion.questionText
            let allAnswers = [currentQuestion.correctAnswer] + currentQuestion.incorrectAnswers.shuffled()
            option1Button.setTitle(allAnswers[0], for: .normal)
            option2Button.setTitle(allAnswers[1], for: .normal)
            option3Button.setTitle(allAnswers[2], for: .normal)
            option4Button.setTitle(allAnswers[3], for: .normal)
        } else {
            performSegue(withIdentifier: "toResults", sender: nil)
        }
    }

    @IBAction func answerSelected(_ sender: UIButton) {
        guard let answer = sender.title(for: .normal) else { return }
        
        if answer == questions[currentIndex].correctAnswer {
            score += 1
        }
        
        currentIndex += 1
        progressBar.progress = Float(currentIndex) / Float(questions.count)
        
        loadQuestion()
    }
}
