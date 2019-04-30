//
//  CommentTableViewCell.swift
//  productHunt
//
//  Created by MattHew Phraxayavong on 4/29/19.
//  Copyright © 2019 MattHew Phraxayavong. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var commentTextView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
