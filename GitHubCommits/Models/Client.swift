//
//  Client.swift
//  GitHubCommits
//
//  Created by Fai Wu on 3/31/19.
//  Copyright © 2019 Fai Wu. All rights reserved.
//

import Foundation

class Client : NSObject {
    
    // MARK: Properties
    var session = URLSession.shared
    
    var commitArrayData: [Commit] = []
    // MARK: Intializers
    
    override init() {
        super.init()
    }
    
    func taskForGetMethod(_ domain: String, _ method: String, _ jsonHead: [String: AnyObject], _ completionHandlerForGET: @escaping (_ result: AnyObject?, _ error: NSError?) -> Void) -> URLSessionTask {
        let request = NSMutableURLRequest(url: urlFromParameters(domain, method))
        for(key, value) in jsonHead{
            request.addValue(value as! String , forHTTPHeaderField: key)
        }
        
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            func sendError(_ error: String) {
                print(error)
                let userInfo = [NSLocalizedDescriptionKey : error]
                completionHandlerForGET(nil, NSError(domain: "taskForGETMethod", code: 1, userInfo: userInfo))
            }
            
            /* GUARD: Was there an error? */
            guard (error == nil) else {
                sendError("There was an error with your request: \(error!)")
                return
            }
            
            /* GUARD: Did we get a successful 2XX response? */
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
                sendError("Your request returned a status code other than 2xx!")
                return
            }
            
            /* GUARD: Was there any data returned? */
            guard let data = data else {
                sendError("No data was returned by the request!")
                return
            }
            
            self.convertDataWithCompletionHandler(data, completionHandlerForGET)
            
        }
        task.resume()
        return task
    }
    
    // MARK: Shared Instance
    
    class func sharedInstance() -> Client {
        struct Singleton {
            static var sharedInstance = Client()
        }
        return Singleton.sharedInstance
    }
    
    private func urlFromParameters(_ domain: String, _ withPathExtension: String? = nil) -> URL {
        var components = URLComponents()
        components.scheme = Constants.ApiScheme
        components.host = Constants.GithubHost
        components.path = (withPathExtension ?? "")
        return components.url!
    }
    
    private func convertDataWithCompletionHandler(_ data: Data, _ completionHandlerForConvertData: (_  result: AnyObject?, _ error: NSError?) -> Void) {
        var newData = data
        var parsedResult: AnyObject! = nil
        do {
            parsedResult = try JSONSerialization.jsonObject(with: newData, options: .allowFragments) as AnyObject
        } catch {
            let userInfo = [NSLocalizedDescriptionKey : "Could not parse the data as JSON: '\(data)'"]
            completionHandlerForConvertData(nil, NSError(domain: "convertDataWithCompletionHandler", code: 1, userInfo: userInfo))
        }
        
        completionHandlerForConvertData(parsedResult, nil)
    }
}
