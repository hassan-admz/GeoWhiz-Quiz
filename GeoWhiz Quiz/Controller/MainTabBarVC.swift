//
//  MainTabBarVC.swift
//  GeoWhiz Quiz
//
//  Created by Hassan Mayers on 22/3/24.
//

import UIKit
import FirebaseAuth

class MainTabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let user = Auth.auth().currentUser else { return }
        let vc1 = UINavigationController(rootViewController: DifficultySelectionVC(currentUser: user))
        let vc2 = UINavigationController(rootViewController: LeaderboardVC())
        
        vc1.tabBarItem.image = UIImage(systemName: "house.fill")
        vc2.tabBarItem.image = UIImage(systemName: "trophy.fill")
        
        vc1.title = "Quiz"
        vc2.title = "Leaderboard"
        
        setViewControllers([vc1,vc2], animated: true)
        tabBar.tintColor = .black
    }
}
