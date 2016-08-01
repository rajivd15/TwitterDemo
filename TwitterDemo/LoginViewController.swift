//
//  LoginViewController.swift
//  TwitterDemo
//
//  Created by Rajiv Deshmukh on 7/30/16.
//  Copyright © 2016 Rajiv Deshmukh. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLoginButton(sender: AnyObject) {
        
        let twitterClient = BDBOAuth1SessionManager(baseURL: NSURL(string: "https://api.twitter.com"), consumerKey: "oteay9i7cT9B83aBNl0R8EMId", consumerSecret: "8o0DB6lkjHanxpASbZyGWQ07vXPZSUg5julAwuZMAfpQQoxjiV")
        
        //Clears Keychain for any previous sessions.
        twitterClient.deauthorize()
        
        twitterClient.fetchRequestTokenWithPath("oauth/request_token", method: "GET", callbackURL: NSURL(string: "mytwitterdemo://oauth"), scope: nil, success: { (requestToken : BDBOAuth1Credential!) -> Void in
            print("I got the token")
            
            let url = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken.token)")!
            UIApplication.sharedApplication().openURL(url)
        }) { (error: NSError!) in
            print("Error =  \(error.localizedDescription)")
        }
        
        
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