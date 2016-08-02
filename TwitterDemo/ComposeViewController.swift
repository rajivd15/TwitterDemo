//
//  ComposeViewController.swift
//  TwitterDemo
//
//  Created by Rajiv Deshmukh on 8/1/16.
//  Copyright © 2016 Rajiv Deshmukh. All rights reserved.
//

import UIKit
import AFNetworking

class ComposeViewController: UIViewController {

    @IBOutlet weak var composeUsernameLabel: UILabel!
    @IBOutlet weak var composeImageView: UIImageView!
    @IBOutlet weak var composeTwitterNameLabel: UILabel!
    
    var tweet : Tweet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        composeImageView.setImageWithURL((User.currentUser?.profileUrl)!)
        composeUsernameLabel.text = User.currentUser?.name as! String
        composeTwitterNameLabel.text = User.currentUser?.screenname as! String 
        // Do any additional setup after loading the view.
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
