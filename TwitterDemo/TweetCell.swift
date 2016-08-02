//
//  TweetCell.swift
//  TwitterDemo
//
//  Created by Rajiv Deshmukh on 8/1/16.
//  Copyright © 2016 Rajiv Deshmukh. All rights reserved.
//

import UIKit
import AFNetworking

class TweetCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var twitterNameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
   
    var tweetDetails: Tweet! {
        didSet{
            if tweetDetails.user?.profileUrl != nil {
                profileImageView.setImageWithURL((tweetDetails.user?.profileUrl)!)
            }
            userNameLabel.text = tweetDetails.user!.name as? String
            twitterNameLabel.text = tweetDetails.user!.screenname as? String
            
            let formatter = NSDateFormatter()
            formatter.dateFormat = "HH:MM"
            if tweetDetails.timestamp != nil {
                let time  = formatter.stringFromDate(tweetDetails.timestamp!)
                timestampLabel.text = time
            }
            tweetTextLabel.text = tweetDetails.text as? String
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
