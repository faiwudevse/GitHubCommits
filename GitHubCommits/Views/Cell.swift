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
            messageLabel.text = commit?.message.trimmingCharacters(in: .whitespacesAndNewlines)
            
        }
    }
    private let authorNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Author:"
        label.translatesAutoresizingMaskIntoConstraints = false;
        return label
    }()
    
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
        // label.numberOfLines = 86
        return label
    }()
    
    private let shaLabel: UILabel = {
        let label = UILabel()
        label.text = "This is the text for the title of our book inside of our cell"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let commitNumber: UILabel = {
        let label = UILabel()
        label.text = "Commit Number:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let messageNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Message: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(authorNameLabel)
        authorNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        authorNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        authorNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addSubview(authorLabel)
        authorLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        authorLabel.leftAnchor.constraint(equalTo: authorNameLabel.rightAnchor, constant: 8).isActive = true
        authorLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        authorLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addSubview(commitNumber)
        commitNumber.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 15).isActive = true
        commitNumber.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        commitNumber.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        commitNumber.heightAnchor.constraint(equalToConstant: 20).isActive = true

        addSubview(shaLabel)
        shaLabel.topAnchor.constraint(equalTo: commitNumber.bottomAnchor, constant: 4).isActive = true
        shaLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        shaLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        shaLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        addSubview(messageNameLabel)
        messageNameLabel.topAnchor.constraint(equalTo: shaLabel.bottomAnchor, constant: 15).isActive = true
        messageNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        messageNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        messageNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        addSubview(messageLabel)
        messageLabel.numberOfLines = 88
        messageLabel.topAnchor.constraint(equalTo: messageNameLabel.bottomAnchor, constant: 4).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
