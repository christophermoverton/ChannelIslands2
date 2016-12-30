//
//  SanMiguelViewController.swift
//  ChannelIsland
//
//  Created by Christopher Overton on 8/30/16.
//  Copyright © 2016 Christopher Overton. All rights reserved.
//

import UIKit
class SanMiguelViewController: UIViewController, UITextViewDelegate {

    private let revealSequeId = "revealSegue"
    private var swipeState: Bool = true  //right state
    private let horizontalTransitionController = HorizontalTransitionController()
    private let iname1 = "bar1"
    private let iname2 = "bar2"
    var imageArray: [UIImage] = []
    @IBOutlet weak var Barview: UIImageView!
    @IBOutlet weak var TitleText: UITextView!
    let vname: String = "San Miguel Island"
    @IBOutlet weak var Logoview: UIImageView!
    @IBOutlet weak var Clickhere: UIImageView!
    @IBOutlet weak var NavBar: UIImageView!
    @IBOutlet weak var IView: UIImageView!
    @IBOutlet weak var IView2: UIImageView!
    @IBOutlet weak var CloseTV: UITextView!
    @IBOutlet weak var InfoButton: UIButton!
    @IBOutlet weak var AnchorageButton: UIButton!
    @IBOutlet weak var ActivitiesButton: UIButton!
    @IBOutlet weak var ActivitiesBar: UIImageView!
    private var infoActive: Bool = false
    private var anchorageActive: Bool = false
    private var activitiesActive: Bool = false
    
    private var MapView: UIView!
    private var pageIVs2: [[UIImageView!]] = [[UIImageView!]]() // side photos
    private var capPagTVs2: [[UITextView!]] = [[UITextView!]]()
    private var pageIVs3: [[UIImageView!]] = [[UIImageView!]]()  //side photos 2nd page
    private var capPagTVs3: [[UITextView!]] = [[UITextView!]]()
    private var actPagHeaders: [UITextView!] = [UITextView!]()  //beyond main text view
    private var actPagHeaders2: [UITextView!] = [UITextView!]()//
    private var actPagMInfo: [UIImageView] = [UIImageView]()
    private var actPagMInfo2: [UIImageView] = [UIImageView]()
    private var actPagMInfoB: [UIButton] = [UIButton]()
    private var actPagMInfoB2: [UIButton] = [UIButton]()
    private var PageTextView2: UITextView!
    private var PageTextView3: UITextView!
    private var PageScrollView2: FadeScrollVIew!
    private var PageScrollView3: FadeScrollVIew!
    private var actpageTableView1: UITableView = UITableView()
    private var actpageTableView2: UITableView = UITableView()
    private var actpageTableView12: UITableView = UITableView()
    private var actpageTableView22: UITableView = UITableView()
    
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
    @IBOutlet weak var DismissPage: UIButton!
    private var Infotextstrings: [String] = ["INFO\n\n","Windswept San Miguel Island is the westernmost Channel Island, where colder waters support marine species not found on the more southern islands. Those of you who embark on the long ride out—often in a steady headwind—are likely to be richly rewarded. Wildlife watching is top notch, and San Miguel offers excellent game fishing when the weather is calm. This island is also an important haul-out and breeding site for pinnipeds, including northern elephant seals, California sea lions, and harbor seals."]
    
