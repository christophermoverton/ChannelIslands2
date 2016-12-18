//
//  SantaCruzViewController.swift
//  ChannelIsland
//
//  Created by Christopher Overton on 8/30/16.
//  Copyright © 2016 Christopher Overton. All rights reserved.
//


import UIKit
class SantaCruzViewController: UIViewController, UITextViewDelegate {
    
    private let revealSequeId = "revealSegue"
    private var swipeState: Bool = true  //right state
    private let horizontalTransitionController = HorizontalTransitionController()
    private let iname1 = "bar3"
    private let iname2 = "bar4"
    private let iname3 = "bar2"
    var imageArray: [UIImage] = []
    @IBOutlet weak var TitleText: UITextView!
    @IBOutlet weak var Barview: UIImageView!
    let vname: String = "Santa Cruz Island"
    @IBOutlet weak var Logoview: UIImageView!
    @IBOutlet weak var Clickhere: UIImageView!
    @IBOutlet weak var NavBar: UIImageView!
    @IBOutlet weak var IView: UIImageView!
    @IBOutlet weak var IView2: UIImageView!
    @IBOutlet weak var CloseTV: UITextView!
    @IBOutlet weak var InfoButton: UIButton!
    @IBOutlet weak var AnchorageButton: UIButton!
    @IBOutlet weak var ActivitiesButton: UIButton!
    @IBOutlet weak var DismissPage: UIButton!
    @IBOutlet weak var ActivitiesBar: UIImageView!
    private var infoActive: Bool = false
    private var anchorageActive: Bool = false
    private var activitiesActive: Bool = false
    @IBOutlet weak var PageScrollView: UIScrollView!
    @IBOutlet weak var PageTextView: UITextView!
    @IBOutlet weak var PageIV1: UIImageView!
    @IBOutlet weak var PageIV2: UIImageView!
    @IBOutlet weak var PageIV3: UIImageView!
    @IBOutlet weak var PageIV4: UIImageView!
    @IBOutlet weak var PageIV5: UIImageView!
    @IBOutlet weak var PageIV6: UIImageView!
    private var pageIVs: [UIImageView!] = []
    private var capPagTVs: [UITextView!] = []
    @IBOutlet weak var CapPagTV1: UITextView!
    @IBOutlet weak var CapPagTV2: UITextView!
    @IBOutlet weak var CapPagTV3: UITextView!
    @IBOutlet weak var CapPagTV4: UITextView!
    @IBOutlet weak var CapPagTV5: UITextView!
    @IBOutlet weak var CapPagTV6: UITextView!
    private var Anchoragestextstrings: [String] = ["ANCHORAGES\n\n","Santa Cruz offers several anchorages around the island. Going ashore on the Nature Conservancy property requires a permit.\n\nPlease note: there are no public moorings or all-weather anchorages on any of the Channel Islands. It is recommended that one capable person stay on board at all times. Boaters are responsible for any damage to the resources caused by their boat.\n\n","Prisoner’s Pier\n","Prisoner’s Pier is an excellent anchorage on relatively calm days. Going ashore is easiest west of the pier. Swells can wrap around the point, which makes sleeping onboard difficult.\n\n","Scorpion’s Bay\n","Little Scorpion Anchorage is the primary overnight anchorage. It often affords protection from prevailing westerlies, but the swell can make for rough and sleepless nights.\n\nThe shore near Scorpion Ranch offers two anchorages. Ferry operators use the western anchorage closer to the pier. Often without breaking surf, this is one of the few easy places to go ashore.\n\n","Smuggler’s Cove\n","The anchorage at Smuggler’s Cove is often exposed to prevailing westerlies and going ashore may involve breaking surf.\n\n","Pelican Bay\n","The anchorage at Pelican Bay is accessible to boaters. Going ashore requires a permit from the Nature Conservancy."]
    private var AnchoragesAttributes : [[String: AnyObject]] = [[NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSBackgroundColorAttributeName: UIColor.clearColor(),
        NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 24.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 24.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 24.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 24.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 24.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!]]
    private let photonames: [String] = ["PRISONERS_HARBOR","SCORPION_BAY_PIER","SCORPION_BAY_ANCHORAGES","AERIAL_SMUG","PELICAN_BAY_BOATERS","AERIAL_PELICAN"]
    
