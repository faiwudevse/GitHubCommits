//
//  ViewController.swift
//  GitHubCommits
//
//  Created by Fai Wu on 3/31/19.
//  Copyright © 2019 Fai Wu. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(Cell.self, forCellReuseIdentifier: "cellId")
        
        navigationItem.title = "Twitter Bookkeeper commits"
        
        // Do any additional setup after loading the view, typically from a nib.

        loadCommitsData()
    }
    
    func loadCommitsData() {
        Client.sharedInstance().getRepoCommits { (success, error) in
            performUIUpdatesOnMain {
                if success {
                    print("sucess")
                    self.tableView.reloadData()
                } else {
                    print("fail")
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! Cell
        
        let commit = Client.sharedInstance().commitArrayData[indexPath.row]
        cell.commit = commit
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Client.sharedInstance().commitArrayData.count
    }
}

