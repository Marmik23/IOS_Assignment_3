//
//  QuestionBuilderViewController.swift
//  Quiz App
//
//  Created by Marmik Nalinkumar Patel on 2025-04-01.
//

import UIKit

class QuestionBuilderViewController: UIViewController {

    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var correctAnswerTextField: UITextField!
    @IBOutlet weak var incorrectAnswer1TextField: UITextField!
    @IBOutlet weak var incorrectAnswer2TextField: UITextField!
    @IBOutlet weak var incorrectAnswer3TextField: UITextField!

    var newQuestion: Question?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func doneTapped(_ sender: UIBarButtonItem) {
        guard let questionText = questionTextField.text,
              let correctAnswer = correctAnswerTextField.text,
              let incorrect1 = incorrectAnswer1TextField.text,
              let incorrect2 = incorrectAnswer2TextField.text,
              let incorrect3 = incorrectAnswer3TextField.text else { return }

        newQuestion = Question(questionText: questionText, correctAnswer: correctAnswer, incorrectAnswers: [incorrect1, incorrect2, incorrect3])
        print("New Question Created: \(String(describing: newQuestion))")
        performSegue(withIdentifier: "unwindToQuestionBank", sender: self)
    }

    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