    private var InfoAttributes : [[String: AnyObject]] = [[NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSBackgroundColorAttributeName: UIColor.clearColor(),
        NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 24.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
         NSBackgroundColorAttributeName: UIColor.clearColor(),
         NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!]]
    private var Anchoragestextstrings: [String] = ["ANCHORAGES\n\n","Cuyler Harbor\n\n","Cuyler Harbor is San Miguel’s only anchorage. It’s gorgeous, shielded by high cliffs, and may be the most beautiful spot to drop your hook in all the Channel Islands. There is no pier, so landings are usually done in a dinghy. The sandy beach is beautiful. With 30-knot winds as the norm, the wind can still sweep down over the high cliffs and make things tricky for sailors. As is always recommended, check the weather forecast before coming out. \n\n","Boating Safety\n\n","There are no public moorings or all-weather anchorages on any of the Channel Islands. It is recommended that one capable person stay on board at all times. Boaters are responsible for any damage to the resources caused by their boat. "]
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
    private var Activitiestextstrings: [String] = ["Activities\n\n","Boating and Kayaking\n\n","Boating\n","\t•On calm days, boaters will find isolated, windswept stretches of white sandy beaches and great fishing. If you go around the western point of the island, you’ll see thousands of seals hauled out on the beach at Point Bennett.\n\t•When San Miguel is shrouded in fog and surrounded by rocky shoreline, it can be a mariner’s nightmare. Consider another destination!\n\n\nKayaking\t•Cuyler Harbor is generally the most sheltered place to kayak.\n\t•San Miguel often gets 30-knot winds and is pounded by surf year-round, so kayaking is recommended for expert strong kayakers only.\n\n","Wildlife Watching\n\n","\t•If you choose to make the 16-mile round trip, ranger-guided hike to Point Bennett, you’ll be rewarded with an amazing sight: some 30,000 seals and sea lions, hauled out on the beach, pups frolicking. You’ll want binoculars or long lens cameras.\n\n\t•The seabird watching can be extraordinary. Prince Island in Cuyler Harbor is a bird watcher’s dream. Land birds are best spotted in Nidever Canyon, accessed from the trail between Cuyler Harbor and the campsite.\n\n,","Fishing\n\n","\t•Great sport fishing opportunities await, weather permitting.\n\n\t•San Miguel Island consistently produces incredible catches of rockfish, lingcod, calico bass, white sea bass and halibut.\n\n\t•When weather conditions are favorable, San Miguel offers the greatest variety of cold and warm water sport fishing in Southern California.\n\n\t•Sport fishing outside marine protected areas requires possession of a valid California state fishing license with an ocean enhancement stamp.\n\n\t•All California Department of Fish and Game regulations apply.\n\n","Diving, Snorkeling, and Swimming","\n\nDiving\n\n","Divers on San Miguel have many options, most of which are dependent upon calm weather. The northwest side of the island has the richest variety of marine life and can be amazing. The east side at Cuyler Harbor is nice and calm, but tends to have less sea life.  In good weather, usually during autumn, diving is great with spectacular clarity.\n\n","Snorkeling\n","Snorkeling is usually good at Cuyler as well, with a rocky reef, kelp forest, and soft sandy bottoms. Be aware that the water is cold: 44-52˙ F (7-11˙ C).\n\n,","Swimming\n\n","Swimmers will love the white sand beaches and easy entry to the water at Cuyler Harbor.\n\n","Hiking\n\n\t","•Visitors can explore the two-mile long Cuyler Harbor beach and the one-mile long trail to the ranger station on their own.\n\t•To see other parts of the island, such as Point Bennett or the Caliche Rorest, the rangers will be available to guide you.\n\t•Ranger-guided hikes are offered during the weekends that campers are present.\n\t•All hikers must stay on trails to protect fragile vegetation making a comeback. No off-trail hiking.\n\t•The island was used by the military as a bombing target, so if you ever see old ordnance, tell the ranger!\n\n","Camping\n\n\t","•Primitive camping is available near the Lester Ranch site.\n\t•Reserve your site well in advance at recreation.gov. Concession boats fill to capacity more quickly than campground sites are filled, so book your boat transportation for overnight trips first.\n\t•The campground is a little over one mile up the bluffs from the beach, where you will be dropped off by ferry operators. You may get wet during landing.\n\t•Remember that you’ll be hauling all your gear from the beach, so bring essentials only.\n\t•The park provides windbreaks, picnic tables, storage boxes for food, and pit toilets.30-knot winds are common. Bring tent stakes.\n\t•Remember to pack in your own water.\n\n"]
    private var ActivitiesAttributes : [[String: AnyObject]] = [[NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSBackgroundColorAttributeName: UIColor.clearColor(),
        NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 28.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSBackgroundColorAttributeName: UIColor.clearColor(),
        NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 24.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSBackgroundColorAttributeName: UIColor.clearColor(),
        NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!],
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
        NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!],
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
    
    
    private let photonames: [String] = ["SMimage009","SM_SmallMap"]
    private let activitiesphotonames: [String] = ["SMimage012","SMimage014","SMimage016","SMimage018","SMimage020","SMimage022","SMimage024","SMimage026","SMimage028","SMimage030","SMimage032","SMimage034","SMimage036","SMimage038","SMimage040","SMimage042","SMimage047","SMimage049","SMimage051","SMimage053","SMimage055","SMimage057"]
    private let infophotonames: [String] = ["SMimage003","SMimage005","SMimage007"]
    private var ActivitiesCaptiontextstrings: [String] = ["San Miguel Island, with Cuyler Bay on a calm day; Desiree Cassell/NPS","San Miguel Island, Point Bennett pinnipeds hauled out on the beach; photo by Tim Hauf","Wildflowers on San Miguel; NPS (top right photo by Tim Hauf)","Hiking San Miguel Island; hikingSanMiguel-npsgalleryfoto.jpg","The Island fox is sometimes seen around the campground; photo by Tim Hauf","San Miguel Island, approaching Cuyler’s Harbor; smi-cuylers-approach.jpg","San Miguel Island, Point Bennett, Anchor of the wreck; Mark Norder-NOAA","San Miguel Island, Cuyler Harbor Beach; PD photo","The Caliche Forest; the ghostly remnants of ancient trees cast in sand.","San Miguel Island, typical campsite; PD photo","","San Miguel Island, Cuyler Harbor; Channel_Islands_National_Park_CHIS8069.jpg","San Miguel Island, buckwheat; PD photo","San Miguel, Point Bennett; seals and sea lions resting on the beach; PD","Colder ocean temperatures wrap around San Miguel; NOAA graphic","Seals curious about divers at San Miguel Island; NOAA photo","San Miguel Island Cardwell Point Trail-Bob-Schwemmer.jpg","San Miguel Island archeological sites; NPS photo","San Miguel Island, approaching the campsite; PD photo","San Miguel Island campsite; photo by Tim Hauf","San Miguel Island campsite view; PD photo, viewfrom-smi-campsite.jpg","San Miguel Island, Cabrillo Monument; photo by Tim Hauf"]
    
