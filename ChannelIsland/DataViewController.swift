//
//  DataViewController.swift
//  ChannelIsland
//
//  Created by Christopher Overton on 7/31/16.
//  Copyright © 2016 Christopher Overton. All rights reserved.
//

import UIKit

class DataViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var MapButton: UIButton!
    @IBOutlet weak var PhotographyButton: UIButton!
    @IBOutlet weak var PlanningLabel: UITextField!
    @IBOutlet weak var PhotographyLabel: UITextField!
    @IBOutlet weak var HighlightsLabel: UITextField!
    @IBOutlet weak var InfoLabel: UITextField!
    @IBOutlet weak var MapsLabel: UITextField!
    @IBOutlet weak var GreenDotAnimView5: UIImageView!
    @IBOutlet weak var GreenDotAnimView4: UIImageView!
    @IBOutlet weak var GreenDotAnimView3: UIImageView!
    @IBOutlet weak var GreenDotAnimView2: UIImageView!
    @IBOutlet weak var NavBar: UIImageView!
    @IBOutlet weak var GreenDotAnimIView: UIImageView!
    @IBOutlet weak var HighlightsButton: UIButton!
    @IBOutlet weak var HighlightNumbersView: UIImageView!
    @IBOutlet weak var DismissInfo: UIButton!
    @IBOutlet weak var CloseTV: UITextView!
    @IBOutlet weak var DismissPlanning: UIButton!
    @IBOutlet weak var PlanningButton: UIButton!
    @IBOutlet weak var ScrollView2: UIScrollView!
    @IBOutlet weak var TextView2: UITextView!
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
    @IBOutlet weak var WaterImg0: UIImageView!
    @IBOutlet weak var WaterImg1: UIImageView!
    @IBOutlet weak var WaterImg2: UIImageView!
    @IBOutlet weak var dataLabel: UILabel!
    var dataObject: String = ""
    private let revealSequeId = "revealSegue"
    private let photoSequeId = "Photography"
    private let horizontalTransitionController = HorizontalTransitionController()
    private let flipPresentAnimationcontroller = FlipPresentAnimationController()
    private var flipPresentUse: Bool = false
    private var HightlightsActive: Bool = false
    private var planningActive: Bool = false
    private var infoActive: Bool = false
    var imageArray: [UIImage] = []
    //var lightBlur: UIBlurEffect
    //var blurView: UIVisualEffectView
    @IBOutlet weak var Highlights8: UIImageView!
    @IBOutlet weak var Highlights7: UIImageView!
    @IBOutlet weak var Highlights6: UIImageView!
    @IBOutlet weak var Highlights5: UIImageView!
    @IBOutlet weak var Highlights4: UIImageView!
    @IBOutlet weak var Highlights3: UIImageView!
    @IBOutlet weak var Highlights2: UIImageView!
    @IBOutlet weak var Highlights1: UIImageView!
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("Got This Far!")
        print(segue.identifier)
        var checkString: String = (segue.identifier)!
        print(checkString.rangeOfString(revealSequeId) != nil)
        if checkString.rangeOfString(revealSequeId) != nil, let destinationViewController = segue.destinationViewController as? UIViewController {
            print("Got this far again")
            destinationViewController.transitioningDelegate = self
            
            print("Segue2 used!")
            
        }
        
        if segue.identifier == photoSequeId, let photographyPageViewController = segue.destinationViewController as? PhotoCommentViewController {
            print("Hit Photography Page View Seque")
            //photographyPageViewController.photos = photos
            photographyPageViewController.photoIndex = 0
            photographyPageViewController.photoName = photographyPageViewController.photos[0]
            
        }
        if segue.identifier == "backseque", let viewController = segue.destinationViewController as? ViewController {
            viewController.transitioningDelegate = self
            flipPresentUse = true
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.ScrollView.contentSize.height = 650
        self.ScrollView.hidden = true
        self.DismissInfo.hidden = true
        self.DismissPlanning.hidden = true
        self.ScrollView2.contentSize.height = 650
        self.ScrollView2.hidden = true
        self.CloseTV.hidden = true

        /*
        let path = NSBundle.mainBundle().pathForResource("SampleText", ofType: "txt")
        let fm = NSFileManager()
        let exists = fm.fileExistsAtPath(path!);
        var cString: String = "";
        if(exists){
            let c = fm.contentsAtPath(path!)
            let nString = NSString(data: c!, encoding: NSUTF8StringEncoding)
            cString = nString as! String
        }
        TextView2.attributedText = getLargeText(cString)
        */

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //self.dataLabel!.text = dataObject
        var imageArr : [UIImage] = []
        for i in 0...149{
            let str : String = "MAIN_NAV_SINGL_GREEN_DOT_"+String(format: "%05d", i)
            print(str)
            imageArr.append(UIImage(named:str)!)
        }
        var imageArr2 : [UIImage] = [UIImage(imageLiteral: "Water_00000"),
                                     UIImage(imageLiteral: "Water_00001"),
                                     UIImage(imageLiteral: "Water_00002")]
        /*
         ClickHere.animationImages = [
         UIImage(named:"TAP_HERE_V01_LOOP_00000.png")!
         ]
         */
        GreenDotAnimIView.animationImages = imageArr
        GreenDotAnimIView.animationDuration = 5.0
        GreenDotAnimIView.startAnimating()
        GreenDotAnimView2.animationImages = imageArr
        GreenDotAnimView2.animationDuration = 5.0
        GreenDotAnimView2.startAnimating()
        GreenDotAnimView3.animationImages = imageArr
        GreenDotAnimView3.animationDuration = 5.0
        GreenDotAnimView3.startAnimating()
        GreenDotAnimView4.animationImages = imageArr
        GreenDotAnimView4.animationDuration = 5.0
        GreenDotAnimView4.startAnimating()
        GreenDotAnimView5.animationImages = imageArr
        GreenDotAnimView5.animationDuration = 5.0
        GreenDotAnimView5.startAnimating()
        WaterImg0.animationImages = imageArr2
        WaterImg0.animationDuration = 6.0
        WaterImg0.startAnimating()
        /*
        UIView.animateKeyframesWithDuration(6.0, delay: 0, options: .Repeat, animations:{
            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.33, animations: {
                
                self.WaterImg0.alpha = 0;
                self.WaterImg1.alpha = 1.0;
            })
            UIView.addKeyframeWithRelativeStartTime(0.33, relativeDuration: 0.33, animations: {
                
                self.WaterImg1.alpha = 0.0;
                self.WaterImg2.alpha = 1.0;
            })
            UIView.addKeyframeWithRelativeStartTime(0.67, relativeDuration: 0.33, animations: {
                
                self.WaterImg2.alpha = 0.0;
                self.WaterImg0.alpha = 1.0;
            })
            
            }, completion: { finished in
                print("Finished7!")}
        )*/
    }
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    @IBAction func DismissInfoClick(sender: AnyObject) {
        dismissInfo()
    }
    
    func dismissInfo(){
        self.IView.hidden = false
        self.GreenDotAnimView2.hidden = false
        self.GreenDotAnimView3.hidden = false
        self.GreenDotAnimView4.hidden = false
        self.GreenDotAnimView5.hidden = false
        self.GreenDotAnimIView.hidden = false
        self.infoActive = false
        if self.HightlightsActive {
            self.HighlightNumbersView.hidden = false
            self.NavBar.image = UIImage(named: "CI_Main_Icon_HIGHLIGHTS_V02")
            
        }
        else{
            self.NavBar.image = UIImage(named: "CI_Main_Icon_HOME_V02")
        }
        if self.HightlightsActive {
            self.InfoLabel.textColor = UIColor.whiteColor()
            self.HighlightsLabel.textColor = UIColor.blackColor()
        }
        else{
            self.InfoLabel.textColor = UIColor.whiteColor()
            self.MapsLabel.textColor = UIColor.blackColor()
        }
        UIView.animateWithDuration(2.0, delay: 0.0, options: .CurveEaseOut, animations: {
            self.IView.alpha = 1
            self.GreenDotAnimIView.alpha = 1
            self.GreenDotAnimView2.alpha = 1
            self.GreenDotAnimView3.alpha = 1
            self.GreenDotAnimView4.alpha = 1
            self.GreenDotAnimView5.alpha = 1
            if self.HightlightsActive {
                //self.HighlightNumbersView.alpha = 1
                self.Highlights1.alpha = 1
                self.Highlights2.alpha = 1
                self.Highlights3.alpha = 1
                self.Highlights4.alpha = 1
                self.Highlights5.alpha = 1
                self.Highlights6.alpha = 1
                self.Highlights7.alpha = 1
                self.Highlights8.alpha = 1
                
            }
            self.ScrollView.alpha = 0
            self.IView2.alpha = 0
            self.CloseTV.alpha = 0
            }, completion: { finished in
                if (finished){
                    
                    
                    self.ScrollView.hidden = true
                    self.CloseTV.hidden = true
                }
        })
        self.DismissInfo.hidden = true
        self.PlanningButton.hidden = false
        self.InfoButton.hidden = false
        self.HighlightsButton.hidden = false
        self.PhotographyButton.hidden = false
        print("Dismiss Button Pressed")
    }
    
    @IBAction func infoClick(sender: AnyObject) {
        enableInfo()
    }
    
    func enableInfo(){
        if self.planningActive {
            self.ScrollView.hidden = false
            self.planningActive = false
            self.infoActive = true
            self.NavBar.image = UIImage(named: "CI_Main_Icon_INFO_V02")
            self.InfoLabel.textColor = UIColor.blackColor()
            self.PlanningLabel.textColor = UIColor.whiteColor()
            UIView.animateWithDuration(2.0, delay: 0.0, options: .CurveEaseOut, animations: {

                self.ScrollView2.alpha = 0
                self.ScrollView.alpha = 1
                }, completion: { finished in
                    if (finished){
                        self.PlanningButton.hidden = false
                        self.InfoButton.hidden = true
                        self.ScrollView2.hidden = true
                    }
            })
        }
        else{
            self.ScrollView.hidden = false
            self.CloseTV.hidden = false
            self.NavBar.image = UIImage(named: "CI_Main_Icon_INFO_V02")
            self.infoActive = true
            if self.HightlightsActive {
                self.InfoLabel.textColor = UIColor.blackColor()
                self.HighlightsLabel.textColor = UIColor.whiteColor()
            }
            else{
                self.InfoLabel.textColor = UIColor.blackColor()
                self.MapsLabel.textColor = UIColor.whiteColor()
            }
            UIView.animateWithDuration(2.0, delay: 0.0, options: .CurveEaseOut, animations: {
                self.IView.alpha = 0
                self.ScrollView.alpha = 1
                self.IView2.alpha = 1
                self.GreenDotAnimIView.alpha = 0
                self.GreenDotAnimView2.alpha = 0
                self.GreenDotAnimView3.alpha = 0
                self.GreenDotAnimView4.alpha = 0
                self.GreenDotAnimView5.alpha = 0
                self.Highlights1.alpha = 0
                self.Highlights2.alpha = 0
                self.Highlights3.alpha = 0
                self.Highlights4.alpha = 0
                self.Highlights5.alpha = 0
                self.Highlights6.alpha = 0
                self.Highlights7.alpha = 0
                self.Highlights8.alpha = 0
                if self.HightlightsActive {
                    self.HighlightNumbersView.alpha = 0
                    
                }
                self.CloseTV.alpha = 1
                }, completion: { finished in
                    if (finished){
                        
                        self.IView.hidden = true
                        self.GreenDotAnimIView.hidden = true
                        self.GreenDotAnimView2.hidden = true
                        self.GreenDotAnimView3.hidden = true
                        self.GreenDotAnimView4.hidden = true
                        self.GreenDotAnimView5.hidden = true
                        if self.HightlightsActive{
                            self.HighlightNumbersView.hidden = true
                            
                        }
                    }
            })
            self.DismissInfo.hidden = false
            self.PlanningButton.hidden = false
            self.InfoButton.hidden = true
            self.PhotographyButton.hidden = false
            self.HighlightsButton.hidden = false
            print("Info Button Pressed")
        }
    }
    
    @IBAction func HighlightsClick(sender: AnyObject) {

        if self.planningActive {
            if self.HightlightsActive {
                self.HightlightsActive = false
            }
            else{
                self.HightlightsActive = true
            }
            dismissPlanning()
            return
        }

        if self.infoActive {
            if self.HightlightsActive {
                self.HightlightsActive = false
            }
            else{
                self.HightlightsActive = true
            }
            dismissInfo()
            return 
        }

        if !self.infoActive && !self.planningActive {
            enabledisableHighlights()
        }
    }
    
    func enabledisableHighlights(){
        if self.HightlightsActive {
            self.NavBar.image = UIImage(named: "CI_Main_Icon_HOME_V02")
            self.HighlightsLabel.textColor = UIColor.whiteColor()
            self.MapsLabel.textColor = UIColor.blackColor()
            
            UIView.animateWithDuration(2.0, delay: 0.0, options: .CurveEaseOut, animations: {
                self.HighlightNumbersView.alpha = 0
                self.Highlights1.alpha = 0
                self.Highlights2.alpha = 0
                self.Highlights3.alpha = 0
                self.Highlights4.alpha = 0
                self.Highlights5.alpha = 0
                self.Highlights6.alpha = 0
                self.Highlights7.alpha = 0
                self.Highlights8.alpha = 0
                
                }, completion: { finished in
                    if (finished){
                        
                        self.HighlightNumbersView.hidden = true
                        self.HightlightsActive = false
                        
                        
                    }
            })
        }
        else{
            
            self.HighlightNumbersView.hidden = false
            self.NavBar.image = UIImage(named: "CI_Main_Icon_HIGHLIGHTS_V02")
            self.HighlightsLabel.textColor = UIColor.blackColor()
            self.MapsLabel.textColor = UIColor.whiteColor()
            self.Highlights1.alpha = 1

            let stime = 1000000
            var imageArr : [UIImage] = []
            for i in 0...9{
                let str : String = "HIGHLIGHT1_"+String(format: "%05d", i)
            
                imageArr.append(UIImage(named:str)!)
            }
            Highlights1.animationImages = imageArr
            Highlights1.animationRepeatCount = 1
            Highlights1.animationDuration = 0.667
            Highlights1.startAnimating()
            var imageArr2 : [UIImage] = []
            for i in 0...9{
                let str : String = "HIGHLIGHT2_"+String(format: "%05d", i)
                
                imageArr2.append(UIImage(named:str)!)
            }
            Highlights2.animationImages = imageArr2
            Highlights2.animationRepeatCount = 1
            Highlights2.animationDuration = 0.667
            let delay = 0.25 * Double(NSEC_PER_SEC)
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue()) {
                self.Highlights2.alpha = 1
                self.Highlights2.startAnimating()
            }
            
            
            var imageArr3 : [UIImage] = []
            for i in 0...9{
                let str : String = "HIGHLIGHT3_"+String(format: "%05d", i)
                
                imageArr3.append(UIImage(named:str)!)
            }
            Highlights3.animationImages = imageArr3
            Highlights3.animationRepeatCount = 1
            Highlights3.animationDuration = 0.667
            let delay2 = 0.50 * Double(NSEC_PER_SEC)
            let time2 = dispatch_time(DISPATCH_TIME_NOW, Int64(delay2))
            dispatch_after(time2, dispatch_get_main_queue()) {
                self.Highlights3.alpha = 1
                self.Highlights3.startAnimating()
            }
            //Highlights3.startAnimating()
            var imageArr4 : [UIImage] = []
            for i in 0...9{
                let str : String = "HIGHLIGHT4_"+String(format: "%05d", i)
                
                imageArr4.append(UIImage(named:str)!)
            }
            Highlights4.animationImages = imageArr4
            Highlights4.animationRepeatCount = 1
            Highlights4.animationDuration = 0.667
            let delay3 = 0.75 * Double(NSEC_PER_SEC)
            let time3 = dispatch_time(DISPATCH_TIME_NOW, Int64(delay3))
            dispatch_after(time3, dispatch_get_main_queue()) {
                self.Highlights4.alpha = 1
                self.Highlights4.startAnimating()
            }
            //Highlights4.startAnimating()
            var imageArr5 : [UIImage] = []
            for i in 0...9{
                let str : String = "HIGHLIGHT5_"+String(format: "%05d", i)
                
                imageArr5.append(UIImage(named:str)!)
            }
            Highlights5.animationImages = imageArr5
            Highlights5.animationRepeatCount = 1
            Highlights5.animationDuration = 0.667
            //sleep(1000000)
            let delay4 = 1.0 * Double(NSEC_PER_SEC)
            let time4 = dispatch_time(DISPATCH_TIME_NOW, Int64(delay4))
            dispatch_after(time4, dispatch_get_main_queue()) {
                self.Highlights5.alpha = 1
                self.Highlights5.startAnimating()
            }
            //Highlights5.startAnimating()
            var imageArr6 : [UIImage] = []
            for i in 0...9{
                let str : String = "HIGHLIGHT6_"+String(format: "%05d", i)
                
                imageArr6.append(UIImage(named:str)!)
            }
            Highlights6.animationImages = imageArr6
            Highlights6.animationRepeatCount = 1
            Highlights6.animationDuration = 0.667
            //sleep(1)
            let delay5 = 1.25 * Double(NSEC_PER_SEC)
            let time5 = dispatch_time(DISPATCH_TIME_NOW, Int64(delay5))
            dispatch_after(time5, dispatch_get_main_queue()) {
                self.Highlights6.alpha = 1
                self.Highlights6.startAnimating()
            }
            //Highlights6.startAnimating()
            var imageArr7 : [UIImage] = []
            for i in 0...9{
                let str : String = "HIGHLIGHT7_"+String(format: "%05d", i)
                
                imageArr7.append(UIImage(named:str)!)
            }
            Highlights7.animationImages = imageArr7
            Highlights7.animationRepeatCount = 1
            Highlights7.animationDuration = 0.667
            let delay6 = 1.5 * Double(NSEC_PER_SEC)
            let time6 = dispatch_time(DISPATCH_TIME_NOW, Int64(delay6))
            dispatch_after(time6, dispatch_get_main_queue()) {
                self.Highlights7.alpha = 1
                self.Highlights7.startAnimating()
            }
            //Highlights7.startAnimating()
            var imageArr8 : [UIImage] = []
            for i in 0...9{
                let str : String = "HIGHLIGHT8_"+String(format: "%05d", i)
                
                imageArr8.append(UIImage(named:str)!)
            }
            Highlights8.animationImages = imageArr8
            Highlights8.animationRepeatCount = 1
            Highlights8.animationDuration = 0.667
            //sleep(1)
            let delay7 = 1.75 * Double(NSEC_PER_SEC)
            let time7 = dispatch_time(DISPATCH_TIME_NOW, Int64(delay7))
            dispatch_after(time7, dispatch_get_main_queue()) {
                self.Highlights8.alpha = 1
                self.Highlights8.startAnimating()
            }
            //Highlights8.startAnimating()
            
            UIView.animateWithDuration(0.667, delay: 0.0, options: .CurveEaseOut, animations: {
                //self.HighlightNumbersView.alpha = 1
                
                }, completion: { finished in
                    if (finished){
                        //self.Highlights1.stopAnimating()
                        //self.Highlights1.image = UIImage(named:"CI_Main_Icon_HOME_V02")
                        self.HightlightsActive = true
                        
                    }
            })
        }
    }
    
    @IBAction func DismissPlanningClick(sender: AnyObject) {
        dismissPlanning()
    }
    @IBAction func PlanningClick(sender: AnyObject) {
        enablePlanning()
        print("Planning Button Pressed")
    }
    
    @IBAction func MapClick(sender: AnyObject) {
        if self.planningActive {
            dismissPlanning()
        }
        else{
            if self.HightlightsActive {
                enabledisableHighlights()
            }
        }
        if self.infoActive {
            dismissInfo()
        }
        else{
            if self.HightlightsActive {
                enabledisableHighlights()
            }
        }
    }
    
    func dismissPlanning(){
        self.IView.hidden = false
        self.GreenDotAnimIView.hidden = false
        self.GreenDotAnimView2.hidden = false
        self.GreenDotAnimView3.hidden = false
        self.GreenDotAnimView4.hidden = false
        self.GreenDotAnimView5.hidden = false
        self.planningActive = false
        if self.HightlightsActive {
            self.HighlightNumbersView.hidden = false
            self.NavBar.image = UIImage(named: "CI_Main_Icon_HIGHLIGHTS_V02")
            
        }
        else{
            self.NavBar.image = UIImage(named: "CI_Main_Icon_HOME_V02")
        }
        if self.HightlightsActive {
            self.PlanningLabel.textColor = UIColor.whiteColor()
            self.HighlightsLabel.textColor = UIColor.blackColor()
        }
        else{
            self.PlanningLabel.textColor = UIColor.whiteColor()
            self.MapsLabel.textColor = UIColor.blackColor()
        }
        UIView.animateWithDuration(2.0, delay: 0.0, options: .CurveEaseOut, animations: {
            self.IView.alpha = 1
            self.ScrollView2.alpha = 0
            self.IView2.alpha = 0
            self.CloseTV.alpha = 0
            self.GreenDotAnimIView.alpha = 1
            self.GreenDotAnimView2.alpha = 1
            self.GreenDotAnimView3.alpha = 1
            self.GreenDotAnimView4.alpha = 1
            self.GreenDotAnimView5.alpha = 1

            if self.HightlightsActive {
                //self.HighlightNumbersView.alpha = 1
                self.Highlights1.alpha = 1
                self.Highlights2.alpha = 1
                self.Highlights3.alpha = 1
                self.Highlights4.alpha = 1
                self.Highlights5.alpha = 1
                self.Highlights6.alpha = 1
                self.Highlights7.alpha = 1
                self.Highlights8.alpha = 1
            }
            
            //self.HighlightNumbersView.alpha = 1
            }, completion: { finished in
                if (finished){
                    
                    self.ScrollView2.hidden = true
                    self.CloseTV.hidden = true
                    
                }
        })
        self.DismissPlanning.hidden = true
        self.PlanningButton.hidden = false
        self.InfoButton.hidden = false
        self.HighlightsButton.hidden = false
        self.PhotographyButton.hidden = false
        print("Dismiss Planning Button Pressed")
    }
    
    func enablePlanning(){
        if self.infoActive {
            self.ScrollView2.hidden = false
            self.infoActive = false
            self.planningActive = true
            self.NavBar.image = UIImage(named: "CI_Main_Icon_PLANNING_V02")
            self.InfoLabel.textColor = UIColor.whiteColor()
            self.PlanningLabel.textColor = UIColor.blackColor()
            UIView.animateWithDuration(2.0, delay: 0.0, options: .CurveEaseOut, animations: {
                
                self.ScrollView.alpha = 0
                self.ScrollView2.alpha = 1
                }, completion: { finished in
                    if (finished){
                        self.PlanningButton.hidden = true
                        self.InfoButton.hidden = false
                        self.ScrollView.hidden = true
                        
                    }
            })
        }
        else{
            self.ScrollView2.hidden = false
            self.CloseTV.hidden = false
            self.planningActive = true
            if self.HightlightsActive {
                self.PlanningLabel.textColor = UIColor.blackColor()
                self.HighlightsLabel.textColor = UIColor.whiteColor()
            }
            else{
                self.PlanningLabel.textColor = UIColor.blackColor()
                self.MapsLabel.textColor = UIColor.whiteColor()
            }
            self.NavBar.image = UIImage(named: "CI_Main_Icon_PLANNING_V02")
            UIView.animateWithDuration(2.0, delay: 0.0, options: .CurveEaseOut, animations: {
                self.IView.alpha = 0
                self.ScrollView2.alpha = 1
                self.IView2.alpha = 1
                self.CloseTV.alpha = 1
                self.GreenDotAnimIView.alpha = 0
                self.GreenDotAnimView2.alpha = 0
                self.GreenDotAnimView3.alpha = 0
                self.GreenDotAnimView4.alpha = 0
                self.GreenDotAnimView5.alpha = 0
                self.Highlights1.alpha = 0
                self.Highlights2.alpha = 0
                self.Highlights3.alpha = 0
                self.Highlights4.alpha = 0
                self.Highlights5.alpha = 0
                self.Highlights6.alpha = 0
                self.Highlights7.alpha = 0
                self.Highlights8.alpha = 0
                if self.HightlightsActive {
                    self.HighlightNumbersView.alpha = 0
                    
                }
                }, completion: { finished in
                    if (finished){
                        
                        self.IView.hidden = true
                        self.GreenDotAnimIView.hidden = true
                        self.GreenDotAnimView2.hidden = true
                        self.GreenDotAnimView3.hidden = true
                        self.GreenDotAnimView4.hidden = true
                        self.GreenDotAnimView5.hidden = true
                        if self.HightlightsActive {
                            self.HighlightNumbersView.hidden = true
                        }
                        
                    }
            })
            self.DismissPlanning.hidden = false
            self.PlanningButton.hidden = true
            self.InfoButton.hidden = false
            self.HighlightsButton.hidden = false
            self.PhotographyButton.hidden = false
        }
    }
    
    func getLargeText(text: String) -> NSMutableAttributedString {
        let string:NSMutableAttributedString = NSMutableAttributedString(string: text, attributes: [NSForegroundColorAttributeName: UIColor.whiteColor(),NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 14.0)!])
        let words:[String] = text.componentsSeparatedByString(" ")
        var w = ""
        
        for word in words {
            let t1: Bool = word.rangeOfString("{|") != nil
            let t2: Bool = word.rangeOfString("|}") != nil
            //if (word.hasPrefix("{|") && word.hasSuffix("|}")) {
            if (t1 && t2){
                let range:NSRange = (string.string as NSString).rangeOfString(word)
                string.addAttribute(NSFontAttributeName, value: UIFont(name: "Helvetica-Light", size: 30)!, range:range)
                //string.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: range)
                w = word.stringByReplacingOccurrencesOfString("{|", withString: "")
                w = w.stringByReplacingOccurrencesOfString("|}", withString: "")
                string.replaceCharactersInRange(range, withString: w)
            }
        }
        return string
    }
    
    //getColoredText("i {|love|} this!")
}

extension DataViewController: UIViewControllerTransitioningDelegate {
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
       //horizontalTransitionController.originFrame = CardView.frame
        if flipPresentUse {
            return flipPresentAnimationcontroller
        }
        return horizontalTransitionController
    }
}

