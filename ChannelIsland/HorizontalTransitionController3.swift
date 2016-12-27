//
//  HorizontalTransitionController3.swift
//  ChannelIsland
//
//  Created by Christopher Overton on 12/26/16.
//  Copyright © 2016 Christopher Overton. All rights reserved.
//
//island photo comment view transition controller

import Foundation
import UIKit

class HorizontalTransitionController3: NSObject, UIViewControllerAnimatedTransitioning {
    var swipeDirection: Bool = false  //left
    var originFrame = CGRectZero
    var iname1: String = ""
    var iname2: String = ""
    var f1: CGRect!
    var f2: CGRect!
    var vname1: String!
    var vname2: String!
    //var tv1: UITextField!
    //var tv2: UITextField!
    var titletf1: UITextField!
    var titletf2: UITextField!
    var titletf3: UITextField!
    var titletf12: UITextField!
    var titletf22: UITextField!
    var titletf32: UITextField!
    var iv1: UIImageView!
    var iv2: UIImageView!
    var iv12: UIImageView!
    var iv22: UIImageView!
    var iv13: UIImageView!
    var iv23: UIImageView!
    var btn1: UIButton!
    var btn2: UIButton!
    var pc: UIPageControl!
    var pc2: UIPageControl!
    var tv1: UITextView!
    var tv2: UITextView!
    var tfarr: [UITextField]!
    var tfarr2: [UITextField]!
    var imageArray: [UIImage] = []
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 1.0
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        // get reference to our fromView, toView and the container view that we should perform the transition in
        let container = transitionContext.containerView()
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        let customView1 = MyCustomView(frame: CGRect(x: 0, y: 0, width: 1024, height: 768))
        //customView1.addImageV(iname1)
        
        //customView1.addTitleV( f1, title: vname1)
        customView1.addTextView(tv1)
        let customView2 = MyCustomView(frame: CGRect(x: 0, y: 0, width: 1024, height: 768))
        //customView2.addImageV(iname2)
        //customView2.addTitleV(f2, title: vname2)
        customView2.addTextView(tv2)
        let customView3 = MyCustomView(frame: CGRect(x: 0, y: 0, width: 1024, height: 768))
        customView3.addImageV2("IslandIcons_Photo_Gallery_V02")
        //customView3.addTitleV(titletf1)
        //customView3.addTitleV(titletf2)
        //customView3.addTitleV(titletf3)
        for tfi in tfarr{
            customView3.addTitleV(tfi)
        }
        let customView4 = MyCustomView(frame: CGRect(x: 0, y: 0, width: 1024, height: 768))
        //customView4.addImageAnimV("TAP_HERE_V01_LOOP_")
        customView4.addPageControl(pc)
        let customView5 = MyCustomView(frame: CGRect(x: 0, y: 0, width: 1024, height: 768))
        customView5.addPageControl(pc2)
        customView5.alpha = 0
        //self.iv23.animationImages = customView4.imageArray
        //self.iv23.animationDuration = 2.0
        //self.iv23.startAnimating()
        customView2.alpha = 0
        self.tv1.hidden = true
        //self.iv1.hidden = true
        self.tv2.hidden = true
        //self.iv2.hidden = true
        self.iv12.hidden = true
        self.iv22.hidden = true
        self.pc.hidden = true
        self.pc2.hidden = true
        //self.titletf1.hidden = true
        //self.titletf2.hidden = true
        //self.titletf3.hidden = true
        //self.titletf12.hidden = true
        //self.titletf22.hidden = true
        //self.titletf32.hidden = true
        for tfi in tfarr{
            tfi.hidden = true
        }
        for tfi in tfarr2{
            tfi.hidden = true
        }
        //self.iv13.hidden = true
        //self.iv23.hidden = true
        //self.iv23.alpha = 1
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
        container!.addSubview(customView3)
        container!.addSubview(customView4)
        container!.addSubview(customView5)
        
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
            //customView4.alpha = 0
            customView2.alpha = 1
            customView4.alpha = 0
            customView5.alpha = 1
            
            }, completion: { finished in
                
                // tell our transitionContext object that we've finished animating
                customView1.hidden = true
                customView2.hidden = true
                customView3.hidden = true
                customView4.hidden = true
                customView5.hidden = true
                self.tv2.hidden = false
                //self.iv2.hidden = false
                self.iv12.hidden = false
                self.iv22.hidden = false
                self.pc.hidden = false
                self.pc2.hidden = false
                //self.titletf1.hidden = false
                //self.titletf2.hidden = false
                //self.titletf3.hidden = false
                //self.titletf12.hidden = false
                //self.titletf22.hidden = false
                //self.titletf32.hidden = false
                for tfi in self.tfarr{
                    tfi.hidden = false
                }
                for tfi in self.tfarr2{
                    tfi.hidden = false
                }
                //self.iv13.hidden = false
                //self.iv23.hidden = false
                
                transitionContext.completeTransition(true)
                /*
                 UIView.animateWithDuration(2.0, delay: 0.0, options:[], animations: {
                 self.iv23.alpha = 1
                 }, completion: { finished in if (finished){transitionContext.completeTransition(true)}
                 })*/
                
        })
        
        
    }
}