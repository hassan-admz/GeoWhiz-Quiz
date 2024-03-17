//
//  AuthManager.swift
//  GeoWhiz Quiz
//
//  Created by user on 17/3/24.
//

import UIKit
import FirebaseAuth

class AuthManager {
    
    static let shared = AuthManager()
    
    private init() {}
    
    func signIn(cred: AuthCredential) {
        Auth.auth().signIn(with: cred) { result, error in
            guard let user = result?.user, error == nil else {
                return
            }
            let difficultySelectionVC = UINavigationController(rootViewController: DifficultySelectionVC(currentUser: user))
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(vc: difficultySelectionVC)
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
