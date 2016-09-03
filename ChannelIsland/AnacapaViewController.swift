//
//  AnacapaViewController.swift
//  ChannelIsland
//
//  Created by Christopher Overton on 8/30/16.
//  Copyright © 2016 Christopher Overton. All rights reserved.
//


import UIKit
class AnacapaViewController: UIViewController, UITextViewDelegate {
    
    private let revealSequeId = "revealSegue"
    private var swipeState: Bool = true  //right state
    private let horizontalTransitionController = HorizontalTransitionController()
    private let iname1 = "bar4"
    private let iname2 = "bar5"
    private let iname3 = "bar3"
    let vname: String = "Anacapa Island"
    @IBOutlet weak var Barview: UIImageView!
    @IBOutlet weak var TitleText: UITextView!
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("Got This Far!")
        print(segue.identifier)
        var checkString: String = (segue.identifier)!
        print(checkString.rangeOfString(revealSequeId) != nil)
        self.horizontalTransitionController.f1 = self.TitleText.frame
        self.horizontalTransitionController.vname1 = "Anacapa Island"
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
        if checkString.rangeOfString("revealSegue") != nil, let destinationViewController = segue.destinationViewController as? SantaCruzViewController {
            print("Got this far again")
            destinationViewController.transitioningDelegate = self
            print("Segue2 used!")
            destinationViewController.loadView()
            self.horizontalTransitionController.tv2 = destinationViewController.TitleText
            self.horizontalTransitionController.iv2 = destinationViewController.Barview
            self.horizontalTransitionController.f2 = destinationViewController.TitleText.frame
            self.horizontalTransitionController.vname2 = destinationViewController.vname
        }
        if checkString.rangeOfString("revealSeque") != nil, let destinationViewController = segue.destinationViewController as? SantaBarbaraViewController {
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

extension AnacapaViewController: UIViewControllerTransitioningDelegate {
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        //horizontalTransitionController.originFrame = CardView.frame
        //horizontalTransitionController.swipeDirection = self.swipeState
        return horizontalTransitionController
    }
}