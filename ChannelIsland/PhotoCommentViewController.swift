//
//  PhotoCommentViewController.swift
//  ChannelIsland
//
//  Created by Christopher Overton on 9/8/16.
//  Copyright © 2016 Christopher Overton. All rights reserved.
//

import UIKit

class PhotoCommentViewController: UIViewController {
    var photos = ["Image-1", "Image-2", "Image-3", "Image-5", "Image-1", "Image-2", "Image-3", "Image-5","Image-1", "Image-2", "Image-3", "Image-5"]
    var captions = ["First", "Second", "Third", "Fourth", "Fifth", "Sixth", "Seventh",
                    "Eighth", "Nineth", "Tenth", "Eleventh", "Twelfth"]
    
    
    @IBOutlet weak var TitleText3: UITextField!
    @IBOutlet weak var TitleText2: UITextField!
    @IBOutlet weak var TitleText1: UITextField!
    @IBOutlet weak var pagecontrol: UIPageControl!
    @IBOutlet weak var NavigationBarImageView: UIImageView!
    
    @IBOutlet weak var Caption: UITextField!
    @IBOutlet weak var PhotoImageView: UIImageView!
    
    private var swipeState: Bool = true  //right state
    internal var photoName: String!
    internal var photoIndex: Int!
    private let revealSequeId = "revealSegue"
    private let horizontalTransitionController = HorizontalTransitionController2()
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("Got This Far!")
        print(segue.identifier)
        var checkString: String = (segue.identifier)!
        print(checkString.rangeOfString(revealSequeId) != nil)
        self.horizontalTransitionController.f1 = self.Caption.frame
        
        self.horizontalTransitionController.tv1 = self.Caption
        self.horizontalTransitionController.iv1 = self.PhotoImageView
        self.horizontalTransitionController.iv12 = self.NavigationBarImageView
        self.horizontalTransitionController.vname1 = self.captions[abs(photoIndex)]
        //self.horizontalTransitionController.iv13 = self.Clickhere
        self.horizontalTransitionController.pc = self.pagecontrol
        self.horizontalTransitionController.titletf1 = self.TitleText1
        self.horizontalTransitionController.titletf2 = self.TitleText2
        self.horizontalTransitionController.titletf3 = self.TitleText3

        if checkString.rangeOfString("reveal") != nil, let destinationViewController = segue.destinationViewController as? PhotoCommentViewController2 {
            print("Got this far again")
            destinationViewController.transitioningDelegate = self
            print("Segue2 used!")
            print("Segue2 used!")
            var dphotoIndex: Int = 0
            if checkString.rangeOfString(revealSequeId) != nil{
                dphotoIndex = (photoIndex-1)%12
                if (photoIndex == 0){
                    dphotoIndex = 11
                }
                destinationViewController.photoIndex = dphotoIndex
                destinationViewController.photoName = photos[abs(dphotoIndex)]
                self.horizontalTransitionController.vname2 = captions[abs(dphotoIndex)]
                swipeState = false
                
            }
            else{
                dphotoIndex = (photoIndex+1)%12
                destinationViewController.photoIndex = dphotoIndex
                destinationViewController.photoName = photos[abs(dphotoIndex)]
                self.horizontalTransitionController.vname2 = self.captions[abs(dphotoIndex)]
                swipeState = true
            }
            destinationViewController.loadView()
            self.horizontalTransitionController.tv2 = destinationViewController.Caption
            self.horizontalTransitionController.iv2 = destinationViewController.PhotoImageView
            self.horizontalTransitionController.iv22 = destinationViewController.NavigationBarImageView

            self.horizontalTransitionController.f2 = destinationViewController.Caption.frame

            self.horizontalTransitionController.swipeDirection = swipeState
            self.horizontalTransitionController.pc2 = destinationViewController.pagecontrol
            destinationViewController.pagecontrol.currentPage = abs(dphotoIndex)
            self.horizontalTransitionController.titletf12 = destinationViewController.TitleText1
            self.horizontalTransitionController.titletf22 = destinationViewController.TitleText2
            self.horizontalTransitionController.titletf32 = destinationViewController.TitleText3
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let photoName = photoName {
            self.PhotoImageView.image = UIImage(named: photoName)
        }
        if photoIndex != nil{
            self.Caption.text = captions[abs(photoIndex)]
            self.pagecontrol.currentPage = abs(photoIndex)
            self.TitleText1.font = UIFont(name:"TrajanPro-Regular", size: 81)
            self.TitleText2.font = UIFont(name:"TrajanPro-Regular", size: 55)
            self.TitleText3.font = UIFont(name:"TrajanPro-Regular", size: 55)
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool){
        super.viewWillAppear(animated)
        if let photoName = photoName {
            self.PhotoImageView.image = UIImage(named: photoName)
        }
        if photoIndex != nil{
            self.Caption.text = captions[abs(photoIndex)]
            self.pagecontrol.currentPage = abs(photoIndex)
            self.TitleText1.font = UIFont(name:"TrajanPro-Regular", size: 81)
            self.TitleText2.font = UIFont(name:"TrajanPro-Regular", size: 55)
            self.TitleText3.font = UIFont(name:"TrajanPro-Regular", size: 55)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prefersStatusBarHidden() -> Bool {
        return true
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

extension PhotoCommentViewController: UIViewControllerTransitioningDelegate {
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        //horizontalTransitionController.originFrame = CardView.frame
        //horizontalTransitionController.swipeDirection = self.swipeState
        return horizontalTransitionController
    }
}
