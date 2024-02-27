//
//  QuizModel.swift
//  GeoWhiz Quiz
//
//  Created by Hassan Mayers on 27/2/24.
//

import Foundation

struct QuizResponse: Codable {
    let results: [Quiz]
}

struct Quiz: Codable {
    let difficulty: String
    let category: String
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]
}
