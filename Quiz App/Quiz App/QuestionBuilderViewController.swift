//
//  QuestionBuilderViewController.swift
//  Quiz App
//
//  Created by Marmik Nalinkumar Patel on 2025-04-01.
//

import UIKit


protocol AddingQuestionDelegate {
    func addingQuestionDoneCorrectly( q: Question)
    func addingQuestionHasCanceled()
    
    
}
class QuestionBuilderViewController: UIViewController {
    
    var mydelegate : AddingQuestionDelegate?
    
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
        
        guard let questionText = questionTextField.text, !questionText.isEmpty,
                  let correctAnswer = correctAnswerTextField.text, !correctAnswer.isEmpty,
                  let incorrect1 = incorrectAnswer1TextField.text, !incorrect1.isEmpty,
                  let incorrect2 = incorrectAnswer2TextField.text, !incorrect2.isEmpty,
                  let incorrect3 = incorrectAnswer3TextField.text, !incorrect3.isEmpty else {
            let alert = UIAlertController(title: "Missing Fields", message: "Please fill all fields.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
            }

            let newQuestion = Question(questionText: questionText,
                                        correctAnswer: correctAnswer,
                                        incorrectAnswers: [incorrect1, incorrect2, incorrect3])

            mydelegate?.addingQuestionDoneCorrectly(q: newQuestion)
            dismiss(animated: true)

    }

    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        mydelegate?.addingQuestionHasCanceled()
        dismiss(animated: true, completion: nil)
    }
}
