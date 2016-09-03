//
//  HorizontalTransitionController.swift
//  ChannelIsland
//
//  Created by Christopher Overton on 8/29/16.
//  Copyright © 2016 Christopher Overton. All rights reserved.
//

import Foundation



import UIKit

class HorizontalTransitionController: NSObject, UIViewControllerAnimatedTransitioning {
    var swipeDirection: Bool = false  //left
    var originFrame = CGRectZero
    var iname1: String = ""
    var iname2: String = ""
    var f1: CGRect!
    var f2: CGRect!
    var vname1: String!
    var vname2: String!
    var tv1: UITextView!
    var tv2: UITextView!
    var iv1: UIImageView!
    var iv2: UIImageView!
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 1.0
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        // get reference to our fromView, toView and the container view that we should perform the transition in
        let container = transitionContext.containerView()
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        var customView1 = MyCustomView(frame: CGRect(x: 0, y: 0, width: 1024, height: 768))
        customView1.addImageV(iname1)
        customView1.addTitleV( f1, title: vname1)
        var customView2 = MyCustomView(frame: CGRect(x: 0, y: 0, width: 1024, height: 768))
        customView2.addImageV(iname2)
        customView2.addTitleV(f2, title: vname2)
        customView2.alpha = 0
        self.tv1.hidden = true
        self.iv1.hidden = true
        self.tv2.hidden = true
        self.iv2.hidden = true
        // set up from 2D transforms that we'll use in the animation
        let offScreenRight = CGAffineTransformMakeTranslation(container!.frame.width, 0)
        let offScreenLeft = CGAffineTransformMakeTranslation(-container!.frame.width, 0)
        print("Implementing transition")
        print("swipeDirection:")
        print(self.swipeDirection)
        // start the toView to the right of the screen
        toView.transform = offScreenRight
        if !self.swipeDirection{
            toView.transform = offScreenLeft
        }
        else{
            toView.transform = offScreenRight
        }
        // add the both views to our view controller

        container!.addSubview(toView)
        container!.addSubview(fromView)
        container!.addSubview(customView1)
        container!.addSubview(customView2)
        
        // get the duration of the animation
        // DON'T just type '0.5s' -- the reason why won't make sense until the next post
        // but for now it's important to just follow this approach
        let duration = self.transitionDuration(transitionContext)
        
        // perform the animation!
        // for this example, just slid both fromView and toView to the left at the same time
        // meaning fromView is pushed off the screen and toView slides into view
        // we also use the block animation usingSpringWithDamping for a little bounce
        UIView.animateWithDuration(duration, delay: 0.0, options:[], animations: {
            //fromView.transform = offScreenLeft
            if !self.swipeDirection{
                fromView.transform = offScreenRight
            }
            else{
                fromView.transform = offScreenLeft
            }
            
            toView.transform = CGAffineTransformIdentity
            customView1.alpha = 0
            customView2.alpha = 1
            }, completion: { finished in
                
                // tell our transitionContext object that we've finished animating
                customView1.hidden = true
                customView2.hidden = true
                self.tv2.hidden = false
                self.iv2.hidden = false
                
                transitionContext.completeTransition(true)
                
        })

        
    }
}