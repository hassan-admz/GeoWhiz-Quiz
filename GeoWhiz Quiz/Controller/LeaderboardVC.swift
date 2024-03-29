//
//  LeaderboardVC.swift
//  GeoWhiz Quiz
//
//  Created by Hassan Mayers on 27/2/24.
//

import UIKit

class LeaderboardVC: UIViewController {
    
    let leaderboardView = LeaderboardView()
    var users: [QuizUser] = [] {
        didSet {
            DispatchQueue.main.async {
                self.leaderboardView.reloadTableViewData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchUsers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI()
        fetchUsers()
    }
    
    private func configureUI() {
        self.view.backgroundColor = .white
        self.navigationItem.title = "Leaderboard"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        view.addSubview(leaderboardView)
        leaderboardView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            leaderboardView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            leaderboardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            leaderboardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            leaderboardView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            
        ])
    }
    
    private func fetchUsers() {
        DatabaseManager.fetchUsers { [weak self] users in
            self?.users = users
            self?.updateLeaderboardWithUsers()
        }
    }
    
    private func updateLeaderboardWithUsers() {
        leaderboardView.users = self.users
    }
}
