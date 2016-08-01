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
            if tweetDetails.profileImageUrl != nil {
                profileImageView.setImageWithURL((tweetDetails.profileImageUrl!))
            }
            userNameLabel.text = tweetDetails.userName
            twitterNameLabel.text = tweetDetails.twitterName
            timestampLabel.text = tweetDetails.timestamp as? String
            tweetTextLabel.text = tweetDetails.text
            
         //   print("I am here - - - \(tweetDetails.timestamp)")
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
