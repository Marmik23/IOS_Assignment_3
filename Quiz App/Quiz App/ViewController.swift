//
//  ViewController.swift
//  Quiz App
//
//  Created by Marmik Nalinkumar Patel on 2025-04-01.
//

import UIKit

class ViewController: UIViewController, QuestionBankDelegate {

    var questionBank: [Question] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buildQuestionBankTapped(_ sender: UIButton) {
    }

    @IBAction func startQuizTapped(_ sender: UIButton) {
        if questionBank.isEmpty {
            // Alert user if no questions are available
            let alert = UIAlertController(title: "No Questions", message: "Please add questions to the question bank before starting the quiz.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        } 
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toQuestionBank" {
            let destinationVC = segue.destination as! QuestionBankViewController
            destinationVC.questions = self.questionBank // Pass current question bank
            destinationVC.delegate = self               // Set delegate for updates
        } else if segue.identifier == "toMyQuiz" {
            let destinationVC = segue.destination as! MyQuizViewController
            destinationVC.questions = self.questionBank // Pass questions to quiz
        }
    }

    func didUpdateQuestions(_ questions: [Question]) {
        self.questionBank = questions // Update local question bank
        print("Updated question bank: \(self.questionBank.map { $0.questionText })")
    }
}

