//
//  TweetDetailViewController.swift
//  TwitterDemo
//
//  Created by Rajiv Deshmukh on 8/1/16.
//  Copyright © 2016 Rajiv Deshmukh. All rights reserved.
//

import UIKit
import AFNetworking

class TweetDetailViewController: UIViewController {

    var tweet: Tweet!
    @IBOutlet weak var detailUserNameLabel: UILabel!
    @IBOutlet weak var detailTimestamp: UILabel!
    @IBOutlet weak var detailTweetTextLabel: UILabel!
    @IBOutlet weak var detailScreenNameLabel: UILabel!
    @IBOutlet weak var detailProfileImageVIew: UIImageView!
    @IBOutlet weak var detailReTweetCountLabel: UILabel!
    @IBOutlet weak var userRetweetNameLabel: UILabel!
    @IBOutlet weak var detailFavotitesCountLabel: UILabel!

    @IBOutlet weak var detailFavoritesCountLabel: UILabel!
    override func viewDidLoad() {
       
        super.viewDidLoad()
        self.navigationController!.navigationBar.topItem!.title = "Home"
        print(tweet.text)

        detailUserNameLabel.text = tweet.user!.name as? String
        detailTweetTextLabel.text = tweet.text as? String
        detailScreenNameLabel.text = tweet.user!.screenname as? String
        detailProfileImageVIew.setImageWithURL(tweet.user!.profileUrl!)
        detailFavoritesCountLabel.text = NSString(format:"%d", tweet.favoritesCount) as String
        detailReTweetCountLabel.text = NSString(format:"%d", tweet.retweetCount) as String
 
       
        
        if tweet.timestamp != nil {
            let formatter = NSDateFormatter()
            formatter.dateFormat = "EEE MMM d"
            let time  = formatter.stringFromDate(tweet.timestamp!)
            detailTimestamp.text = time        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
