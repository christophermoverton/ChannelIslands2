//
//  IslandPhotoCommentViewController.swift
//  ChannelIsland
//
//  Created by Christopher Overton on 12/26/16.
//  Copyright © 2016 Christopher Overton. All rights reserved.
//


import UIKit

class IslandPhotoCommentViewController: UIViewController {
    var photos = ["Photogallery_Crop_0011_Photography1", "Photogallery_Crop_0010_Photography2", "Photogallery_Crop_0009_Photography3", "Photogallery_Crop_0008_Photography4", "Photogallery_Crop_0007_Photography5", "Photogallery_Crop_0006_Photography6", "Photogallery_Crop_0005_Photography7", "Photogallery_Crop_0004_Photography8","Photogallery_Crop_0003_Photography9", "Photogallery_Crop_0002_Photography10", "Photogallery_Crop_0001_Photography11", "Photogallery_Crop_0000_Photography12"]
    var captions = ["\nSunset in the sanctuary, Channel Islands National Marine Sanctuary","\nArch Point, Santa Cruz Island","\nKayaker at Arch Rock, Anacapa Island, photo by Tim Hauf","\nKelp forest at Scorpion Bay, Santa Cruz Island","\nCalifornia Sea Lions, Channel Islands","Spiny lobsters and other marine species enjoy miles of marine reserves and protected areas within the sanctuary","\nPink-footed Shearwater, a summertime visitor to the Channel Islands","\nAshy storm petrels actively nest in the Channel Islands","Island foxes—about the size of house cats—are among the endemic species found only in the Channel Islands","Island Packers operates ferry service between Channel Islands Harbor and Ventura Harbor and several of the islands","\nFishing while kayaking on the Channel Islands","\nLichen-encrusted rocks on Santa Cruz Island","The National Park Service and NOAA’s National Marine Sanctuary program work together to protect land and sea."]
    internal let islandsPhotos: [[String]] = [["SCimage059","SCimage061","SCimage063","SCimage065","SCimage067","SCimage069","SCimage071","SCimage073"],["EXPLORING_TIDEPOOLS","ANACAPA_VISITOR_CENTER_INFO","ANACAPA_LOTS_OF_CAVES","ANACAPA_ISALNDS_TIDEPOOL","ANACAPA_CATHEDRAL_COVE1"]]
    private var islandCaptions: [[String]] = [["Santa Cruz Island, sailboats anchored at Smuggler’s Cove","Santa Cruz Island, kayakers at Scorpion Bay","Santa Cruz Island, offloading waste at Prisoner’s Pier","Santa Cruz Island, Potato Harbor","Santa Cruz Island, East Side","Santa Cruz Island, small fish among the eelgrass","Santa Cruz Island, Yellow Banks","Santa Cruz Island, kayakers approach Painted Cave"],["Exploring the Anacapa tidepools; NPS","Anacapa Visitor Center has information on activities; NPS","Anacapa Island has lots of caves for kayakers; photo by Tim Hauf.","Anacapa Island tidepools; photo by Tim Hauf.","Anacapa, Cathedral Cove; photo by Tim Hauf."]]
    private var islandNames: [String] = ["Santa Cruz Island","Anacapa Island"]
    
    @IBOutlet weak var HomeButton: UIButton!
    @IBOutlet weak var IslandName: UITextView!
    @IBOutlet weak var NavigationBarImageView: UIImageView!
    @IBOutlet weak var Caption: UITextView!
    @IBOutlet weak var PhotoImageView: UIImageView!
    @IBOutlet weak var MapButton: UIButton!
    @IBOutlet weak var InfoButton: UIButton!
    @IBOutlet weak var AnchoragesButton: UIButton!
    @IBOutlet weak var ActivitiesButton: UIButton!
    @IBOutlet weak var MainPageButton: UIButton!
    @IBOutlet weak var PageControl: UIPageControl!
    @IBOutlet weak var MapLabel: UITextField!
    @IBOutlet weak var ActivitiesLabel: UITextField!
    @IBOutlet weak var InfoLabel: UITextField!
    @IBOutlet weak var AnchoragesLabel: UITextField!
    @IBOutlet weak var PhotoGalleryLabel: UITextField!
    @IBOutlet weak var HomeLabel: UITextField!
    internal var islandID: Int = 0
    private var swipeState: Bool = true  //right state
    internal var photoName: String!
    internal var photoIndex: Int!
    private let revealSequeId = "revealSegue"
    private let horizontalTransitionController = HorizontalTransitionController3()
    private let ccrossDissolveAnimationController = CCrossDissolveAnimationController()
    private var crossDissolveState: Bool = false
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("Got This Far!")
        print(segue.identifier)
        var checkString: String = (segue.identifier)!
        print(checkString.rangeOfString(revealSequeId) != nil)
        self.horizontalTransitionController.f1 = self.Caption.frame
        
