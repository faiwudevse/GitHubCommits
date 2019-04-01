//
//  ClientConvenience.swift
//  GitHubCommits
//
//  Created by Fai Wu on 3/31/19.
//  Copyright © 2019 Fai Wu. All rights reserved.
//

import Foundation

extension Client {
    func getRepoCommits(_ completionHandlerForGetRepoCommits: @escaping (_ success: Bool, _ errorString: String?) -> Void) {
        let jsonHeader = [HTTPHeaderField.Token : HTTPHeaderFieldValue.TokenKey]
        let _ = taskForGetMethod(Constants.GithubHost, Methods.TwitterBookkeeperCommits, jsonHeader as [String : AnyObject]) { (results , error) in
            if let error = error {
                completionHandlerForGetRepoCommits(false, error.localizedDescription)
            } else {
                completionHandlerForGetRepoCommits(true, nil)
                guard let commitsDict = results as? [[String: AnyObject]] else {
                    self.errorNotAbleToParse()
                    return
                }

                for commitRecord in commitsDict {
                    guard let sha = commitRecord[JSONResponseKeys.Sha] as? String else {
                        self.errorCanNotBeFound(JSONResponseKeys.Sha, commitRecord)
                        return
                    }
                    print(sha)

                    guard let commit = commitRecord[JSONResponseKeys.Commit] as? [String : AnyObject] else {
                        self.errorCanNotBeFound(JSONResponseKeys.Commit, commitRecord)
                        return
                    }

                    guard let author = commit[JSONResponseKeys.Author] as? [String: AnyObject] else {
                        self.errorCanNotBeFound(JSONResponseKeys.Author, commit)
                        return
                    }
                    
                    guard let name = author[JSONResponseKeys.Name] as? String else {
                        self.errorCanNotBeFound(JSONResponseKeys.Name, author)
                        return
                    }
                    
                    print(name)

                    guard let message = commit[JSONResponseKeys.Message] as? String else {
                        self.errorCanNotBeFound(JSONResponseKeys.Message, commit)
                        return
                    }
                    print(message)
                }
            }
        }
    }
    
    private func errorNotAbleToParse() -> Void {
        print("Not able to parse the data")
    }
    
    private func errorCanNotBeFound(_ key: String , _ result: [String :AnyObject]) -> Void {
        print("Cannot find \(key) in \(result)")
    }
}
