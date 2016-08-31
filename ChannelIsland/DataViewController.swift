//
//  DataViewController.swift
//  ChannelIsland
//
//  Created by Christopher Overton on 7/31/16.
//  Copyright © 2016 Christopher Overton. All rights reserved.
//

import UIKit

class DataViewController: UIViewController, UITextViewDelegate {
    
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
    @IBOutlet weak var dataLabel: UILabel!
    var dataObject: String = ""
    private let revealSequeId = "revealSegue"
    private let horizontalTransitionController = HorizontalTransitionController()
    private var HightlightsActive: Bool = false
    //var lightBlur: UIBlurEffect
    //var blurView: UIVisualEffectView
    
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
    }
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    @IBAction func DismissInfoClick(sender: AnyObject) {
        self.IView.hidden = false
        if self.HightlightsActive {
             self.HighlightNumbersView.hidden = false
        }
        UIView.animateWithDuration(2.0, delay: 0.0, options: .CurveEaseOut, animations: {
            self.IView.alpha = 1
            if self.HightlightsActive {
                  self.HighlightNumbersView.alpha = 1
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
        print("Dismiss Button Pressed")
    }
    @IBAction func infoClick(sender: AnyObject) {
        self.ScrollView.hidden = false
        self.CloseTV.hidden = false
        UIView.animateWithDuration(2.0, delay: 0.0, options: .CurveEaseOut, animations: {
            self.IView.alpha = 0
            self.ScrollView.alpha = 1
            self.IView2.alpha = 1
            if self.HightlightsActive {
                 self.HighlightNumbersView.alpha = 0
            }
            self.CloseTV.alpha = 1
            }, completion: { finished in
                if (finished){
                    self.IView.hidden = true
                    if self.HightlightsActive{
                         self.HighlightNumbersView.hidden = true
                    }
                }
        })
        self.DismissInfo.hidden = false
        self.PlanningButton.hidden = true
        self.InfoButton.hidden = true
        self.HighlightsButton.hidden = true
        print("Info Button Pressed")
    }
    @IBAction func HighlightsClick(sender: AnyObject) {
        if self.HightlightsActive {
            UIView.animateWithDuration(2.0, delay: 0.0, options: .CurveEaseOut, animations: {
                    self.HighlightNumbersView.alpha = 0
                }, completion: { finished in
                    if (finished){
                        self.HighlightNumbersView.hidden = true
                        self.HightlightsActive = false
                    }
            })
        }
        else{
            self.HighlightNumbersView.hidden = false
            UIView.animateWithDuration(2.0, delay: 0.0, options: .CurveEaseOut, animations: {
                self.HighlightNumbersView.alpha = 1
                }, completion: { finished in
                    if (finished){
                        self.HightlightsActive = true
                        }
            })
        }
    }
    @IBAction func DismissPlanningClick(sender: AnyObject) {
        self.IView.hidden = false
        if self.HightlightsActive {
            self.HighlightNumbersView.hidden = false
        }
        
        UIView.animateWithDuration(2.0, delay: 0.0, options: .CurveEaseOut, animations: {
            self.IView.alpha = 1
            self.ScrollView2.alpha = 0
            self.IView2.alpha = 0
            self.CloseTV.alpha = 0
            if self.HightlightsActive {
               self.HighlightNumbersView.alpha = 1
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
        print("Dismiss Planning Button Pressed")
    }
    @IBAction func PlanningClick(sender: AnyObject) {
        self.ScrollView2.hidden = false
        self.CloseTV.hidden = false
        UIView.animateWithDuration(2.0, delay: 0.0, options: .CurveEaseOut, animations: {
            self.IView.alpha = 0
            self.ScrollView2.alpha = 1
            self.IView2.alpha = 1
            self.CloseTV.alpha = 1
            self.HighlightNumbersView.alpha = 0
            }, completion: { finished in
                if (finished){
                    self.IView.hidden = true
                    self.HighlightNumbersView.hidden = true
                }
        })
        self.DismissPlanning.hidden = false
        self.PlanningButton.hidden = true
        self.InfoButton.hidden = true
        self.HighlightsButton.hidden = true
        print("Planning Button Pressed")
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
        
        return horizontalTransitionController
    }
}

