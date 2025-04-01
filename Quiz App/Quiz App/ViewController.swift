//
//  ViewController.swift
//  Quiz App
//
//  Created by Marmik Nalinkumar Patel on 2025-04-01.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buildQuestionBankTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toQuestionBank", sender: nil)
    }
    
    
    @IBAction func startQuizTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toMyQuiz", sender: nil)
    }
}

