//
//  Comment.swift
//  productHunt
//
//  Created by MattHew Phraxayavong on 4/30/19.
//  Copyright © 2019 MattHew Phraxayavong. All rights reserved.
//

import Foundation


struct Comment: Decodable {
    let id: Int
    let body: String
}

struct CommentApiResponse: Decodable {
    let comments: [Comment]
}
