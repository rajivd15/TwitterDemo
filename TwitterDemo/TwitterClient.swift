//
//  TwitterClient.swift
//  TwitterDemo
//
//  Created by Rajiv Deshmukh on 7/31/16.
//  Copyright © 2016 Rajiv Deshmukh. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class TwitterClient: BDBOAuth1SessionManager {

    static let sharedInstance = TwitterClient(baseURL: NSURL(string: "https://api.twitter.com"), consumerKey: "oteay9i7cT9B83aBNl0R8EMId", consumerSecret: "8o0DB6lkjHanxpASbZyGWQ07vXPZSUg5julAwuZMAfpQQoxjiV")
    
    var loginSuccess: (() -> ())?
    var loginFailure: ((NSError) -> ())?
    
    func homeTimeline(success: ([Tweet]) -> (), failure: (NSError) -> ()) {
    
        //GET twitter client home timeline
        GET("1.1/statuses/home_timeline.json", parameters: nil, progress: nil, success: { (task : NSURLSessionDataTask, response: AnyObject?) in
            
            let dictionaries = response as! [NSDictionary]
            let tweets = Tweet.tweetsWithArray(dictionaries)
//            for tweet in tweets {
//                print("\(tweet.text)")
//            }
            
            success(tweets)
            }, failure: { (task: NSURLSessionDataTask?, error: NSError) in
                failure(error)
        })
    }
    
    func currentAccount() {
        //GET Call for Verifying User Credentials.
        GET("1.1/account/verify_credentials.json", parameters: nil, progress: nil, success: { (task: NSURLSessionDataTask, response: AnyObject?) in
            //     print("response: - \(response)")
            let userDictionary = response as! NSDictionary
            let user = User(dictionary: userDictionary)
            print("UserName is - \(user.name)")
        }) { (task: NSURLSessionDataTask?, error: NSError) in
            print("Error In GET - \(error)")
        }
    }
    
    func login(success: ()->(), failure: (NSError)->()) {
        
        loginSuccess = success
        loginFailure = failure
        
        TwitterClient.sharedInstance.deauthorize()
        
        TwitterClient.sharedInstance.fetchRequestTokenWithPath("oauth/request_token", method: "GET", callbackURL: NSURL(string: "mytwitterdemo://oauth"), scope: nil, success: { (requestToken : BDBOAuth1Credential!) -> Void in
            print("I got the token")
            
            let url = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken.token)")!
            UIApplication.sharedApplication().openURL(url)
        }) { (error: NSError!) in
            print("Error =  \(error.localizedDescription)")
            self.loginFailure?(error)
        }
    }
    
    func handleOpenUrl(url: NSURL) {
        
        let requestToken = BDBOAuth1Credential(queryString: url.query)
        
        //Fetch the API Access Token and then Access other REST API.
        fetchAccessTokenWithPath("oauth/access_token", method: "POST", requestToken: requestToken, success: { (accessToken: BDBOAuth1Credential!) -> Void in
            print("I got the access Token - delegate- \(accessToken.token)")
            
            self.loginSuccess?()
        }) { (error: NSError!) in
            print("ERROR \(error.localizedDescription)")
            self.loginFailure?(error)
        }

    }
}
