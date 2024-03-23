//
//  LeaderboardView.swift
//  GeoWhiz Quiz
//
//  Created by Hassan Mayers on 27/2/24.
//

import UIKit

class LeaderboardView: UIView {
    
    var users: [QuizUser] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.register(LeaderboardTableViewCell.self, forCellReuseIdentifier: LeaderboardTableViewCell.identifier)
        tv.delegate = self
        tv.dataSource = self
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTableView() {
        self.backgroundColor = .clear
        tableView.separatorInset = .zero
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
    }
    
    public func modifyTableView(with uiViewController: UIViewController) {
        tableView.delegate = uiViewController as? any UITableViewDelegate
        tableView.dataSource = uiViewController as? any UITableViewDataSource
        tableView.reloadData()
    }
    
    public func reloadTableViewData() {
        tableView.reloadData()
    }
}

extension LeaderboardView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LeaderboardTableViewCell.identifier, for: indexPath) as! LeaderboardTableViewCell
        let user = users[indexPath.row]
        
        cell.setLeaderboardComponents(rank: "\(indexPath.row + 1)", imageURL: user.googlePhoto, username: user.googleUsername, points: "\(user.bestTotalQuizPoints)", easyQuizBadge: user.easyQuizReward ?? "", mediumQuizBadge: user.mediumQuizReward ?? "", hardQuizBadge: user.hardQuizReward ?? "")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
