//
//  Tweet.swift
//  TwitterDemo
//
//  Created by Rajiv Deshmukh on 7/31/16.
//  Copyright © 2016 Rajiv Deshmukh. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    
    var text: String?
    var timestamp: NSDate?
    var retweetCount: Int = 0
    var favoritesCount: Int = 0
    var userName: String?
    var twitterName: String?
    var profileImageUrl: NSURL?
    
    init(dictionary: NSDictionary) {
        text = dictionary["text"] as? String
        
        let user = dictionary["user"] as? NSDictionary
        userName = user!["name"] as? String
        twitterName = user!["screen_name"] as? String

        let imageUrlString = user!["profile_image_url"] as? String
        if imageUrlString != nil {
            profileImageUrl = NSURL(string: imageUrlString!)
        } else {
            profileImageUrl = nil
        }

        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        favoritesCount = (dictionary["favorites_count"] as? Int) ?? 0
        
        let timestampString = dictionary["created_at"] as? String
        if let timestampString = timestampString {
            let formatter = NSDateFormatter()
            formatter.dateFormat = "EEE MMM d HH:MM:SS Z y"
            timestamp = formatter.dateFromString(timestampString)
        }
    }
   
    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet] {
        
        var tweets = [Tweet]()
        for dictionary in dictionaries {
            let tweet = Tweet(dictionary: dictionary)
            tweets.append(tweet)
        }
        return tweets
    }
}