        self.horizontalTransitionController.tv1 = self.Caption
        self.horizontalTransitionController.iv1 = self.PhotoImageView
        self.horizontalTransitionController.iv12 = self.NavigationBarImageView
        self.horizontalTransitionController.vname1 = self.islandCaptions[islandID][abs(photoIndex)]
        //self.horizontalTransitionController.iv13 = self.Clickhere
        self.horizontalTransitionController.pc = self.PageControl
        self.horizontalTransitionController.titletf1 = self.IslandName
        //self.horizontalTransitionController.titletf2 = self.TitleText2
        //self.horizontalTransitionController.titletf3 = self.TitleText3
        self.horizontalTransitionController.tfarr = [MapLabel,AnchoragesLabel,ActivitiesLabel,InfoLabel,PhotoGalleryLabel,HomeLabel]
        var dphotoIndex: Int = 0
        if checkString.rangeOfString("reveal") != nil, let destinationViewController = segue.destinationViewController as? IslandPhotoCommentViewController2 {
            print("Got this far again")
            destinationViewController.transitioningDelegate = self
            print("Segue2 used!")
            print("Segue2 used!")
            //self.islandsPhotos[islandID].count
            if checkString.rangeOfString(revealSequeId) != nil{
                dphotoIndex = (photoIndex-1)%islandsPhotos[islandID].count
                if (photoIndex == 0){
                    dphotoIndex = islandsPhotos[islandID].count-1
                }
                destinationViewController.islandID = islandID
                destinationViewController.photoIndex = dphotoIndex
                destinationViewController.photoName = islandsPhotos[islandID][abs(dphotoIndex)]
                self.horizontalTransitionController.vname2 = islandCaptions[islandID][abs(dphotoIndex)]
                swipeState = true
                
            }
            else{
                dphotoIndex = (photoIndex+1)%islandsPhotos[islandID].count
                destinationViewController.islandID = islandID
                destinationViewController.photoIndex = dphotoIndex
                destinationViewController.photoName = islandsPhotos[islandID][abs(dphotoIndex)]
                self.horizontalTransitionController.vname2 = self.islandCaptions[islandID][abs(dphotoIndex)]
                swipeState = false
            }
            destinationViewController.loadView()
            self.horizontalTransitionController.tv2 = destinationViewController.Caption
            self.horizontalTransitionController.iv2 = destinationViewController.PhotoImageView
            self.horizontalTransitionController.iv22 = destinationViewController.NavigationBarImageView
            
            self.horizontalTransitionController.f2 = destinationViewController.Caption.frame
            
            self.horizontalTransitionController.swipeDirection = swipeState
            self.horizontalTransitionController.pc2 = destinationViewController.PageControl
            destinationViewController.PageControl.currentPage = abs(dphotoIndex)
            self.horizontalTransitionController.titletf12 = destinationViewController.IslandName
            //self.horizontalTransitionController.titletf22 = destinationViewController.TitleText2
            //self.horizontalTransitionController.titletf32 = destinationViewController.TitleText3
            self.horizontalTransitionController.tfarr2 = [destinationViewController.MapLabel,destinationViewController.AnchoragesLabel,destinationViewController.ActivitiesLabel,destinationViewController.InfoLabel,destinationViewController.PhotoGalleryLabel,destinationViewController.HomeLabel]
        }
        /*
        if segue.identifier == "Highlightsseque", let destinationViewController = segue.destinationViewController as? DataViewController {
            
            destinationViewController.transitioningDelegate = self
            destinationViewController.loadView()
            destinationViewController.enabledisableHighlights()
            self.crossDissolveState = true
        }
        if segue.identifier == "Planningseque", let destinationViewController = segue.destinationViewController as? DataViewController {
            
            destinationViewController.transitioningDelegate = self
            destinationViewController.loadView()
            destinationViewController.enablePlanning()
            self.crossDissolveState = true
        }
        if segue.identifier == "Infoseque", let destinationViewController = segue.destinationViewController as? DataViewController {
            
            destinationViewController.transitioningDelegate = self
            destinationViewController.loadView()
            destinationViewController.enableInfo()
            self.crossDissolveState = true
        }
        if segue.identifier == "Mapseque", let destinationViewController = segue.destinationViewController as? DataViewController {
            
            destinationViewController.transitioningDelegate = self
            destinationViewController.loadView()
            enableMap()
            self.crossDissolveState = true
        }
        */
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let photoName = photoName {
            self.PhotoImageView.image = UIImage(named: photoName)
        }
        if photoIndex != nil{
            self.Caption.text = islandCaptions[islandID][abs(photoIndex)]
            self.PageControl.currentPage = abs(photoIndex)
            //self.TitleText1.font = UIFont(name:"TrajanPro-Regular", size: 81)
            //self.TitleText2.font = UIFont(name:"TrajanPro-Regular", size: 55)
            //self.TitleText3.font = UIFont(name:"TrajanPro-Regular", size: 55)
        }
        self.IslandName.text = self.islandNames[self.islandID]
        self.PageControl.numberOfPages = islandCaptions[islandID].count
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool){
        super.viewWillAppear(animated)
        if let photoName = photoName {
            self.PhotoImageView.image = UIImage(named: photoName)
        }
        if photoIndex != nil{
            self.Caption.text = islandCaptions[islandID][abs(photoIndex)]
            self.PageControl.currentPage = abs(photoIndex)
            //self.TitleText1.font = UIFont(name:"TrajanPro-Regular", size: 81)
            //self.TitleText2.font = UIFont(name:"TrajanPro-Regular", size: 55)
            //self.TitleText3.font = UIFont(name:"TrajanPro-Regular", size: 55)
        }
        self.IslandName.text = self.islandNames[self.islandID]
        self.PageControl.numberOfPages = islandCaptions[islandID].count
    }
    
    @IBAction func MapClicked(sender: AnyObject) {
        if islandID == 0{
            //let window = UIWindow(frame: UIScreen.mainScreen().bounds)
            let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewControllerWithIdentifier("sc") as! SantaCruzViewController
            vc.transitioningDelegate = self
            vc.loadView()
            vc.viewDidLoad()
            vc.enableMapwA()
            self.crossDissolveState = true
            self.presentViewController(vc, animated: true, completion: nil)
        }
        else if islandID == 1{
            let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewControllerWithIdentifier("ac") as! AnacapaViewController
            vc.transitioningDelegate = self
            vc.loadView()
            vc.viewDidLoad()
            vc.enableMapwA()
            self.crossDissolveState = true
            self.presentViewController(vc, animated: true, completion: nil)
            
        }
        //vc.resultsArray = self.resultsArray
           //let navigat = UINavigationController()
            ///navigat.pushViewController(vc, animated: false)
            //window.rootViewController = navigat
            //window.makeKeyAndVisible()
            //self.navigationController?.pushViewController(vc, animated:true)
        
    }
    
    @IBAction func InfoClicked(sender: AnyObject) {
        if islandID == 0{
            
            let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewControllerWithIdentifier("sc") as! SantaCruzViewController
            vc.transitioningDelegate = self
            vc.loadView()
            vc.viewDidLoad()
            vc.enableInfowA()
            self.crossDissolveState = true
            self.presentViewController(vc, animated: true, completion: nil)
        }
        
        else if islandID == 1{
            let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewControllerWithIdentifier("ac") as! AnacapaViewController
            vc.transitioningDelegate = self
            vc.loadView()
            vc.viewDidLoad()
            vc.enableInfowA()
            self.crossDissolveState = true
            self.presentViewController(vc, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func AnchoragesClicked(sender: AnyObject) {
        if islandID == 0{
            
            let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewControllerWithIdentifier("sc") as! SantaCruzViewController
            vc.transitioningDelegate = self
            vc.loadView()
            vc.viewDidLoad()
            vc.enableAnchorageswA()
            self.crossDissolveState = true
            self.presentViewController(vc, animated: true, completion: nil)
        }
        else if islandID == 1{
            let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewControllerWithIdentifier("ac") as! AnacapaViewController
            vc.transitioningDelegate = self
            vc.loadView()
            vc.viewDidLoad()
            vc.enableAnchorageswA()
            self.crossDissolveState = true
            self.presentViewController(vc, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func ActivitiesClicked(sender: AnyObject) {
        if islandID == 0{
            
            let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewControllerWithIdentifier("sc") as! SantaCruzViewController
            vc.transitioningDelegate = self
            vc.loadView()
            vc.viewDidLoad()
            vc.enableActivitieswA()
            self.crossDissolveState = true
            self.presentViewController(vc, animated: true, completion: nil)
        }
        else if islandID == 1{
            let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewControllerWithIdentifier("ac") as! AnacapaViewController
            vc.transitioningDelegate = self
            vc.loadView()
            vc.viewDidLoad()
            vc.enableActivitieswA()
            self.crossDissolveState = true
            self.presentViewController(vc, animated: true, completion: nil)
            
        }
        
    }
    
    @IBAction func HomeClicked(sender: AnyObject) {
        if islandID == 0{
            
            let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewControllerWithIdentifier("sc") as! SantaCruzViewController
            vc.transitioningDelegate = self
            vc.loadView()
            vc.viewDidLoad()
            //vc.enableActivitieswA()
            self.crossDissolveState = true
            self.presentViewController(vc, animated: true, completion: nil)
        }
        else if islandID == 1{
            let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewControllerWithIdentifier("ac") as! AnacapaViewController
            vc.transitioningDelegate = self
            vc.loadView()
            vc.viewDidLoad()
            //vc.enableInfowA()
            self.crossDissolveState = true
            self.presentViewController(vc, animated: true, completion: nil)
            
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

extension IslandPhotoCommentViewController: UIViewControllerTransitioningDelegate {
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        //horizontalTransitionController.originFrame = CardView.frame
        //horizontalTransitionController.swipeDirection = self.swipeState
        if self.crossDissolveState{
            return ccrossDissolveAnimationController
        }
        return horizontalTransitionController
    }
}
