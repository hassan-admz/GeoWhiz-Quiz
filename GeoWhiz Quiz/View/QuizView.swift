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
        iv.image = UIImage(systemName: "star.fill")
        iv.tintColor = .orange
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var pointsLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "0"
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let circularProgressView: CircularProgressView = {
        let cpv = CircularProgressView(frame: CGRect(x: (UIScreen.main.bounds.width / 2) - 45, y: (UIScreen.main.bounds.height / 2) - 45, width: 90, height: 90))
        cpv.backgroundColor = .clear
        cpv.clipsToBounds = true
        cpv.layer.cornerRadius = 45
        cpv.sizeToFit()
        cpv.translatesAutoresizingMaskIntoConstraints = false
        return cpv
    }()
    
    private lazy var questionNumberLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Question 1 of 10"
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var questionLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Here is where the text for the Geography related question will be put for users to answer."
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var stackView = UIStackView()
    
    private lazy var nextButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Next Question", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 10
        btn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 200).isActive = true
        btn.clipsToBounds = true
        btn.isEnabled = true
        btn.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
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
        getRemainingSeconds()
    }
    
    private func addQuizViews() {
        configurePointsContainerView()
        addSubview(circularProgressView)
        addSubview(questionNumberLabel)
        addSubview(questionLabel)
        configureStackView()
        addSubview(nextButton)
    }
    
    private func setupQuizViewConstraints() {
        NSLayoutConstraint.activate([
            
            pointsContainerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            pointsContainerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25),
            pointsContainerView.widthAnchor.constraint(equalToConstant: 80),
            pointsContainerView.heightAnchor.constraint(equalToConstant: 30),
            
            circularProgressView.topAnchor.constraint(equalTo: pointsContainerView.bottomAnchor, constant: 30),
            circularProgressView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            circularProgressView.widthAnchor.constraint(equalToConstant: 90),
            circularProgressView.heightAnchor.constraint(equalToConstant: 90),
            
            questionNumberLabel.topAnchor.constraint(equalTo: circularProgressView.bottomAnchor, constant: 35),
            questionNumberLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15),
            questionNumberLabel.widthAnchor.constraint(equalToConstant: 200),
            questionNumberLabel.heightAnchor.constraint(equalToConstant: 15),
            
            questionLabel.topAnchor.constraint(equalTo: questionNumberLabel.bottomAnchor, constant: 10),
            questionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15),
            questionLabel.widthAnchor.constraint(equalToConstant: 350),
            questionLabel.heightAnchor.constraint(equalToConstant: 90),
            
            stackView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 15),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            nextButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            nextButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
            
        ])
    }
    
    private func configurePointsContainerView() {
        addSubview(pointsContainerView)
        pointsContainerView.translatesAutoresizingMaskIntoConstraints = false
        pointsContainerView.addSubview(starImageView)
        pointsContainerView.addSubview(pointsLabel)
        
        NSLayoutConstraint.activate([
            
            starImageView.topAnchor.constraint(equalTo: pointsContainerView.topAnchor, constant: 5),
            starImageView.leadingAnchor.constraint(equalTo: pointsContainerView.leadingAnchor, constant: 12),
            starImageView.widthAnchor.constraint(equalToConstant: 20),
            starImageView.heightAnchor.constraint(equalToConstant: 20),
            
            pointsLabel.topAnchor.constraint(equalTo: pointsContainerView.topAnchor, constant: 5),
            pointsLabel.leadingAnchor.constraint(equalTo: starImageView.trailingAnchor, constant: 7),
            pointsLabel.widthAnchor.constraint(equalToConstant: 30),
            pointsLabel.heightAnchor.constraint(equalToConstant: 20)
            
        ])
    }
    
    private func configureStackView() {
        addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addButtonsToStackView()
    }
    
    private func addButtonsToStackView() {
        let buttonTitle = ["Answer 1","Answer 2","Answer 3","Answer 4"]
        
        for title in buttonTitle {
            let button = UIButton(type: .system)
            button.setTitle("\(title)", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.backgroundColor = .systemGray6
            button.layer.cornerRadius = 10
            button.heightAnchor.constraint(equalToConstant: 60).isActive = true
            button.widthAnchor.constraint(equalToConstant: 200).isActive = true
            button.clipsToBounds = true
            button.isEnabled = true
            button.addTarget(self, action: #selector(didTapAnswerButton(_:)), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
    }
    
    var buttonTapHandler: (() -> Void)?
    
    @objc func didTapNextButton() {
        buttonTapHandler?()
    }
    
    var answerChosen: ((String) -> Void)?
    var currentQuiz: Quiz?
    var selectedDifficulty: String?
    var pointsScored: Int = 0
    var remainingSeconds: Int = 0
    
    func getRemainingSeconds() {
        circularProgressView.remainingSecondsUpdate = { [weak self] remainingSeconds in
            // Use remainingSeconds as needed
            self?.remainingSeconds = remainingSeconds
        }
    }
    
    @objc func didTapAnswerButton(_ sender: UIButton) {

        guard let userAnswerChosen = sender.titleLabel?.text else { return }
        answerChosen?(userAnswerChosen)

        guard let difficulty = selectedDifficulty else { return }
        
        switch difficulty {
        case "Easy":
            handleAnswerSelectedAndFluctuatePoints(by: 5, or: 1)
            getRemainingSeconds()
            print("REMAINING SECONDS ARE: \(remainingSeconds)")
            print(difficulty)
        case "Medium":
            handleAnswerSelectedAndFluctuatePoints(by: 10, or: 2)
            getRemainingSeconds()
            print("REMAINING SECONDS ARE: \(remainingSeconds)")
            print(difficulty)
        case "Hard":
            handleAnswerSelectedAndFluctuatePoints(by: 15, or: 3)
            getRemainingSeconds()
            print("REMAINING SECONDS ARE: \(remainingSeconds)")
            print(difficulty)
        default:
            print("There was an error with difficulty selected")
        }
        
        func handleAnswerSelectedAndFluctuatePoints(by pointsInc: Int, or pointsDec: Int) {
            if userAnswerChosen == currentQuiz?.correctAnswer {
                sender.layer.borderWidth = 2.0
                sender.layer.borderColor = UIColor.green.cgColor
                if remainingSeconds >= 15 {
                    pointsScored += pointsInc*2
                } else {
                    pointsScored += pointsInc
                }
//                pointsScored += pointsInc
                self.pointsLabel.text = "\(pointsScored)"
                print(difficulty)
            } else {
                sender.layer.borderWidth = 2.0
                sender.layer.borderColor = UIColor.red.cgColor
                pointsScored -= pointsDec
                self.pointsLabel.text = "\(pointsScored)"
                print(difficulty)
            }
        }
        stackView.arrangedSubviews.forEach { view in
            if let button = view as? UIButton {
                button.isEnabled = false
            }
        }
    }
    
    func resetAnswerButtons() {
        for case let button as UIButton in stackView.arrangedSubviews {
            // Here you can modify the button as needed
            button.isEnabled = true
            button.layer.borderColor = UIColor.clear.cgColor
            button.layer.borderWidth = 0
        }
    }
    
    func resetCircularProgressView() {
        self.circularProgressView.resetCountdown(newDuration: 30)
    }
    
    func setQuestionNumber(questionNumber: Int) {
        questionNumberLabel.text = "Question \(questionNumber) of 10"
    }
    
    func setQuestion(question: String) {
        questionLabel.text = question
    }
    
    func setAnswerButtonTitles(answers: [String]) {
        let shuffledAnswers = answers.shuffled()
        
        for (index, answer) in shuffledAnswers.enumerated() {
            if let button = stackView.arrangedSubviews[index] as? UIButton {
                button.setTitle(answer.decodedString(), for: .normal)
                button.isHidden = false
                button.layer.borderColor = .none
                button.isEnabled = true
            }
        }
        // Hide any unused buttons if there are less than 4 answers
        if shuffledAnswers.count < stackView.arrangedSubviews.count {
            for index in shuffledAnswers.count..<stackView.arrangedSubviews.count {
                stackView.arrangedSubviews[index].isHidden = true
            }
        }
    }
}
