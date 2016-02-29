//
//  SearchViewController.swift
//  assignment4
//
//  Created by Diandian Xiao on 2/26/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var loadingImageView: UIImageView!
    
    
    var loading1: UIImage!
    var loading2: UIImage!
    var loading3: UIImage!

    var images: [UIImage]!
    var animatedImage: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        loading1 = UIImage(named: "loading-1")
        loading2 = UIImage(named: "loading-2")
        loading3 = UIImage(named: "loading-3")

        images = [loading1, loading2, loading3]
        animatedImage = UIImage.animatedImageWithImages(images, duration: 1.0)

        
        loadingImageView.image = animatedImage

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        imageView.hidden = true
        loadingImageView.hidden = false
        
    }
    
    override func viewDidAppear(animated: Bool) {
        delay(3) {
            self.loadingImageView.hidden = true
            self.imageView.hidden = false
        }
        
    }

    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }


}
