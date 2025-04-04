//
//  QuestionBankViewController.swift
//  Quiz App
//
//  Created by Marmik Nalinkumar Patel on 2025-04-01.
//

import UIKit

class QuestionBankViewController: UIViewController, UITableViewDelegate, UITableViewDataSource , AddingQuestionDelegate{
  
    
    
    @IBOutlet weak var tableView: UITableView!
    var questions: [Question] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }

//    @IBAction func addQuestionTapped(_ sender: UIBarButtonItem) {
//        performSegue(withIdentifier: "toQuestionBuilder", sender: nil)
//    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toQuestionBuilder" {
            let destinationVC = segue.destination as! QuestionBuilderViewController
            destinationVC.mydelegate = self
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
    }
    
    func addingQuestionHasCanceled() {
        
    }

}
