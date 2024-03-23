//
//  SignInView.swift
//  GeoWhiz Quiz
//
//  Created by Hassan Mayers on 27/2/24.
//

import UIKit

class SignInView: UIView {
    
    private lazy var logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "earth-globe")
        iv.tintColor = .black
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "GeoWhiz Quiz"
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSignInViewUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSignInViewUI() {
        self.backgroundColor = .clear
        addSignInViews()
        setupSignInViewConstraints()
    }
    
    private func addSignInViews() {
        addSubview(logoImageView)
        addSubview(titleLabel)
    }
    
    private func setupSignInViewConstraints() {
        NSLayoutConstraint.activate([
            
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 150),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: logoImageView.centerXAnchor, constant: -6),
            titleLabel.widthAnchor.constraint(equalToConstant: 200),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
            
        ])
    }
}
