//
//  DifficultySelectionVC.swift
//  GeoWhiz Quiz
//
//  Created by Hassan Mayers on 27/2/24.
//

import UIKit

class DifficultySelectionVC: UIViewController {
    
    let difficultySelectionViews = DifficultySelectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        configureUI()
    }
    
    private func configureUI() {
        self.navigationItem.title = "GeoWhiz Quiz"
        view.addSubview(difficultySelectionViews)
        difficultySelectionViews.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            difficultySelectionViews.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            difficultySelectionViews.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
}
