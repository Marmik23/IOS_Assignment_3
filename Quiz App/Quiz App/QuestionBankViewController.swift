//
//  QuestionBankViewController.swift
//  Quiz App
//
//  Created by Marmik Nalinkumar Patel on 2025-04-01.
//

import UIKit

protocol QuestionBankDelegate: AnyObject {
    func didUpdateQuestions(_ questions: [Question])
}

class QuestionBankViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddingQuestionDelegate {
    
    var questionBank: [Question] = []

    @IBOutlet weak var tableView: UITableView!
    var questions: [Question] = []
    weak var delegate: QuestionBankDelegate? // Delegate reference for passing data back

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "QuestionCell")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toQuestionBuilder" {
            let destinationVC = segue.destination as! QuestionBuilderViewController
            destinationVC.mydelegate = self // Set delegate for adding questions
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath)
        let question = questions[indexPath.row]
        cell.textLabel?.text = question.questionText
        return cell
    }

    func addingQuestionDoneCorrectly(q: Question) {
        questions.append(q)
        tableView.reloadData()
        print("Added new question: \(q.questionText)")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Delegate called with questions: \(questions.map { $0.questionText })")
        delegate?.didUpdateQuestions(questions)
    }

    func didUpdateQuestions(_ questions: [Question]) {
        self.questionBank = questions
        print("Updated question bank in ViewController: \(self.questionBank.map { $0.questionText })")
    }


    func addingQuestionHasCanceled() {
        // Handle cancellation if needed (e.g., show a message or log it)
    }
}
