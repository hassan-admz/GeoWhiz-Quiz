//
//  DifficultySelectionVC.swift
//  GeoWhiz Quiz
//
//  Created by Hassan Mayers on 27/2/24.
//

import UIKit

class DifficultySelectionVC: UIViewController {
    
    let difficultySelectionViews = DifficultySelectionView()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        configureUI()
        fetchQuizzes()
//        goToQuiz()
    }
    
    // MARK: - Configure UI
    
    private func configureUI() {
        self.navigationItem.title = "GeoWhiz Quiz"
       
        view.addSubview(difficultySelectionViews)
        difficultySelectionViews.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            difficultySelectionViews.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            difficultySelectionViews.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            difficultySelectionViews.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            difficultySelectionViews.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            
        ])
    }
    
    func goToQuiz() {
        difficultySelectionViews.difficultySelected = { [weak self] difficulty in
            guard let strongSelf = self else { return }
            let quizVC = QuizVC()
//            quizVC.selectedDifficulty = difficulty
            strongSelf.navigationController?.pushViewController(quizVC, animated: true)
//            DispatchQueue.main.async {
//                strongSelf.navigationController?.pushViewController(quizVC, animated: true)
//            }
        }
    }
    
    // MARK: - API
    
    
    func fetchQuizzes() {
        difficultySelectionViews.difficultySelected = { [weak self] difficulty in
                Task {
                    do {
                        guard let strongSelf = self else { return }
                        let quizzes = try await NetworkManager.shared.fetchQuizData(for: difficulty)
                        DispatchQueue.main.async {
                            strongSelf.navigateToQuizVC2(with: quizzes)
                        }
                        print(quizzes)
                    } catch {
                        print(error)
                    }
                }
            
//            Task {
//                do {
//                    let quizzes = try await NetworkManager.shared.fetchQuizData(for: difficulty)
//                    strongSelf.navigateToQuizVC2(with: quizzes)
//                } catch {
//                    print(error)
//                }
//            }
        }
    }
    
    func navigateToQuizVC(with difficulty: String) {
        let quizVC = QuizVC()
        quizVC.selectedDifficulty = difficulty
        self.navigationController?.pushViewController(quizVC, animated: true)
    }
    
    func navigateToQuizVC2(with quizzes: [Quiz]) {

        let quizVC = QuizVC()
        quizVC.quizData = quizzes
//        quizVC.currentQuizIndex = 0
//        quizVC.currentQuiz = quizVC.quizData[quizVC.currentQuizIndex]
        
        // Navigation on the main thread
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(quizVC, animated: true)
        }
    }
}
