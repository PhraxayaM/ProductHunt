//
//  CommentsViewController.swift
//  productHunt
//
//  Created by MattHew Phraxayavong on 4/29/19.
//  Copyright © 2019 MattHew Phraxayavong. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {

    var comments: [String]! {
        didSet {
            // TODO: fill in later when we have real data
        }
    }
    
    @IBOutlet weak var commentsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commentsTableView.dataSource = self
        commentsTableView.delegate = self
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
// MARK: UITableViewDatasource
extension CommentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as! CommentTableViewCell
        
        let comment = comments[indexPath.row]
        cell.commentTextView.text = comment
        return cell
    }
}

// MARK: UITableViewDelegate
extension CommentsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}
