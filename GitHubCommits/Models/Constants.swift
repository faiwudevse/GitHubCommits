//
//  Constants.swift
//  GitHubCommits
//
//  Created by Fai Wu on 3/31/19.
//  Copyright © 2019 Fai Wu. All rights reserved.
//

extension Client {
    struct Constants {
        // MARK: URLS
        static let ApiScheme = "https"
        static let GithubHost = "api.github.com"
    }
    
    struct Methods {
        static let TwitterBookkeeperCommits = "/repos/twitter/bookkeeper/commits"
    }
    
    struct JSONResponseKeys{
        static let Sha = "sha";
        static let Commit = "commit";
        static let Author = "author";
        static let Name = "name";
        static let Message = "message";
    }
    
    struct HTTPHeaderField {
        static let Token = "token"
    }
    
    struct HTTPHeaderFieldValue {
        static let TokenKey = "081d680913bf9a4cb65c1570005c81f168e8bb53"
    }
}
