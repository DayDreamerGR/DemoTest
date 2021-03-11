//
//  PostsTableViewCell.swift
//  AssignmentMediSage
//
//  Created by Ganesh Sonawane on 11/03/21.
//

import UIKit

class PostsTableViewCell: UITableViewCell {
    @IBOutlet weak var body: UILabel!
    
    var info : Posts!{
        didSet{
            body.text = info.body
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
