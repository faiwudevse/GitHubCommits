//
//  Cell.swift
//  GitHubCommits
//
//  Created by Fai Wu on 3/31/19.
//  Copyright © 2019 Fai Wu. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    
    var commit: Commit? {
        didSet {
            authorLabel.text = commit?.authorName
            shaLabel.text = commit?.shaNumber
            messageLabel.text = commit?.message
            
        }
    }
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.text = "This is the text for the title of our book inside of our cell"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "This is the text for the title of our book inside of our cell"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let shaLabel: UILabel = {
        let label = UILabel()
        label.text = "This is the text for the title of our book inside of our cell"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(authorLabel)
        authorLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        authorLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        authorLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        authorLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addSubview(shaLabel)
        shaLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 4).isActive = true
        shaLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 3).isActive = true
        shaLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -3).isActive = true
        shaLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        addSubview(messageLabel)
        messageLabel.topAnchor.constraint(equalTo: shaLabel.bottomAnchor, constant: 4).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 3).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -3).isActive = true
        messageLabel.heightAnchor.constraint(equalToConstant: 90).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
