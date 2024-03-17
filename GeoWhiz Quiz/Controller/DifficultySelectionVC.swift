//
//  DifficultySelectionVC.swift
//  GeoWhiz Quiz
//
//  Created by Hassan Mayers on 27/2/24.
//

import UIKit
import FirebaseAuth

class DifficultySelectionVC: UIViewController {
    
    let difficultySelectionViews = DifficultySelectionView()
    
    // MARK: - Lifecycle
    
    var currentUser: User!
    init(currentUser: User) {
        self.currentUser = currentUser
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        configureUI()
        fetchQuizzes()
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
        
        // Handle Delete Account Button Tapped
        difficultySelectionViews.buttonTapHandler = { [weak self] in
            self?.didTapDeleteAccount()
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
                        strongSelf.navigateToQuizVC(with: quizzes)
                    }
                    print(quizzes)
                } catch {
                    print(error)
                }
            }
        }
    }
    
    func navigateToQuizVC(with quizzes: [Quiz]) {
        
        let quizVC = QuizVC()
        quizVC.quizData = quizzes
        
        // Navigation on the main thread
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(quizVC, animated: true)
        }
    }
    
    // MARK: - Actions
    
    func didTapDeleteAccount() {
        showDeleteAccountConfirmationAlert()
    }
    
    func showDeleteAccountConfirmationAlert() {
        let alert = UIAlertController(title: "Delete Account", message: "Are you sure you want to delete your account? This will permanently erase your account.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive){ [weak self] (_) in
            self?.deleteAccount() // Call the deleteAccount function
        })
        present(alert, animated: true)
    }
    
    func deleteAccount() {
        AuthManager.shared.deleteAccount()
    }
}
