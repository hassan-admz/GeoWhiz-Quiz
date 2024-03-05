//
//  QuizResultsVC.swift
//  GeoWhiz Quiz
//
//  Created by Hassan Mayers on 27/2/24.
//

import UIKit

class QuizResultsVC: UIViewController {

    let quizResultsView = QuizResultsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
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
    }
}
