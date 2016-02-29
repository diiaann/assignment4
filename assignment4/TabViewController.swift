//
//  TabViewController.swift
//  assignment4
//
//  Created by Diandian Xiao on 2/26/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class TabViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    var viewControllers: [UIViewController]!
    
    var fadeTransition: FadeTransition!
    
    var selectedIndex: Int = 0
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var bubbleImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController")
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController")
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController")
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController")

        viewControllers = [homeViewController, searchViewController, accountViewController, trendingViewController]
        
        buttons[selectedIndex].selected = true
        didPressTab(buttons[selectedIndex])
        
        animateBubbleDown()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animateBubbleDown(){
        UIView.animateWithDuration(0.8 ,animations: {
            self.bubbleImageView.center = CGPoint(x: self.bubbleImageView.center.x, y: self.bubbleImageView.center.y + 5)
            }, completion: { (Bool) -> Void in
                self.animateBubbleUp()
            })
        
    }
    
    func animateBubbleUp(){
        UIView.animateWithDuration(0.8, animations: {
            self.bubbleImageView.center = CGPoint(x: self.bubbleImageView.center.x, y: self.bubbleImageView.center.y - 5)
            }, completion: { (Bool) -> Void in
                self.animateBubbleDown()
            })
    }
    

    @IBAction func didPressTab(sender: UIButton) {
        //store the old index and set the new one
        let previousIndex = selectedIndex
         selectedIndex = sender.tag
        
        if (selectedIndex == 1) {
            bubbleImageView.hidden = true
        }
        if (previousIndex == 1) {
            bubbleImageView.hidden = false
        }
        
        //unselect old button, select new one
        buttons[previousIndex].selected = false
        sender.selected = true

        let previousVC = viewControllers[previousIndex]
        let vc = viewControllers[selectedIndex]
        
        previousVC.willMoveToParentViewController(nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        addChildViewController(vc)

        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        
        vc.didMoveToParentViewController(self)
        
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Access the ViewController that you will be transitioning too, a.k.a, the destinationViewController.
        var destinationViewController = segue.destinationViewController
        
        // Set the modal presentation style of your destinationViewController to be custom.
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        // Create a new instance of your fadeTransition.
        fadeTransition = FadeTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        destinationViewController.transitioningDelegate = fadeTransition
        
        // Adjust the transition duration. (seconds)
        fadeTransition.duration = 1.0
    }

}
