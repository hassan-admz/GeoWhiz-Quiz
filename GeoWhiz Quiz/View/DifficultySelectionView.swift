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
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var selectionButton: UIButton = {
        let btn = UIButton()
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var stackView = UIStackView()
    
    private lazy var signOutButton: UIButton = {
        let btn = UIButton()
        
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
    }
    
    private func setupDifficultySelectionViewConstraints() {
        NSLayoutConstraint.activate([
        
        
        ])
    }
    
    private func configureStackView() {
        addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 18
        stackView.translatesAutoresizingMaskIntoConstraints = false
        setStackViewConstraints()
        addButtonsToStackView()
    }
    
    private func setStackViewConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: signOutButton.topAnchor, constant: -30)
        ])
    }
    
    private func addButtonsToStackView() {
        let buttonTitle = ["Easy","Medium","Difficult"]
        
        for title in buttonTitle {
            lazy var button = selectionButton
            button.setTitle("\(title)", for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            button.setTitleColor(.black, for: .normal)
            button.heightAnchor.constraint(equalToConstant: 100).isActive = true
            button.clipsToBounds = true
            stackView.addArrangedSubview(button)
        }
    }
}
