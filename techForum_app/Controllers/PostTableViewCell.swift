//
//  PostTableViewCell.swift
//  techForum_app
//
//  Created by Cenk Bahadır Çark on 22.08.2022.
//

import UIKit
import Firebase

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func deleteButtonClicked(_ sender: Any) {
    }
    
    @IBAction func favButtonClicked(_ sender: Any) {
    }
    
}
