//
//  SignInVC.swift
//  GeoWhiz Quiz
//
//  Created by Hassan Mayers on 27/2/24.
//

import UIKit
import GoogleSignIn

class SignInVC: UIViewController {
    
    let signInView = SignInView()
    let googleButton = GIDSignInButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureButton()
        configureGoogleSignIn()
        configureSignInViews()
    }
    
    private func configureSignInViews() {
        view.addSubview(signInView)
        signInView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            signInView.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            signInView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func configureButton() {
        view.addSubview(googleButton)
        googleButton.translatesAutoresizingMaskIntoConstraints = false
        googleButton.addTarget(self, action: #selector(didTapGoogleSignIn), for: .touchUpInside)
        googleButton.layer.cornerRadius = 10

        NSLayoutConstraint.activate([
            
            googleButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -350),
            googleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            googleButton.widthAnchor.constraint(equalToConstant: 250),
            googleButton.heightAnchor.constraint(equalToConstant: 150),
        ])
    }
    
    private func configureGoogleSignIn() {
        print("Signed In to Google")
        let clientID = "73406296588-cr11ksunr6i8rma02kujmo2t98bsngjk.apps.googleusercontent.com"
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
    }
    
    @objc func didTapGoogleSignIn() {
//        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [weak self] result, error in
//            guard let user = result?.user,
//                  let idToken = user.idToken?.tokenString,
//                  let strongSelf = self else {
//                print("error with signin")
//                return
//            }
//        }
    }
}

