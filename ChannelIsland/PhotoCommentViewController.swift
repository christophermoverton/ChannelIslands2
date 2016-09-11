//
//  PhotoCommentViewController.swift
//  ChannelIsland
//
//  Created by Christopher Overton on 9/8/16.
//  Copyright © 2016 Christopher Overton. All rights reserved.
//

import UIKit

class PhotoCommentViewController: UIViewController {
    var photos = ["Photogallery_Crop_0011_Photography1", "Photogallery_Crop_0010_Photography2", "Photogallery_Crop_0009_Photography3", "Photogallery_Crop_0008_Photography4", "Photogallery_Crop_0007_Photography5", "Photogallery_Crop_0006_Photography6", "Photogallery_Crop_0005_Photography7", "Photogallery_Crop_0004_Photography8","Photogallery_Crop_0003_Photography9", "Photogallery_Crop_0002_Photography10", "Photogallery_Crop_0001_Photography11", "Photogallery_Crop_0000_Photography12"]
    var captions = ["\nSunset in the sanctuary, Channel Islands National Marine Sanctuary","\nArch Point, Santa Cruz Island","\nKayaker at Arch Rock, Anacapa Island, photo by Tim Hauf","\nKelp forest at Scorpion Bay, Santa Cruz Island","\nCalifornia Sea Lions, Channel Islands","Spiny lobsters and other marine species enjoy miles of marine reserves and protected areas within the sanctuary","\nPink-footed Shearwater, a summertime visitor to the Channel Islands","\nAshy storm petrels actively nest in the Channel Islands","Island foxes—about the size of house cats—are among the endemic species found only in the Channel Islands","Island Packers operates ferry service between Channel Islands Harbor and Ventura Harbor and several of the islands","\nFishing while kayaking on the Channel Islands","\nLichen-encrusted rocks on Santa Cruz Island","The National Park Service and NOAA’s National Marine Sanctuary program work together to protect land and sea."]
    
    
    @IBOutlet weak var TitleText3: UITextField!
    @IBOutlet weak var TitleText2: UITextField!
    @IBOutlet weak var TitleText1: UITextField!
    @IBOutlet weak var pagecontrol: UIPageControl!
    @IBOutlet weak var NavigationBarImageView: UIImageView!
    @IBOutlet weak var Caption: UITextView!
    
    @IBOutlet weak var Infolabel: UITextField!
    @IBOutlet weak var Mapslabel: UITextField!
    @IBOutlet weak var Highlightslabel: UITextField!
    @IBOutlet weak var Planninglabel: UITextField!
    @IBOutlet weak var Photographylabel: UITextField!
    
    @IBOutlet weak var Backlabel: UITextField!
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
        self.horizontalTransitionController.tfarr = [Mapslabel,Backlabel,Highlightslabel,Infolabel,Photographylabel,Planninglabel]
        var dphotoIndex: Int = 0
        if checkString.rangeOfString("reveal") != nil, let destinationViewController = segue.destinationViewController as? PhotoCommentViewController2 {
            print("Got this far again")
            destinationViewController.transitioningDelegate = self
            print("Segue2 used!")
            print("Segue2 used!")
            
            if checkString.rangeOfString(revealSequeId) != nil{
                dphotoIndex = (photoIndex-1)%12
                if (photoIndex == 0){
                    dphotoIndex = 11
                }
                destinationViewController.photoIndex = dphotoIndex
                destinationViewController.photoName = photos[abs(dphotoIndex)]
                self.horizontalTransitionController.vname2 = captions[abs(dphotoIndex)]
                swipeState = true
                
            }
            else{
                dphotoIndex = (photoIndex+1)%12
                destinationViewController.photoIndex = dphotoIndex
                destinationViewController.photoName = photos[abs(dphotoIndex)]
                self.horizontalTransitionController.vname2 = self.captions[abs(dphotoIndex)]
                swipeState = false
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
            self.horizontalTransitionController.tfarr2 = [destinationViewController.Mapslabel,destinationViewController.Backlabel,destinationViewController.Highlightslabel,destinationViewController.Infolabel,destinationViewController.Photographylabel,destinationViewController.Planninglabel]
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
