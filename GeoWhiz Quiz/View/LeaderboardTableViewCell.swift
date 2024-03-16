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
        lbl.text = "1"
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var userImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "my-loves")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
//        iv.layer.cornerRadius = iv.frame.size.width / 2
        iv.layer.cornerRadius = 17
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let userNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Maythem Haydar"
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
//        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let pointsNumberLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "100"
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let badgeImageView1: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "badge-easy")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let badgeImageView2: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "badge-medium")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let badgeImageView3: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "badge-hard")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
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
        addSubview(badgeImageView1)
        addSubview(badgeImageView2)
        addSubview(badgeImageView3)
    }
    
    func setupTableViewCellViewsConstraints() {
        NSLayoutConstraint.activate([
            
            rankLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            rankLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            rankLabel.widthAnchor.constraint(equalToConstant: 40),
            rankLabel.heightAnchor.constraint(equalToConstant: 40),
            
            userImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            userImageView.leadingAnchor.constraint(equalTo: rankLabel.trailingAnchor, constant: 0),
            userImageView.widthAnchor.constraint(equalToConstant: 34),
            userImageView.heightAnchor.constraint(equalToConstant: 34),
            
            userNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            userNameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 10),
            userNameLabel.widthAnchor.constraint(equalToConstant: 120),
            userNameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            pointsNumberLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            pointsNumberLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -110),
            pointsNumberLabel.widthAnchor.constraint(equalToConstant: 40),
            pointsNumberLabel.heightAnchor.constraint(equalToConstant: 40),
            
            badgeImageView1.centerYAnchor.constraint(equalTo: centerYAnchor),
            badgeImageView1.leadingAnchor.constraint(equalTo: pointsNumberLabel.trailingAnchor, constant: 10),
            badgeImageView1.widthAnchor.constraint(equalToConstant: 22),
            badgeImageView1.heightAnchor.constraint(equalToConstant: 22),
            
            badgeImageView2.centerYAnchor.constraint(equalTo: centerYAnchor),
            badgeImageView2.leadingAnchor.constraint(equalTo: badgeImageView1.trailingAnchor, constant: 10),
            badgeImageView2.widthAnchor.constraint(equalToConstant: 25),
            badgeImageView2.heightAnchor.constraint(equalToConstant: 25),
            
            badgeImageView3.centerYAnchor.constraint(equalTo: centerYAnchor),
            badgeImageView3.leadingAnchor.constraint(equalTo: badgeImageView2.trailingAnchor, constant: 10),
            badgeImageView3.widthAnchor.constraint(equalToConstant: 20),
            badgeImageView3.heightAnchor.constraint(equalToConstant: 20),
        
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
