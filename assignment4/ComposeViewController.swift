//
//  ComposeViewController.swift
//  assignment4
//
//  Created by Diandian Xiao on 2/26/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    
    @IBOutlet var icons: [UIImageView]!


    //TODO: nevermind
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        for icon in icons {
            
            UIView.animateWithDuration(0.6, delay: NSTimeInterval(drand48()/3), options: [], animations: { () -> Void in
                icon.center = CGPoint (x: icon.center.x, y: icon.center.y - 480)
                }, completion: { (Bool) -> Void in
            })
        }

    }
    
    override func viewWillAppear(animated: Bool) {
        // do stuff
        
        for icon in icons {
            icon.center = CGPoint (x: icon.center.x, y: icon.center.y + 480)
        }

    }
    
    override func viewWillDisappear(animated: Bool) {
        for icon in icons {
            
            UIView.animateWithDuration(0.6, delay: NSTimeInterval(drand48()/3), options: [], animations: { () -> Void in
                icon.center = CGPoint (x: icon.center.x, y: icon.center.y - 480)
                }, completion: { (Bool) -> Void in
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressNevermind(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
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
