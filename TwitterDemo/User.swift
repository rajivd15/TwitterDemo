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
    
    //deserialization code.
    init(dictionary: NSDictionary) {
        
        name = dictionary["name"] as! String
        screenname = dictionary["screen_name"] as! String
        let profileUrlString = dictionary["profile_image_url_https"] as? String
        if let profileUrlString = profileUrlString {
            profileUrl = NSURL(string: profileUrlString)
        }
    }
}
