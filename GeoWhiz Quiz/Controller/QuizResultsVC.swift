//
//  QuizResultsVC.swift
//  GeoWhiz Quiz
//
//  Created by Hassan Mayers on 27/2/24.
//

import UIKit
import Firebase

class QuizResultsVC: UIViewController {

    let quizResultsView = QuizResultsView()
    let quizView = QuizView()
    var finalScore: Int = 0
    var totalTimeToAnswerAllQuestions: Int = 0
    var selectedDifficulty: String?
    var totalPoints: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        updateQuizResults()
        print("THE TOTAL TIME TAKEN TO ANSWER ALL QUESTIONS: \(totalTimeToAnswerAllQuestions)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
    }
    
    private func configureUI() {
        
        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = "GeoWhiz Quiz"
        view.addSubview(quizResultsView)
        quizResultsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            quizResultsView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            quizResultsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            quizResultsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            quizResultsView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            
        ])
        
        quizResultsView.updateScoreAndPoints(with: finalScore, and: totalPoints)
        
        // Handle Home Button Tapped
        quizResultsView.buttonTapHandler = { [weak self] in
            self?.homeButtonTapped()
        }
    }
    
    private func homeButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: - API
    private func updateQuizResults() {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        guard let difficulty = selectedDifficulty else { return }
        
        switch difficulty {
        case "Easy":
            DatabaseManager.saveQuizResult(userID: userID, difficulty: difficulty, score: totalPoints, perfectScore: 100, reward: "badge-easy")
        case "Medium":
            DatabaseManager.saveQuizResult(userID: userID, difficulty: difficulty, score: totalPoints, perfectScore: 200, reward: "badge-medium")
        case "Hard":
            DatabaseManager.saveQuizResult(userID: userID, difficulty: difficulty, score: totalPoints, perfectScore: 300, reward: "badge-hard")
        default:
            print("There was an error with difficulty selected")
        }
    }
}
