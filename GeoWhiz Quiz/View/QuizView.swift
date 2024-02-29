//
//  QuizView.swift
//  GeoWhiz Quiz
//
//  Created by Hassan Mayers on 27/2/24.
//

import UIKit

class QuizView: UIView {
    
    private lazy var pointsContainerView = PointsContainerView()
    
    private lazy var starImageView: UIImageView = {
        let iv = UIImageView()
        
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var pointsLabel: UILabel = {
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let circularTimerView = CircularCountdownTimerView()
    
    private lazy var countdownLabel: UILabel = {
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var questionNumberLabel: UILabel = {
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var questionLabel: UILabel = {
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var stackView = UIStackView()
    
    private lazy var answerButton: UIButton = {
        let btn = UIButton()
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private lazy var nextButton: UIButton = {
        let btn = UIButton()
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private lazy var hintButton: UIButton = {
        let btn = UIButton()
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupQuizViewUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupQuizViewUI() {
        addQuizViews()
        setupQuizViewConstraints()
    }
    
    private func addQuizViews() {
        configurePointsContainerView()
        configurePointsContainerView()
        addSubview(questionNumberLabel)
        addSubview(questionLabel)
        configureStackView()
        addSubview(nextButton)
        addSubview(hintButton)
    }
    
    private func setupQuizViewConstraints() {
        NSLayoutConstraint.activate([
        
        ])
    }
    
    private func configurePointsContainerView() {
        addSubview(pointsContainerView)
        pointsContainerView.translatesAutoresizingMaskIntoConstraints = false
        pointsContainerView.addSubview(starImageView)
        pointsContainerView.addSubview(pointsLabel)
        
        NSLayoutConstraint.activate([
        
        ])
    }
    
    private func configureCircularCountdownTimerView() {
        addSubview(circularTimerView)
        circularTimerView.addSubview(countdownLabel)
        
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
            stackView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -30)
        ])
    }
    
    private func addButtonsToStackView() {
        let buttonTitle = ["Answer 1","Answer 2","Answer 3","Answer 4"]
        
        for title in buttonTitle {
            lazy var button = answerButton
            button.setTitle("\(title)", for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            button.setTitleColor(.black, for: .normal)
            button.heightAnchor.constraint(equalToConstant: 100).isActive = true
            button.clipsToBounds = true
            stackView.addArrangedSubview(button)
        }
    }
}
