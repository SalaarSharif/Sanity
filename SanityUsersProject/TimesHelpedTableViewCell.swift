//
//  TimesHelpedTableViewCell.swift
//  SanityUsersProject
//
//  Created by MobileProg on 6/19/19.
//  Copyright © 2019 MobileProg. All rights reserved.
//

import UIKit

class TimesHelpedTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbsDownLabel: UILabel!
    @IBOutlet weak var timesHelpedLabel: UILabel!
    @IBOutlet weak var thumbsUpLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with volunteer: Volunteer) {
        
//        thumbsDownLabel.text = volunteer.thumbsDowns
//        timesHelpedLabel.text = volunteer.usersHelped
//        thumbsUpLabel.text = volunteer.thumbsUps
        
        thumbsUpLabel.value(forKey: "2")
        thumbsDownLabel.value(forKey: "1")
        timesHelpedLabel.value(forKey: "3")
        
        
    }

}
