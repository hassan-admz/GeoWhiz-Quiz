//
//  QuizVC.swift
//  GeoWhiz Quiz
//
//  Created by Hassan Mayers on 27/2/24.
//

import UIKit

class QuizVC: UIViewController {
    
    let quizView = QuizView()
    var quizData = [Quiz]()
    var currentQuiz: Quiz?
    var currentQuizIndex: Int = 0
    var selectedDifficulty: String?
    var score: Int = 0
    var points: Int = 0
    var totalTimeToAnswerAllQuestions: Int = 0
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Configure UI
    
    private func configureUI() {
        self.displayCurrentQuiz()
        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = "GeoWhiz Quiz"
        view.addSubview(quizView)
        quizView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            quizView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            quizView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            quizView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            quizView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            
        ])
        
        quizView.totalCorrectAnswers = { [weak self] userCorrectAnswers in
            self?.score = userCorrectAnswers
        }
        
        quizView.totalPointsScored = { [weak self] pointsScored in
            self?.points = pointsScored
        }
        
        quizView.totalTimeToAnswerQuestions = { [weak self] timeToAnswerQuestion in
            self?.totalTimeToAnswerAllQuestions = timeToAnswerQuestion
        }
        
        // Handle Next Button Tapped
        quizView.buttonTapHandler = { [weak self] in
            self?.nextButtonTapped()
        }
    }
    
    // MARK: - Actions
    
    private func displayCurrentQuiz() {
        guard currentQuizIndex < quizData.count else { return }
        let currentQuiz = quizData[currentQuizIndex]
        quizView.setQuestion(question: currentQuiz.question.decodedString())

        var answers = currentQuiz.incorrectAnswers
        answers.append(currentQuiz.correctAnswer)
        answers.shuffle() // Shuffle to randomize the order
        
        quizView.setAnswerButtonTitles(answers: answers)
        quizView.setQuestionNumber(questionNumber: currentQuizIndex+1)
        quizView.currentQuiz = currentQuiz
        quizView.selectedDifficulty = selectedDifficulty
    }
    
    private func nextButtonTapped() {
        // Logic to display next quiz question & answers
        currentQuizIndex += 1
        if currentQuizIndex >= quizData.count {
            let resultsVC = QuizResultsVC()
            resultsVC.selectedDifficulty = selectedDifficulty
            resultsVC.finalScore = score
            resultsVC.totalPoints = points
            resultsVC.totalTimeToAnswerAllQuestions = totalTimeToAnswerAllQuestions
            navigationController?.pushViewController(resultsVC, animated: true)
        }
        self.configureUI()
        quizView.resetCircularProgressView()
        quizView.resetAnswerButtons()
    }
}

