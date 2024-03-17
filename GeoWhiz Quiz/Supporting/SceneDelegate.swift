//
//  SceneDelegate.swift
//  GeoWhiz Quiz
//
//  Created by Hassan Mayers on 27/2/24.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let winScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: winScene)
        window.rootViewController = UINavigationController(rootViewController: SignInVC())
//        window.rootViewController = UINavigationController(rootViewController: DifficultySelectionVC())
//        window.rootViewController = UINavigationController(rootViewController: QuizVC())
//        window.rootViewController = UINavigationController(rootViewController: QuizResultsVC())
//        window.rootViewController = UINavigationController(rootViewController: LeaderboardVC())
        self.window = window
        window.makeKeyAndVisible()
        if let user = Auth.auth().currentUser {
            window.rootViewController = UINavigationController(rootViewController: DifficultySelectionVC(currentUser: user))
        } else {
            window.rootViewController = UINavigationController(rootViewController: SignInVC())
        }
    }
    
    func changeRootViewController(vc: UIViewController) {
        guard let window = window else {
            return
        }
        
        window.rootViewController = vc
        UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

