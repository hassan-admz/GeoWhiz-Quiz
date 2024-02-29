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
        
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var congratsLabel: UILabel = {
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var quizResultsMessageLabel: UILabel = {
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var scoreTitleLabel: UILabel = {
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var scoreNumberLabel: UILabel = {
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var pointsTitleLabel: UILabel = {
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var pointsNumberLabel: UILabel = {
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var starImageView: UIImageView = {
        let iv = UIImageView()
        
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupQuizResultsViewUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupQuizResultsViewUI() {
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
    }
    
    private func setupQuizResultsViewConstraints() {
        NSLayoutConstraint.activate([
            
        ])
    }
}
