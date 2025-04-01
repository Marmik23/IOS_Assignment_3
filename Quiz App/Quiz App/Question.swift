//
//  Question.swift
//  Quiz App
//
//  Created by Marmik Nalinkumar Patel on 2025-04-01.
//

import Foundation

class Question {
    let questionText: String
    let correctAnswer: String
    let incorrectAnswers: [String]

    init(questionText: String, correctAnswer: String, incorrectAnswers: [String]) {
        self.questionText = questionText
        self.correctAnswer = correctAnswer
        self.incorrectAnswers = incorrectAnswers
    }
}
