//
//  SceneDelegate.swift
//  GeoWhiz Quiz
//
//  Created by Hassan Mayers on 27/2/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let winScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: winScene)
//        window.rootViewController = UINavigationController(rootViewController: SignInVC())
        window.rootViewController = UINavigationController(rootViewController: DifficultySelectionVC())
//        window.rootViewController = UINavigationController(rootViewController: QuizVC())
//        window.rootViewController = UINavigationController(rootViewController: QuizResultsVC())
//        window.rootViewController = UINavigationController(rootViewController: LeaderboardVC())
        self.window = window
        window.makeKeyAndVisible()
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

