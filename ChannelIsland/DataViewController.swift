//
//  DataViewController.swift
//  ChannelIsland
//
//  Created by Christopher Overton on 7/31/16.
//  Copyright © 2016 Christopher Overton. All rights reserved.
//

import UIKit

class DataViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var TextView: UITextView!
    @IBOutlet weak var IView2: UIImageView!
    @IBOutlet weak var InfoButton: UIButton!
    @IBOutlet weak var SantaBarbaraButton: UIButton!
    @IBOutlet weak var AnacapaButton: UIButton!
    @IBOutlet weak var SantaCruzButton: UIButton!
    @IBOutlet weak var SantaRosaButton: UIButton!
    @IBOutlet weak var SanMigButton: UIButton!
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var IView: UIImageView!
    @IBOutlet var MView: UIView!
    @IBOutlet weak var dataLabel: UILabel!
    var dataObject: String = ""
    //var lightBlur: UIBlurEffect
    //var blurView: UIVisualEffectView

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.ScrollView.contentSize.height = 1000
        self.ScrollView.hidden = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //self.dataLabel!.text = dataObject
    }
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    @IBAction func infoClick(sender: AnyObject) {
        self.ScrollView.hidden = false
        UIView.animateWithDuration(2.0, delay: 0.0, options: .CurveEaseOut, animations: {
            self.IView.alpha = 0
            self.ScrollView.alpha = 1
            self.IView2.alpha = 1
            }, completion: { finished in
                if (finished){
                    self.IView.hidden = true
                }
        })
        print("Info Button Pressed")
    }
}

