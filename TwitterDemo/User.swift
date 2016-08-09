//
//  User.swift
//  TwitterDemo
//
//  Created by Rajiv Deshmukh on 7/31/16.
//  Copyright © 2016 Rajiv Deshmukh. All rights reserved.
//

import UIKit

class User: NSObject {

    var name: NSString?
    var screenname: NSString?
    var profileUrl: NSURL?
    var tagline: NSString?
    var followersCount  : Int
    var friendsCount : Int
    var tweetsCount: Int
    
    static let userDidLogoutNotification = "UserDidLogout"

    var dictionary: NSDictionary?
    
    //deserialization code.
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        
        name = dictionary["name"] as! String
        screenname = dictionary["screen_name"] as! String
        let profileUrlString = dictionary["profile_image_url_https"] as? String
        if let profileUrlString = profileUrlString {
            profileUrl = NSURL(string: profileUrlString)
        }
        
        followersCount = dictionary["followers_count"] as? Int ?? 0
        friendsCount = dictionary["friends_count"] as? Int ?? 0
        tweetsCount = dictionary["statuses_count"] as? Int ?? 0
        
    }
    static var _currentUser: User?
    
    class var currentUser: User? {
        get {
            let defaults = NSUserDefaults.standardUserDefaults()
            
            if _currentUser == nil {
                let userData = defaults.objectForKey("currentUserData") as? NSData
                
                if let userData = userData {
                    let dictionary = try! NSJSONSerialization.JSONObjectWithData(userData, options: []) as! NSDictionary
                    _currentUser = User(dictionary: dictionary)
                }
            }
            
            return _currentUser
        }
        set(user) {
            _currentUser = user
            let defaults = NSUserDefaults.standardUserDefaults()
            if let user = user{
                let data = try! NSJSONSerialization.dataWithJSONObject(user.dictionary!, options: [])
                
                defaults.setObject(data, forKey: "currentUserData")
            } else {
                defaults.setObject(nil, forKey: "currentUserData")
            }
            defaults.synchronize()
        }
    }
    
}
