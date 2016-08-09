//
//  ProfileViewController.swift
//  TwitterDemo
//
//  Created by Rajiv Deshmukh on 8/6/16.
//  Copyright © 2016 Rajiv Deshmukh. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var followersCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var tweetCountLabel: UILabel!
    @IBOutlet weak var screennameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    var client = TwitterClient.sharedInstance
    var userProfile: User!
    var screenName: NSString!
    var tweets = [Tweet]()


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self 

        var parameters : [String : String] = [:]
        if screenName != nil {
            parameters["screen_name"] = self.screenName as String
        } else {
            parameters["screen_name"] = User.currentUser?.screenname as? String
        }
        
        client.homeTimeline({ (data: [Tweet]) in
            self.tweets = data
            self.tableView.reloadData()
        }) { (error: NSError) in
            print("Error: \(error)")
        }
        

        client.userProfileData({ (User) in
            self.userProfile = User
            print("My name is \(self.userProfile.name)")
            print(User)
            
            self.usernameLabel.text = self.userProfile.name as? String
            self.screennameLabel.text = self.userProfile.screenname as? String
            self.profileImageView.setImageWithURL((self.userProfile.profileUrl!))
            self.followersCountLabel.text = NSString(format:"%d", self.userProfile.followersCount) as String
            self.followingCountLabel.text = NSString(format:"%d", self.userProfile.friendsCount) as String
            self.tweetCountLabel.text = NSString(format:"%d", self.userProfile.tweetsCount) as String
            
            }, failure: { (error: NSError) in
            print(error)
        }, parameters: parameters)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Table Count - \(self.tweets.count)")
        return (self.tweets.count) ?? 0
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TweetCell", forIndexPath: indexPath) as! TweetCell
        
        cell.tweetDetails = tweets[indexPath.row]
        return cell
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
