//
//  MenuViewController.swift
//  TwitterDemo
//
//  Created by Rajiv Deshmukh on 8/6/16.
//  Copyright © 2016 Rajiv Deshmukh. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private var tweetViewViewControler: UIViewController!
    private var profileViewControler: UIViewController!
    
    var viewControllers: [UIViewController] = []
    var hamburgerViewController: HamburgerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        tweetViewViewControler = storyboard.instantiateViewControllerWithIdentifier("TweetNavigationController")
        profileViewControler = storyboard.instantiateViewControllerWithIdentifier("ProfileNavigationController")
        
        viewControllers.append(tweetViewViewControler)
        viewControllers.append(profileViewControler)
        
        hamburgerViewController.contentViewController = tweetViewViewControler

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuCell", forIndexPath: indexPath) as! MenuCell
        
        let titles = ["Home", "Profile"]
        cell.menuTitleLabel.text = titles[indexPath.row]
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        hamburgerViewController.contentViewController = viewControllers[indexPath.row]
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "profileViewSegue" {
//            
//            print("prepare for for profile view")
//        
//            let profileViewController = segue.destinationViewController as! ProfileViewController
//            profileViewController.screenName = User.currentUser!.screenname
//        }
//        
//    }
}
