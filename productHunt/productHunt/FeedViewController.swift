//
//  FeedViewController.swift
//  productHunt
//
//  Created by MattHew Phraxayavong on 3/4/19.
//  Copyright © 2019 MattHew Phraxayavong. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var feedTableView: UITableView!
    // Array of Post objects to simulate real data coming in
    // Make sure each property that we're assigning to a UI element has a value for each mock Post.
    var posts: [Post] = [] {
        didSet {
            feedTableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        feedTableView.dataSource = self
        feedTableView.delegate = self
    
    updateFeed()
}
    func updateFeed() {
        // call our network manager's getPosts method to update our feed with posts
        networkManager.getPosts() { result in
            self.posts = result
        }
    }

}
var networkManager = NetworkManager()

// MARK: UITableViewDataSource
extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the actual number of posts we receive
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
        
        // retrieve from the actual posts, and not mock data
        let post = posts[indexPath.row]
        cell.post = post
        return cell
    }
    

}
// MARK: UITableViewDelegate
extension FeedViewController: UITableViewDelegate {
    // Code to handle cell events goes here...
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // provide a fixed size
        return 250
    }
}

