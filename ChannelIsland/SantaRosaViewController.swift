//
//  SantaRosaViewController.swift
//  ChannelIsland
//
//  Created by Christopher Overton on 8/30/16.
//  Copyright © 2016 Christopher Overton. All rights reserved.
//


import UIKit
class SantaRosaViewController: UIViewController, UITextViewDelegate {
    @IBOutlet var LeftSwipe: UISwipeGestureRecognizer!
    @IBOutlet var RightSwipe: UISwipeGestureRecognizer!
    @IBOutlet weak var TitleText: UITextView!
    private let revealSequeId = "revealSegue"
    @IBOutlet weak var Barview: UIImageView!
    private var swipeState: Bool = true  //right state
    private let horizontalTransitionController = HorizontalTransitionController()
    private let iname1 = "bar2"
    private let iname2 = "bar3"
    private let iname3 = "bar1"
    internal let ttframe: CGRect = CGRect(x: 13, y: 23, width: 333, height: 84)
    internal let vname: String = "Santa Rosa Island"
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("Got This Far!")
        print(segue.identifier)
        var checkString: String = (segue.identifier)!
        print(checkString.rangeOfString(revealSequeId) != nil)
        self.horizontalTransitionController.f1 = self.TitleText.frame
        self.horizontalTransitionController.vname1 = "Santa Rosa Island"
        self.horizontalTransitionController.tv1 = self.TitleText
        self.horizontalTransitionController.iv1 = self.Barview
        if checkString.rangeOfString("Segue") != nil{
            self.horizontalTransitionController.swipeDirection = false
            self.horizontalTransitionController.iname1 = iname1
            self.horizontalTransitionController.iname2 = iname3
        }
        else{
            print("hit Seque")
            self.horizontalTransitionController.swipeDirection = true
            self.horizontalTransitionController.iname1 = iname1
            self.horizontalTransitionController.iname2 = iname2
        }
        if checkString.rangeOfString("revealSegue") != nil, let destinationViewController = segue.destinationViewController as? SanMiguelViewController {
            print("Got this far again")
            destinationViewController.transitioningDelegate = self
            print("Segue2 used!")
            destinationViewController.loadView()
            self.horizontalTransitionController.tv2 = destinationViewController.TitleText
            self.horizontalTransitionController.iv2 = destinationViewController.Barview
            self.horizontalTransitionController.f2 = destinationViewController.TitleText.frame
            self.horizontalTransitionController.vname2 = destinationViewController.vname
        }
        if checkString.rangeOfString("revealSeque") != nil, let destinationViewController = segue.destinationViewController as? SantaCruzViewController {
            print("Got this far again")
            destinationViewController.transitioningDelegate = self
            print("Segue2 used!")
            destinationViewController.loadView()
            self.horizontalTransitionController.tv2 = destinationViewController.TitleText
            self.horizontalTransitionController.iv2 = destinationViewController.Barview
            self.horizontalTransitionController.f2 = destinationViewController.TitleText.frame
            self.horizontalTransitionController.vname2 = destinationViewController.vname
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func RightSwipeAction(sender: AnyObject) {
        print("updating swipe direction")
        self.horizontalTransitionController.swipeDirection = false
    }
    @IBAction func LeftSwipeAction(sender: AnyObject) {
        print("updating swipe direction")
        self.horizontalTransitionController.swipeDirection = true
        
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
}

extension SantaRosaViewController: UIViewControllerTransitioningDelegate {
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        //horizontalTransitionController.originFrame = CardView.frame
        //horizontalTransitionController.swipeDirection = self.swipeState
        return horizontalTransitionController
    }
}