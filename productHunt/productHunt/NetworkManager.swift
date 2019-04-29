//
//  NetworkManager.swift
//  productHunt
//
//  Created by MattHew Phraxayavong on 4/29/19.
//  Copyright © 2019 MattHew Phraxayavong. All rights reserved.
//

import Foundation

class NetworkManager {
    // shared singleton session object used to run tasks. Will be useful later
    let urlSession = URLSession.shared
    
    var baseURL = "https://api.producthunt.com/v1/"
    var token = "52a5221cba795ad8501e70990e21a0b025138c49e8dcce6400737c03a17f55fe"
    
    
    
    func getPosts(completion: @escaping ([Post]) -> Void) {
        
        // our API query
        let query = "posts/all?sort_by=votes_count&order=desc&search[featured]=true&per_page=20"
        // Add the baseURL to it
        let fullURL = URL(string: baseURL + query)!
        // Create the request
        var request = URLRequest(url: fullURL)
        
        // We're sending a GET request, so we need to specify that
        request.httpMethod = "GET"
        // Add in all the header fields just like we did in Postman
        request.allHTTPHeaderFields = [
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer \(token)",
            "Host": "api.producthunt.com"
        ]
        
        let task = urlSession.dataTask(with: request) { data, response, error in
            // error check/handling
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            // make sure we get back data
            guard let data = data else {
                return
            }
            // Decode the API response into our PostList object that we can use/interact with
            guard let result = try? JSONDecoder().decode(PostList.self, from: data) else {
                return
            }
            let posts = result.posts
            
            // Return the result with the completion handler.
            DispatchQueue.main.async {
                completion(posts)
            }
            
        }
        task.resume()
    }
    
    
    
    
    
    
    
    
    
}