    private var AnchoragesCaptiontextstrings: [String] = ["San Miguel Island, Cuyler Harbor from Lester Point Trail; PD",""]
    
    private var InfoCaptiontextstrings: [String] = ["San Miguel Island, landing skiff drop-offs and pickups, Culyer Beach; photo by Tim Hauf","San Miguel Island, hiking down to Cuyler Beach, the landing site.","San Miguel Island, Point Bennett, Pinnipeds hauled out on the beach; PD photo"]
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("Got This Far!")
        print(segue.identifier)
        var checkString: String = (segue.identifier)!
        print(checkString.rangeOfString(revealSequeId) != nil)
        self.horizontalTransitionController.f1 = self.TitleText.frame
        self.horizontalTransitionController.vname1 = "San Miguel Island"
        self.horizontalTransitionController.tv1 = self.TitleText
        self.horizontalTransitionController.iv1 = self.Barview
        self.horizontalTransitionController.iv12 = self.Logoview
        self.horizontalTransitionController.iv13 = self.Clickhere
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if checkString.rangeOfString("Segue") != nil{
            self.horizontalTransitionController.swipeDirection = false
        }
        else{
            let vc = storyboard.instantiateViewControllerWithIdentifier("SantaRosaViewC") as! SantaRosaViewController
            
            
            
            self.horizontalTransitionController.vname2 = vc.vname

            //vc.TitleText.hidden = true
            //vc.Barview.hidden = true
            print("hit Seque")
            self.horizontalTransitionController.swipeDirection = true
            self.horizontalTransitionController.iname1 = iname1
            self.horizontalTransitionController.iname2 = iname2
        }
        if checkString.rangeOfString("reveal") != nil, let destinationViewController = segue.destinationViewController as? SantaRosaViewController {
            print("Got this far again")
            destinationViewController.transitioningDelegate = self
            destinationViewController.loadView()
            print("Segue2 used!")
            self.horizontalTransitionController.tv2 = destinationViewController.TitleText
            self.horizontalTransitionController.iv2 = destinationViewController.Barview
            self.horizontalTransitionController.iv22 = destinationViewController.Logoview
            self.horizontalTransitionController.iv23 = destinationViewController.Clickhere
            self.horizontalTransitionController.f2 = destinationViewController.TitleText.frame
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.PageScrollView.contentSize.height = 1900
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

        
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
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
    
        //self.dataLabel!.text = dataObject
    }
    
    @IBAction func DismissPageClicked(sender: AnyObject) {
        self.enablemainpageTransition()
    }
    
    @IBAction func InfoClicked(sender: AnyObject) {
        self.enableInfo()
    }
    
    @IBAction func AnchorageClicked(sender: AnyObject) {
        self.enableAnchorages()
    }
    
    @IBAction func ActivitiesClicked(sender: AnyObject) {
        self.enableActivities()
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

extension SanMiguelViewController: UIViewControllerTransitioningDelegate {
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        //horizontalTransitionController.originFrame = CardView.frame
        //horizontalTransitionController.swipeDirection = self.swipeState
        return horizontalTransitionController
    }
}