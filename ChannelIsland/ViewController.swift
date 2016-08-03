//
//  ViewController.swift
//  ChannelIsland
//
//  Created by Christopher Overton on 8/2/16.
//  Copyright © 2016 Christopher Overton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Properties
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var ImageView2: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.7, delay: 1.0, options: .CurveEaseOut, animations: {
            self.imageView1.alpha = 1;
            }, completion: { finished in
                print("Finished!")
        })
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
