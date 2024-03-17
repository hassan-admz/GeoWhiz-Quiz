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
        
        // Handle Next Button Tapped
        quizView.buttonTapHandler = { [weak self] in
            self?.nextButtonTapped()
        }
    }
    
    private func displayCurrentQuiz() {
        guard currentQuizIndex < quizData.count else { return }
        let currentQuiz = quizData[currentQuizIndex]
        quizView.setQuestion(question: currentQuiz.question.decodedString())

        var answers = currentQuiz.incorrectAnswers
        answers.append(currentQuiz.correctAnswer)
        answers.shuffle() // Shuffle to randomize the order
        
        quizView.setButtonTitles(answers: answers)
        quizView.setQuestionNumber(questionNumber: currentQuizIndex+1)
    }
    
    private func nextButtonTapped() {
        // Logic to display next quiz question & answers
        currentQuizIndex += 1
        if currentQuizIndex >= quizData.count {
            let resultsVC = QuizResultsVC()
            navigationController?.pushViewController(resultsVC, animated: true)
        }
        self.configureUI()
        quizView.resetCircularProgressView()
        print("This works!")
        print("The current index is: \(currentQuizIndex)")
    }
    
    // MARK: - API
    
    private func fetchQuiz() {
        Task {
            do {
                guard let difficultySelected = selectedDifficulty else { return }
                let quiz = try await NetworkManager.shared.fetchQuizData(for: difficultySelected)
                self.quizData = quiz
                DispatchQueue.main.async {
                    self.displayCurrentQuiz()
                }
                print(quiz)
            } catch {
                print(error)
            }
        }
    }
}

