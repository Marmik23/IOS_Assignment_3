//
//  QuestionBankViewController.swift
//  Quiz App
//
//  Created by Marmik Nalinkumar Patel on 2025-04-01.
//

import UIKit

class QuestionBankViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var questions: [Question] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func addQuestionTapped(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "toQuestionBuilder", sender: nil)
    }

    // TableView Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath)
        let question = questions[indexPath.row]
        cell.textLabel?.text = question.questionText
        return cell
    }

    // Unwind Segue to update question bank
    @IBAction func unwindToQuestionBank(segue: UIStoryboardSegue) {
        print("Unwind Segue Triggered")
        if let sourceVC = segue.source as? QuestionBuilderViewController,
           let newQuestion = sourceVC.newQuestion {
            questions.append(newQuestion)
            tableView.reloadData()
            print("Unwinding with New Question: \(newQuestion)")
            print("Questions Array After Append: \(questions)")
        }
    }
}
