//
//  HamburgerViewController.swift
//  TwitterDemo
//
//  Created by Rajiv Deshmukh on 8/6/16.
//  Copyright © 2016 Rajiv Deshmukh. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var leftMarginConstraint: NSLayoutConstraint!
    
    var contentViewController: UIViewController! {
        didSet(oldContentViewController) {
            view.layoutIfNeeded()
            
            if oldContentViewController != nil {
                oldContentViewController.willMoveToParentViewController(nil)
                oldContentViewController.view.removeFromSuperview()
                oldContentViewController.didMoveToParentViewController(nil)
            }
            
            contentViewController.willMoveToParentViewController(self)
            contentView.addSubview(contentViewController.view)
            contentViewController.didMoveToParentViewController(self)
            close()
        }
    }
    
    func close() {
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.leftMarginConstraint.constant = 0
            self.view.layoutIfNeeded()
        })
    }
    
    var originalLeftMargin: CGFloat!
    var menuViewController: UIViewController! {
        didSet(oldContentViewController) {
            view.layoutIfNeeded()
            
            if oldContentViewController != nil {
                oldContentViewController.willMoveToParentViewController(nil)
                oldContentViewController.view.removeFromSuperview()
                oldContentViewController.didMoveToParentViewController(nil)
            }
            menuViewController.willMoveToParentViewController(self)
            menuView.addSubview(menuViewController.view)
            menuViewController.didMoveToParentViewController(self)

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    // Do any additional setup after loading the view.
    @IBAction func onPanGesture(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(view)
        let velocity = sender.velocityInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            originalLeftMargin = leftMarginConstraint.constant
        } else if sender.state == UIGestureRecognizerState.Changed {
            leftMarginConstraint.constant = originalLeftMargin + translation.x
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            
            UIView.animateWithDuration(0.5, animations: {
            if velocity.x > 0 {
                self.leftMarginConstraint.constant = self.view.frame.size.width - 50
            } else {
                self.leftMarginConstraint.constant = 0
            }
                self.view.layoutIfNeeded()
            })
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
