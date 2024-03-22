//
//  User.swift
//  GeoWhiz Quiz
//
//  Created by Hassan Mayers on 20/3/24.
//

import Foundation

struct QuizUser {
    let userID: String
    let googleUsername: String
    let googlePhoto: String
    let bestEasyQuizPoints: Int
    let bestMediumQuizPoints: Int
    let bestHardQuizPoints: Int
    let bestTotalQuizPoints: Int
    let totalTimeToAnswerAllQuestions: Int
    let easyQuizReward: String? // URL or reference to the asset
    let mediumQuizReward: String?
    let hardQuizReward: String?

    init(userID: String, dictionary: [String: Any]) {
        self.userID = userID
        self.googleUsername = dictionary["googleUsername"] as? String ?? ""
        self.googlePhoto = dictionary["googlePhoto"] as? String ?? ""
        self.bestEasyQuizPoints = dictionary["bestEasyQuizPoints"] as? Int ?? 0
        self.bestMediumQuizPoints = dictionary["bestMediumQuizPoints"] as? Int ?? 0
        self.bestHardQuizPoints = dictionary["bestHardQuizPoints"] as? Int ?? 0
        self.bestTotalQuizPoints = dictionary["bestTotalQuizPoints"] as? Int ?? 0
        self.totalTimeToAnswerAllQuestions = dictionary["totalTimeToAnswerAllQuestions"] as? Int ?? 0
        self.easyQuizReward = dictionary["easyQuizReward"] as? String
        self.mediumQuizReward = dictionary["mediumQuizReward"] as? String
        self.hardQuizReward = dictionary["hardQuizReward"] as? String
    }
}

