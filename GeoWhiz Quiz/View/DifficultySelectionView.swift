//
//  DifficultySelectionView.swift
//  GeoWhiz Quiz
//
//  Created by Hassan Mayers on 27/2/24.
//

import UIKit

class DifficultySelectionView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Choose Difficulty"
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var stackView = UIStackView()
    
    private lazy var signOutButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Sign Out", for: .normal)
        btn.setTitleColor(.red, for: .normal)
        btn.isEnabled = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private lazy var deleteAccountButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Delete Account", for: .normal)
        btn.setTitleColor(.red, for: .normal)
        btn.isEnabled = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDifficultySelectionViewUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupDifficultySelectionViewUI() {
        addDifficultySelectionViews()
        setupDifficultySelectionViewConstraints()
    }
    
    private func addDifficultySelectionViews() {
        addSubview(titleLabel)
        configureStackView()
        addSubview(signOutButton)
        addSubview(deleteAccountButton)
    }
    
    private func setupDifficultySelectionViewConstraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 250),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            signOutButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 130),
            signOutButton.centerXAnchor.constraint(equalTo: centerXAnchor),

            deleteAccountButton.topAnchor.constraint(equalTo: signOutButton.bottomAnchor, constant: 20),
            deleteAccountButton.centerXAnchor.constraint(equalTo: centerXAnchor)
            
        ])
    }
    
    private func configureStackView() {
        addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addButtonsToStackView()
    }
    
    private func addButtonsToStackView() {
        let buttonTitle = ["Easy","Medium","Difficult"]
        
        for title in buttonTitle {
            let button = UIButton(type: .system)
            button.setTitle("\(title)", for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            button.setTitleColor(.black, for: .normal)
            button.backgroundColor = .systemGray6
            button.layer.cornerRadius = 10
            button.heightAnchor.constraint(equalToConstant: 75).isActive = true
            button.widthAnchor.constraint(equalToConstant: 300).isActive = true
            button.clipsToBounds = true
            button.isEnabled = true
            stackView.addArrangedSubview(button)
        }
    }
}
