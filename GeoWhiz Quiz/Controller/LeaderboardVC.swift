//
//  LeaderboardVC.swift
//  GeoWhiz Quiz
//
//  Created by Hassan Mayers on 27/2/24.
//

import UIKit

class LeaderboardVC: UIViewController {
    
    let leaderboardView = LeaderboardView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = "Leaderboard"
        view.addSubview(leaderboardView)
        leaderboardView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            leaderboardView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            leaderboardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            leaderboardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            leaderboardView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            
        ])
    }
}
