//
//  QuizResultsView.swift
//  GeoWhiz Quiz
//
//  Created by Hassan Mayers on 27/2/24.
//

import UIKit

class QuizResultsView: UIView {
    
    private lazy var globeImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "earth-globe-color")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var congratsLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Congratulations!"
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var quizResultsMessageLabel: UILabel = {
        let lbl = UILabel()
        let labelText = "Well done on completing the quiz. Hope you enjoyed it."
        let attributedString = NSMutableAttributedString(string: labelText)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8 // Adjust the line spacing as needed
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
        lbl.attributedText = attributedString
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var scoreTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "YOUR SCORE"
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var scoreNumberLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "10 / 10"
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 27, weight: .heavy)
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var pointsTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "EARNED POINTS"
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var pointsNumberLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "100"
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 27, weight: .heavy)
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var starImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "star.fill")
        iv.tintColor = .orange
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var homeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Home", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 10
        btn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 140).isActive = true
        btn.clipsToBounds = true
        btn.isEnabled = true
        btn.addTarget(self, action: #selector(didTapHomeButton), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupQuizResultsViewUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupQuizResultsViewUI() {
        self.backgroundColor = .clear
        addQuizResultsViews()
        setupQuizResultsViewConstraints()
    }
    
    private func addQuizResultsViews() {
        addSubview(globeImageView)
        addSubview(congratsLabel)
        addSubview(quizResultsMessageLabel)
        addSubview(scoreTitleLabel)
        addSubview(scoreNumberLabel)
        addSubview(pointsTitleLabel)
        addSubview(pointsNumberLabel)
        addSubview(starImageView)
        addSubview(homeButton)
    }
    
    private func setupQuizResultsViewConstraints() {
        NSLayoutConstraint.activate([
            
            globeImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            globeImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            globeImageView.widthAnchor.constraint(equalToConstant: 175),
            globeImageView.heightAnchor.constraint(equalToConstant: 175),
            
            congratsLabel.topAnchor.constraint(equalTo: globeImageView.bottomAnchor, constant: 10),
            congratsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            congratsLabel.widthAnchor.constraint(equalToConstant: 250),
            congratsLabel.heightAnchor.constraint(equalToConstant: 50),
            
            quizResultsMessageLabel.topAnchor.constraint(equalTo: congratsLabel.bottomAnchor, constant: 5),
            quizResultsMessageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            quizResultsMessageLabel.widthAnchor.constraint(equalToConstant: 250),
            quizResultsMessageLabel.heightAnchor.constraint(equalToConstant: 50),
            
            scoreTitleLabel.topAnchor.constraint(equalTo: quizResultsMessageLabel.bottomAnchor, constant: 20),
            scoreTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            scoreTitleLabel.widthAnchor.constraint(equalToConstant: 250),
            scoreTitleLabel.heightAnchor.constraint(equalToConstant: 45),
            
            scoreNumberLabel.topAnchor.constraint(equalTo: scoreTitleLabel.bottomAnchor, constant: 2),
            scoreNumberLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            scoreNumberLabel.widthAnchor.constraint(equalToConstant: 250),
            scoreNumberLabel.heightAnchor.constraint(equalToConstant: 30),
            
            pointsTitleLabel.topAnchor.constraint(equalTo: scoreNumberLabel.bottomAnchor, constant: 27),
            pointsTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            pointsTitleLabel.widthAnchor.constraint(equalToConstant: 250),
            pointsTitleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            pointsNumberLabel.topAnchor.constraint(equalTo: pointsTitleLabel.bottomAnchor, constant: 5),
            pointsNumberLabel.leadingAnchor.constraint(equalTo: starImageView.trailingAnchor, constant: 5),
            pointsNumberLabel.widthAnchor.constraint(equalToConstant: 60),
            pointsNumberLabel.heightAnchor.constraint(equalToConstant: 30),
            
            starImageView.topAnchor.constraint(equalTo: pointsTitleLabel.bottomAnchor, constant: 5),
            starImageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -30),
            starImageView.widthAnchor.constraint(equalToConstant: 30),
            starImageView.heightAnchor.constraint(equalToConstant: 30),
            
            homeButton.topAnchor.constraint(equalTo: starImageView.bottomAnchor, constant: 100),
            homeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            homeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40)
        ])
    }
    
    var buttonTapHandler: (() -> Void)?

    @objc func didTapHomeButton() {
        buttonTapHandler?()
    }
    
    func updateScoreAndPoints(with score: Int, and points: Int) {
        scoreNumberLabel.text = "\(score) / 10"
        pointsNumberLabel.text = "\(points)"
    }
}
