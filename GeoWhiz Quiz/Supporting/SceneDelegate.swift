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
        // Check if the user is logged in
        if Auth.auth().currentUser != nil {
            // User is logged in, set the MainTabBarVC as the root
            let mainTabBarVC = MainTabBarVC()
            window.rootViewController = mainTabBarVC
        } else {
            // User is not logged in, show the SignInVC
            let signInVC = SignInVC()
            window.rootViewController = UINavigationController(rootViewController: signInVC)
        }
        self.window = window
        window.makeKeyAndVisible()
    }
    
    func changeRootViewController(vc: UIViewController) {
        guard let window = window else {
            return
        }
        
        window.rootViewController = vc
        UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
}

