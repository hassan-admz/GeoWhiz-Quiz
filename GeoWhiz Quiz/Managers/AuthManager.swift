//
//  AuthManager.swift
//  GeoWhiz Quiz
//
//  Created by Hassan Mayers on 17/3/24.
//

import UIKit
import FirebaseAuth
import GoogleSignIn

class AuthManager {
    
    static let shared = AuthManager()
    
    private init() {}
    
    func signIn(cred: AuthCredential, googleUser: GIDGoogleUser?, completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(with: cred) { result, error in
            guard let _ = result?.user, error == nil else {
                completion(false)
                return
            }
            
            if let googleUser = googleUser {
                DatabaseManager.handleUserSignIn(user: googleUser)
            }
            
            let mainTabBarVC = MainTabBarVC()
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(vc: mainTabBarVC)
            
            completion(true)
        }
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
    
    func deleteAccount() {
        guard let user = Auth.auth().currentUser else {
            print("No user signed in.")
            return
        }
        
        // Delete the user's account
        user.delete { error in
            if let error = error {
                print("Error deleting user account: \(error.localizedDescription)")
            } else {
                print("User account deleted successfully.")
                // Optionally, you can sign out the user after deleting the account
                do {
                    try AuthManager.shared.signOut()
                    let signInVC = UINavigationController(rootViewController: SignInVC())
                    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(vc: signInVC)
                } catch {
                    print("error signing out")
                }
            }
        }
    }
}
