//
//  DatabaseManager.swift
//  GeoWhiz Quiz
//
//  Created by Hassan Mayers on 20/3/24.
//

import Foundation
import Firebase
import GoogleSignIn

struct DatabaseManager {
    
    static func handleUserSignIn(user: GIDGoogleUser) {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        let usersRef = Firestore.firestore().collection("Users")
        let userDoc = usersRef.document(userID)

        userDoc.getDocument { (document, error) in
            if let document = document, document.exists {
                // User exists, update last login or any relevant info
                userDoc.updateData([
                    "lastLogin": FieldValue.serverTimestamp()
                ])
            } else {
                // New user, create a document
                userDoc.setData([
                    "googleUsername": user.profile?.name ?? "",
                    "googlePhoto": user.profile?.imageURL(withDimension: 200)?.absoluteString ?? "",
                    "userID": userID,
                    // Set initial scores and rewards to defaults
                    "bestEasyQuizPoints": 0,
                    "bestMediumQuizPoints": 0,
                    "bestHardQuizPoints": 0,
                    "bestTotalQuizPoints": 0,
                    "totalTimeToAnswerAllQuestions": 0,
                    "easyQuizReward": "",
                    "mediumQuizReward": "",
                    "hardQuizReward": ""
                ]) { error in
                    if let error = error {
                        print("Error setting user data: \(error.localizedDescription)")
                    } else {
                        print("User data saved successfully:")
                        print("googleUsername: \(user.profile?.name ?? "")")
                        print("googlePhoto: \(user.profile?.imageURL(withDimension: 200)?.absoluteString ?? "")")
                        print("userId: \(userID)")
                    }
                }
            }
        }
    }
    
    static func saveQuizResult(userID: String, difficulty: String, score: Int, perfectScore: Int, reward: String) {
        let userRef = Firestore.firestore().collection("Users").document(userID)
        
        userRef.getDocument { (document, error) in
            if let document = document, document.exists {
                var newBest = false
                let currentBestScore = document.get("best\(difficulty)QuizPoints") as? Int ?? 0
                if score > currentBestScore {
                    newBest = true
                    userRef.updateData(["best\(difficulty)QuizPoints": score])
                }
                
                // If it's a new best score, check for total and rewards
                if newBest {
                    self.updateTotalBestScore(userID: userID)
                    if score == perfectScore { // Assuming `perfectScore` is a constant representing the score needed for a reward
                        self.assignRewardToUser(userID: userID, difficulty: difficulty, reward: reward)
                    }
                }
            } else {
                print("Document does not exist")
            }
        }
    }

   static func updateTotalBestScore(userID: String) {
        let userRef = Firestore.firestore().collection("Users").document(userID)
        userRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let easyPoints = document.get("bestEasyQuizPoints") as? Int ?? 0
                let mediumPoints = document.get("bestMediumQuizPoints") as? Int ?? 0
                let hardPoints = document.get("bestHardQuizPoints") as? Int ?? 0
                
                let totalPoints = easyPoints + mediumPoints + hardPoints
                userRef.updateData(["bestTotalQuizPoints": totalPoints])
            }
        }
    }
    
    static func assignRewardToUser(userID: String, difficulty: String, reward: String) {
        let rewardReference = reward // Define how you reference rewards
        Firestore.firestore().collection("Users").document(userID).updateData(["\(difficulty.lowercased())QuizReward": rewardReference])
    }
    
    static func fetchUsers(completion: @escaping ([QuizUser]) -> Void) {
        Firestore.firestore().collection("Users")
            .order(by: "bestTotalQuizPoints", descending: true)
            .getDocuments { (snapshot, error) in
                guard let documents = snapshot?.documents else {
                    print("Error fetching documents: \(error?.localizedDescription ?? "Unknown error")")
                    completion([])
                    return
                }
                
                var users: [QuizUser] = documents.compactMap { doc -> QuizUser? in
                    let userID = doc.documentID
                    let data = doc.data()
                    return QuizUser(userID: userID, dictionary: data)
                }
                
                // Secondary sort by totalTimeToAnswerAllQuestions in ascending order for users with the same bestTotalQuizPoints
                users.sort { (user1, user2) -> Bool in
                    if user1.bestTotalQuizPoints == user2.bestTotalQuizPoints {
                        return user1.totalTimeToAnswerAllQuestions < user2.totalTimeToAnswerAllQuestions
                    }
                    return user1.bestTotalQuizPoints > user2.bestTotalQuizPoints
                }
                
                completion(users)
            }
    }

}

