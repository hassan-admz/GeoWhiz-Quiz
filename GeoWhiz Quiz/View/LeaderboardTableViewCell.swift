//
//  LeaderboardTableViewCell.swift
//  GeoWhiz Quiz
//
//  Created by Hassan Mayers on 29/2/24.
//

import UIKit

class LeaderboardTableViewCell: UITableViewCell {
    
    static let identifier = "LeaderboardTableViewCell"
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Components
    
    private let rankLabel: UILabel = {
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let userImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = iv.frame.size.width / 2
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let userNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Maythem Mayers"
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 25)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let pointsNumberLabel: UILabel = {
        let lbl = UILabel()
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let badgeImageView: UIImageView = {
        let iv = UIImageView()
        
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private func configureUI() {
        addTableViewCellViews()
        setupTableViewCellViewsConstraints()
    }
    
    private func addTableViewCellViews() {
        addSubview(rankLabel)
        addSubview(userImageView)
        addSubview(userNameLabel)
        addSubview(pointsNumberLabel)
        addSubview(badgeImageView)
    }
    
    func setupTableViewCellViewsConstraints() {
        NSLayoutConstraint.activate([
            
            rankLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            rankLabel.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            rankLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2),
            rankLabel.widthAnchor.constraint(equalToConstant: 20),
            
            userImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            userImageView.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            userImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2),
            userImageView.widthAnchor.constraint(equalToConstant: 60),
            
            userNameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 12),
            userNameLabel.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor, constant: 0),
            userNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
        ])
    }
    
    // MARK: - Functions
    
//    public func setTitle(with text: String) {
//        self.userNameLabel.text = text
//    }
//
//    public func setImage(with urlString: String) {
//        if let url = URL(string: urlString) {
//            placeImageView.sd_setImage(with: url)
//            self.setNeedsLayout()
//        }
//    }
}