    private var AnchoragesCaptiontextstrings: [String] = ["Prisoner’s Harbor Pier, Santa Cruz Island","Scorpion Bay pier on Santa Cruz Island","Scorpion Bay anchorages, Santa Cruz Island","Aerial of anchorage at Smugglers’ Cove, Santa Cruz Island","Boaters at anchor in Pelican Bay, Santa Cruz Island","Aerial view of Pelican Bay, Santa Cruz Island"]
    private var AnchoragesCaptionAttributes : [[String: AnyObject]] =
        [[NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 16.0)!],
         [NSForegroundColorAttributeName: UIColor.whiteColor(),NSBackgroundColorAttributeName: UIColor.clearColor(),NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 16.0)!],
          [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 16.0)!],
          [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 16.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
         NSBackgroundColorAttributeName: UIColor.clearColor(),
         NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 16.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 16.0)!]
          ]
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("Got This Far!")
        print(segue.identifier)
        var checkString: String = (segue.identifier)!
        print(checkString.rangeOfString(revealSequeId) != nil)
        self.horizontalTransitionController.f1 = self.TitleText.frame
        self.horizontalTransitionController.vname1 = "Santa Cruz Island"
        self.horizontalTransitionController.tv1 = self.TitleText
        self.horizontalTransitionController.iv1 = self.Barview
        self.horizontalTransitionController.iv12 = self.Logoview
        self.horizontalTransitionController.iv13 = self.Clickhere
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
        if checkString.rangeOfString("revealSegue") != nil, let destinationViewController = segue.destinationViewController as? SantaRosaViewController {
            print("Got this far again")
            destinationViewController.transitioningDelegate = self
            print("Segue2 used!")
            destinationViewController.loadView()
            self.horizontalTransitionController.tv2 = destinationViewController.TitleText
            self.horizontalTransitionController.iv2 = destinationViewController.Barview
            self.horizontalTransitionController.iv22 = destinationViewController.Logoview
            self.horizontalTransitionController.iv23 = destinationViewController.Clickhere
            self.horizontalTransitionController.f2 = destinationViewController.TitleText.frame
            self.horizontalTransitionController.vname2 = destinationViewController.vname
        }
        if checkString.rangeOfString("revealSeque") != nil, let destinationViewController = segue.destinationViewController as? AnacapaViewController {
            print("Got this far again")
            destinationViewController.transitioningDelegate = self
            print("Segue2 used!")
            destinationViewController.loadView()
            self.horizontalTransitionController.tv2 = destinationViewController.TitleText
            self.horizontalTransitionController.iv2 = destinationViewController.Barview
            self.horizontalTransitionController.iv22 = destinationViewController.Logoview
            self.horizontalTransitionController.iv23 = destinationViewController.Clickhere
            self.horizontalTransitionController.f2 = destinationViewController.TitleText.frame
            self.horizontalTransitionController.vname2 = destinationViewController.vname
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageIVs = [self.PageIV1, self.PageIV2, self.PageIV3, self.PageIV4, self.PageIV5, self.PageIV6]
        self.capPagTVs = [self.CapPagTV1, self.CapPagTV2, self.CapPagTV3, self.CapPagTV4, self.CapPagTV5, self.CapPagTV6]
        self.PageScrollView.contentSize.height = 1900
        var imageArr : [UIImage] = []
        for i in 0...58{
            let str : String = "TAP_HERE_V01_LOOP_"+String(format: "%05d", i)+".png"
            //print(str)
            imageArr.append(UIImage(named:str)!)
        }
        print("Loaded SantaCruz animation")
        /*
         ClickHere.animationImages = [
         UIImage(named:"TAP_HERE_V01_LOOP_00000.png")!
         ]
         */
        Clickhere.animationImages = imageArr
        Clickhere.animationDuration = 2.0
        Clickhere.startAnimating()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //self.dataLabel!.text = dataObject
        var imageArr : [UIImage] = []
        for i in 0...58{
            let str : String = "TAP_HERE_V01_LOOP_"+String(format: "%05d", i)+".png"
            //print(str)
            imageArr.append(UIImage(named:str)!)
        }
        print("Loaded SanMiguel animation")
        /*
         ClickHere.animationImages = [
         UIImage(named:"TAP_HERE_V01_LOOP_00000.png")!
         ]
         */
        Clickhere.animationImages = imageArr
        Clickhere.animationDuration = 2.0
        Clickhere.startAnimating()
    
    }
    
    
    @IBAction func DismissPageClicked(sender: AnyObject) {
        enablemainpageTransition()
    }
    
    @IBAction func InfoClicked(sender: AnyObject) {
        enableInfo()
    }
    
    @IBAction func AnchorageClicked(sender: AnyObject) {
        enableAnchorages()
    }
    
    @IBAction func ActivitiesClicked(sender: AnyObject) {
        enableActivities()
    }
    
    
    func enableActivities(){
        self.activitiesActive = true
        self.enablepageTransition()
    }
    
    func enableAnchorages(){
        self.anchorageActive = true
        self.enablepageTransition()
    }
    
    func enableInfo(){
        self.infoActive = true
        self.enablepageTransition()
    }
    
    func enablepageTransition(){
        self.IView2.hidden = false
        self.PageScrollView.hidden = false
        if self.anchorageActive{
            var i = 0
            let result = NSMutableAttributedString()
            for astr: String in self.Anchoragestextstrings{
                let myAttributes = self.AnchoragesAttributes[i]
                let myAttrString1 = NSAttributedString(string: astr,
                                                       attributes: myAttributes)
                result.appendAttributedString(myAttrString1)
                i+=1
            }
            i = 0
            for piv: UIImageView in self.pageIVs{
                let ui = UIImage(imageLiteral: self.photonames[i])
                let newheight = ui.size.height/1.85
                print(newheight)
                //piv.frame = CGRectMake(piv.frame.origin.x, piv.frame.origin.y, piv.frame.size.width, newheight)//(piv.frame.x,piv.frame.y,piv.frame.width,newheight)
                piv.image = ui
                let mystring = self.AnchoragesCaptiontextstrings[i]
                let myAttributes = self.AnchoragesCaptionAttributes[i]
                let myAttrString1 = NSAttributedString(string: mystring,
                                                       attributes: myAttributes)
                self.capPagTVs[i].attributedText = myAttrString1
                i+=1
            }
            self.PageTextView.attributedText = result
        }
        UIView.animateWithDuration(2.0, delay: 0.0, options: .CurveEaseOut, animations: {
            self.IView.alpha = 0
            self.IView2.alpha = 1
            if self.activitiesActive{
                self.ActivitiesBar.alpha = 1
            }
            self.PageScrollView.alpha = 1
            
            self.CloseTV.alpha = 1
            }, completion: { finished in
                if (finished){
                    
                    self.IView.hidden = true
                    self.DismissPage.hidden = false
                    
                }
        })
    }
    
    func enablemainpageTransition(){
        self.IView.hidden = false
        UIView.animateWithDuration(2.0, delay: 0.0, options: .CurveEaseOut, animations: {
            self.IView2.alpha = 0
            self.IView.alpha = 1
            self.PageScrollView.alpha = 0
            if self.activitiesActive{
                self.ActivitiesBar.alpha = 0
            }
            
            self.CloseTV.alpha = 0
            }, completion: { finished in
                if (finished){
                    self.PageScrollView.hidden = true
                    self.IView2.hidden = true
                    self.DismissPage.hidden = true
                    self.infoActive = false
                    self.anchorageActive = false
                    self.activitiesActive = false
                    
                }
        })
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

extension SantaCruzViewController: UIViewControllerTransitioningDelegate {
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        //horizontalTransitionController.originFrame = CardView.frame
        //horizontalTransitionController.swipeDirection = self.swipeState
        return horizontalTransitionController
    }
}
