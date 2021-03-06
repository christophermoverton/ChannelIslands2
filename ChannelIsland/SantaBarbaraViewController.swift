//
//  SantaBarbaraViewController.swift
//  ChannelIsland
//
//  Created by Christopher Overton on 8/30/16.
//  Copyright © 2016 Christopher Overton. All rights reserved.
//


import UIKit
class SantaBarbaraViewController: UIViewController, UITextViewDelegate {
    
    private let revealSequeId = "revealSegue"
    private var swipeState: Bool = true  //right state
    private let horizontalTransitionController = HorizontalTransitionController()
    private let iname1 = "bar5"
    private let iname2 = "bar5"
    private let iname3 = "bar4"
    let vname: String = "Santa Barbara Island"
    var imageArray: [UIImage] = []
    @IBOutlet weak var TitleText: UITextView!
    @IBOutlet weak var Barview: UIImageView!
    @IBOutlet weak var Logoview: UIImageView!
    @IBOutlet weak var Clickhere: UIImageView!
    @IBOutlet weak var NavBar: UIImageView!
    @IBOutlet weak var IView: UIImageView!
    @IBOutlet weak var IView2: UIImageView!
    @IBOutlet weak var CloseTV: UITextView!
    @IBOutlet weak var DismissPage: UIButton!
    @IBOutlet weak var InfoButton: UIButton!
    @IBOutlet weak var AnchorageButton: UIButton!
    @IBOutlet weak var ActivitiesButton: UIButton!
    @IBOutlet weak var ActivitiesBar: UIImageView!
    private var infoActive: Bool = false
    private var anchorageActive: Bool = false
    private var activitiesActive: Bool = false
    @IBOutlet weak var PageScrollView: FadeScrollVIew!
    @IBOutlet weak var PageTextView: UITextView!
    @IBOutlet weak var PageIV1: UIImageView!
    @IBOutlet weak var IPageV1: UIImageView!
    @IBOutlet weak var PageIV2: UIImageView!
    @IBOutlet weak var PageIV3: UIImageView!
    @IBOutlet weak var PageIV4: UIImageView!
    @IBOutlet weak var PageIV5: UIImageView!
    @IBOutlet weak var PageIV6: UIImageView!
    @IBOutlet weak var CapPagTV1: UITextView!
    @IBOutlet weak var CapPagTV2: UITextView!
    @IBOutlet weak var CapPagTV3: UITextView!
    @IBOutlet weak var CapPagTV4: UITextView!
    @IBOutlet weak var CapPagTV5: UITextView!
    @IBOutlet weak var CapPagTV6: UITextView!
    private var Infotextstrings: [String] = ["INFO\n\n","Please note: Santa Barbara Island is closed (2016–2017) to public access due to storm damage. Check for closures before you go. \n\n A great place to go fishing or view elephant seals, Santa Barbara Island is a grassy, gently sloping plateau of volcanic rock, with vertical cliffs plunging dramatically into the sea. The island is a seamount, roughly a square mile of which breaks the surface. Ringed by rocky shoals, it is tricky to navigate inshore, especially at night. On the southeast coast is the sea lion rookery, perhaps the island’s greatest attraction. The entire rookery area is closed to fishing. Sport fishing is allowed around the remaining 75 percent of the island. "]
    private var InfoAttributes : [[String: AnyObject]] = [[NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSBackgroundColorAttributeName: UIColor.clearColor(),
        NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 24.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSBackgroundColorAttributeName: UIColor.clearColor(),
        NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!]]
    private var Anchoragestextstrings: [String] = ["ANCHORAGES\n\n","Landing Cove\n\n","Located on the northeast side of the island, Landing Cove is Santa Barbara Island’s best anchorage and only landing spot. As you approach from the east, it’s easy to spot the visitor center on the high bluff above. Ferry operators maneuver their boats right next to the landing. But with the surge, this is not recommended for most boaters unless conditions are very calm. The ladder you need to climb to get ashore can also be challenging.  \n\n","BOATERS NOTE: ","Although it is generally calm around this island (especially on the front side), boaters should be aware that rough conditions can occur mid-channel between the island and mainland. Vessels under 20 feet are not recommended for crossing the Santa Barbara Channel. "]
    
    private var AnchoragesAttributes : [[String: AnyObject]] = [[NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSBackgroundColorAttributeName: UIColor.clearColor(),
        NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 24.0)!],
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("Got This Far!")
        print(segue.identifier)
        var checkString: String = (segue.identifier)!
        print(checkString.rangeOfString(revealSequeId) != nil)
        self.horizontalTransitionController.f1 = self.TitleText.frame
        self.horizontalTransitionController.vname1 = "Santa Barbara Island"
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
        if checkString.rangeOfString("reveal") != nil, let destinationViewController = segue.destinationViewController as? AnacapaViewController {
            print("Got this far again")
            destinationViewController.transitioningDelegate = self
            print("Segue2 used!")
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
        self.PageScrollView.contentSize.height = 1900
        var imageArr : [UIImage] = []
        for i in 0...58{
            let str : String = "TAP_HERE_V01_LOOP_"+String(format: "%05d", i)+".png"
            
            imageArr.append(UIImage(named:str)!)
        }
        print("Loaded SantaBarbara animation")
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
        self.PageScrollView.contentOffset = CGPoint(x: 0, y: 0)
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
            /*
             for piv: UIImageView in self.pageIVs{
             piv.alpha = 1
             self.capPagTVs[i].alpha = 1
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
             */
            self.PageTextView.attributedText = result
            //self.viewDidLayoutSubviews()
        }
        
        if self.infoActive{
            var i = 0
            let result = NSMutableAttributedString()
            for astr: String in self.Infotextstrings{
                let myAttributes = self.InfoAttributes[i]
                let myAttrString1 = NSAttributedString(string: astr,
                                                       attributes: myAttributes)
                result.appendAttributedString(myAttrString1)
                i+=1
            }
            i = 0
            /*
             for piv: UIImageView in self.pageIVs{
             if (i > 2){
             piv.alpha = 0
             self.capPagTVs[i].alpha = 0
             i+=1
             continue
             }
             
             let ui = UIImage(imageLiteral: self.infophotonames[i])
             let newheight = ui.size.height/1.85
             print(newheight)
             //piv.frame = CGRectMake(piv.frame.origin.x, piv.frame.origin.y, piv.frame.size.width, newheight)//(piv.frame.x,piv.frame.y,piv.frame.width,newheight)
             piv.image = ui
             if (i == 0){
             piv.alpha = 0
             IPageV1.alpha = 1
             IPageV1.image = ui
             }
             let mystring = self.AnchoragesCaptiontextstrings[i]
             let myAttributes = self.AnchoragesCaptionAttributes[i]
             let myAttrString1 = NSAttributedString(string: mystring,
             attributes: myAttributes)
             self.capPagTVs[i].attributedText = myAttrString1
             i+=1
             } */
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
                    
                    self.IPageV1.alpha = 0
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

extension SantaBarbaraViewController: UIViewControllerTransitioningDelegate {
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        //horizontalTransitionController.originFrame = CardView.frame
        //horizontalTransitionController.swipeDirection = self.swipeState
        return horizontalTransitionController
    }
}
