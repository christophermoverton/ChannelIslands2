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
    private var Highlight1Active = false
    private var Highlight2Active = false
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
    @IBOutlet weak var Highlight1ScrollView: UIScrollView!
    @IBOutlet weak var Highlight1Title: UITextView!
    @IBOutlet weak var Highlight1Logo: UIImageView!
    @IBOutlet weak var TextView1: UITextView!
    @IBOutlet weak var WaterAnimView: UIView!
    @IBOutlet weak var Caption1: UITextView!
    @IBOutlet weak var Caption2: UITextView!
    @IBOutlet weak var Highlight1Image: UIImageView!
    @IBOutlet weak var Highlight1Image2: UIImageView!
    @IBOutlet weak var Highlight3Button: UIButton!
    @IBOutlet weak var Highlight4Button: UIButton!
    @IBOutlet weak var Highlight5Button: UIButton!
    @IBOutlet weak var Highlight6Button: UIButton!
    @IBOutlet weak var Highlight7Button: UIButton!
    @IBOutlet weak var Highlight8Button: UIButton!
    
    @IBOutlet weak var Highlight2Button: UIButton!
    
    @IBOutlet weak var Highlight1Button: UIButton!
    @IBOutlet weak var DismissHighlight1: UIButton!
    private var Highlighttextstrings: [[String]] = [["Visitor Center & Channel Islands Live\n\n","Begin your discovery of the Channel Islands at the Robert J. Lagomarsino Visitor Center, featuring exhibits, a native plant garden, a park film, and bookstore. Tour the islands via Channel Islands Live, featuring ranger-led virtual hikes and dives, interactive broadcasts, and webcams. The fully accessible facility operates daily except Thanksgiving and December 25th."],["Anacapa: Three Islands in One\n\n","Just 14 miles from Ventura, rugged and rocky Anacapa attracts experienced boaters, kayakers, divers, snorkelers, and day-trippers alike. Visit the iconic lighthouse and look for the original Fresnel lens inside the Visitor Center. Gorgeous views, hikes, and abundant birdlife on Anacapa’s three islets make it a must-see destination. Concession ferry operators offer full- and half-day trips year-round.\n\nWeather and Safety\n\n \u{2022} There are no all-weather anchorages around the islands. One capable person should stay on board the boat at all times.\n\n \u{2022} Boaters are responsible for any damage to the resources caused by their boat.\n\n \u{2022} Private boaters may land on all five islands within the national park year round.\n\n \u{2022} There are no landing permits required for the Channel Islands, except for the Nature Conservancy property on Santa Cruz Island and San Miguel Island. Please refer to the Channel Islands National Park newspaper and website for closed and restricted areas ((805) 658-5730 www.nps.gov/chis)\n\n \u{2022} Boaters should contact the park ranger on Channel 16 before landing.\n\n \u{2022} Be aware there is no personal watercraft are allowed within 1 mile of the National Park."],["Scorpion Harbor Anchorages\n\n","Just 20 miles from Ventura, California’s largest Channel Island has it all, from one of the world’s largest sea caves to critters found nowhere else on Earth, like the island scrub jay and island fox. Scorpion Harbor is a great day-trip destination for boaters, kayakers, snorkelers, divers, hikers, and picnickers, as well as an over-night destination for campers. Ferry operators offer full- and half-day trips year-round.\n\nWeather and Safety\n\n \u{2022} There are no all-weather anchorages around the islands. One capable person should stay on board the boat at all times.\n\n \u{2022} Boaters are responsible for any damage to the resources caused by their boat.\n\n \u{2022} Private boaters may land on all five islands within the national park year round.\n\n \u{2022} There are no landing permits required for the Channel Islands, except for the Nature Conservancy property on Santa Cruz Island. Please refer to the Channel Islands National Park newspaper and website for closed and restricted areas ((805) 658-5730 www.nps.gov/chis)\n\n  \u{2022} Boaters should contact the park ranger on Channel 16 before landing.\n\n  \u{2022} Be aware personal watercraft are not allowed within 1 mile of the National Park."],["Smugglers Cove\n\n","Santa Cruz Island shipwreck and diver, Channel Islands National Marine Sanctuary\n\nLocated on the northeastern tip of Santa Cruz, Smugglers Cove offers anchorages and adventures for skilled boaters. Watersports include kayaking, diving, and sport fishing in permitted areas. Onshore activities include hiking, picnicking, and wildlife watching. Anchorages at Smugglers Cove are not all-weather.\n\nWeather and Safety\n\n  \u{2022} There are no all-weather anchorages around the islands. One capable person should stay on board the boat at all times.\n\n  \u{2022} Boaters are responsible for any damage to the resources caused by their boat.\n\n  \u{2022} Private boaters may land on all five islands within the national park year round.\n\n  \u{2022} No landing permits are required for the Channel Islands, except for the Nature Conservancy property on Santa Cruz Island and San Miguel Island. Please refer to the Channel Islands National Park newspaper and website for closed and restricted areas ((805) 658-5730 www.nps.gov/chis)\n\n  \u{2022} Boaters should contact the park ranger on Channel 16 before landing.\n\n  \u{2022} Be aware that personal watercraft are not allowed within 1 mile of the National Park."],["Painted Cave\n\n","One of the world’s largest painted caves is accessible from the northwestern tip of Santa Cruz. Guided tours and expert kayakers enjoy stunning scenery and natural wonder in the 1215-foot long cave. It formed along the Santa Cruz Island fault. A waterfall flows over the entrance in the springtime.\n\nWeather and Safety\n\n  \u{2022} There are no all-weather anchorages around the islands. One capable person should stay on board the boat at all times.\n\n  \u{2022} Boaters are responsible for any damage to the resources caused by their boat.\n\n  \u{2022} Private boaters may land on all five islands within the national park year round.\n\n  \u{2022} There are no landing permits required for the Channel Islands, except for the Nature Conservancy property on Santa Cruz Island. Please refer to the Channel Islands National Park newspaper and website for closed and restricted areas ((805) 658-5730 www.nps.gov/chis)\n\n  \u{2022} Boaters should contact the park ranger on Channel 16 before landing.\n\n  \u{2022} Be aware that personal watercraft are not allowed within 1 mile of the National Park."],["Point Bennett\n\n","Only for hardy adventurers, this destination can be difficult to reach—requiring a 4-hour boat ride and a 16-mile hike—but well worth the effort. Here you can view one of the largest concentrations of wildlife in the world with over 30,000 seals and sea lions and up to five different species of pinnipeds. Ferry operators run trips spring through fall. Boaters can anchor in Cuyler Harbor and hike to Pt. Bennett. Landing permits are required on San Miguel Island; for more information, visit: https://www.nps.gov/chis/index.htm\n\nWeather and Safety\n\n  \u{2022} There are no all-weather anchorages around the islands. One capable person should stay on board the boat at all times.\n\n  \u{2022} Boaters are responsible for any damage to the resources caused by their boat.\n\n  \u{2022} Private boaters may land on all five islands within the national park year round.\n\n  \u{2022} No landing permits are required for the Channel Islands, except for the Nature Conservancy property on Santa Cruz Island and San Miguel Island. Please refer to the Channel Islands National Park newspaper and website for closed and restricted areas ((805) 658-5730 www.nps.gov/chis)\n\n  \u{2022} Boaters should contact the park ranger on Channel 16 before landing."],["Torrey Pines\n\n","Located 40 miles from Ventura, Santa Rosa is a little harder to get to but well worth the effort. See one of the rarest trees in the world and enjoy views of Bechers Bay. If you love beach walking, Santa Rosa won’t disappoint. Windy conditions often discourage watersports. Island Packers runs trips spring through fall. Boaters can land passengers on Bechers Bay Pier and anchor in the cove.\n\nWeather and Safety\n\n  \u{2022} There are no all-weather anchorages around the islands. One capable person should stay on board the boat at all times.\n\n  \u{2022} Boaters are responsible for any damage to the resources caused by their boat.\n\n  \u{2022} Private boaters may land on all five islands within the national park year round.\n\n  \u{2022} There are no landing permits required for the Channel Islands, except for the Nature Conservancy property on Santa Cruz Island. Please refer to the Channel Islands National Park newspaper and website for closed and restricted areas ((805) 658-5730 www.nps.gov/chis)\n\n  \u{2022} Boaters should contact the park ranger on Channel 16 before landing.\n\n  \u{2022} Be aware that personal watercraft are not allowed within 1 mile of the National Park."],["Landing Cove\n\n","If you’re up for a 54-mile trek from Ventura (or 38 miles from San Pedro), you’ll appreciate the smallest and most remote Channel Island. One-square-mile Santa Barbara Island is home to large colonies of seabirds, sea lions, and seals. Putting in at Landing Cove rewards self-sufficient kayakers, ready to discover a windswept gem. Ferry operators run trips spring through fall.  Boaters can access the island at Landing Cove.\n\nWeather and Safety\n\n  \u{2022} There are no all-weather anchorages around the islands. One capable person should stay on board the boat at all times.\n\n  \u{2022} Boaters are responsible for any damage to the resources caused by their boat.\n\n  \u{2022} Private boaters may land on all five islands within the national park year round.\n\n  \u{2022} No landing permits are required for the Channel Islands, except for the Nature Conservancy property on Santa Cruz Island and San Miguel Island. Please refer to the Channel Islands National Park newspaper and website for closed and restricted areas ((805) 658-5730 www.nps.gov/chis)\n\n  \u{2022} Boaters should contact the park ranger on Channel 16 before landing.\n\n  \u{2022} Be aware that personal watercraft are not allowed within 1 mile of the National Park."]]
    private var HighlightAttributes : [[[String: AnyObject]]] = [[[NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSBackgroundColorAttributeName: UIColor.clearColor(),
        NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 24.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!]],[[NSForegroundColorAttributeName: UIColor.whiteColor(),
                NSBackgroundColorAttributeName: UIColor.clearColor(),
                NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 24.0)!],
                [NSForegroundColorAttributeName: UIColor.whiteColor(),
                    NSBackgroundColorAttributeName: UIColor.clearColor(),
                    NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!]],
                [[NSForegroundColorAttributeName: UIColor.whiteColor(),
                        NSBackgroundColorAttributeName: UIColor.clearColor(),
                        NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 24.0)!],
                        [NSForegroundColorAttributeName: UIColor.whiteColor(),
                            NSBackgroundColorAttributeName: UIColor.clearColor(),
                            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!]],
                [[NSForegroundColorAttributeName: UIColor.whiteColor(),
                    NSBackgroundColorAttributeName: UIColor.clearColor(),
                    NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 24.0)!],
                    [NSForegroundColorAttributeName: UIColor.whiteColor(),
                        NSBackgroundColorAttributeName: UIColor.clearColor(),
                        NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!]],
                [[NSForegroundColorAttributeName: UIColor.whiteColor(),
                    NSBackgroundColorAttributeName: UIColor.clearColor(),
                    NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 24.0)!],
                    [NSForegroundColorAttributeName: UIColor.whiteColor(),
                        NSBackgroundColorAttributeName: UIColor.clearColor(),
                        NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!]],
                [[NSForegroundColorAttributeName: UIColor.whiteColor(),
                    NSBackgroundColorAttributeName: UIColor.clearColor(),
                    NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 24.0)!],
                    [NSForegroundColorAttributeName: UIColor.whiteColor(),
                        NSBackgroundColorAttributeName: UIColor.clearColor(),
                        NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!]],
                [[NSForegroundColorAttributeName: UIColor.whiteColor(),
                    NSBackgroundColorAttributeName: UIColor.clearColor(),
                    NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 24.0)!],
                    [NSForegroundColorAttributeName: UIColor.whiteColor(),
                        NSBackgroundColorAttributeName: UIColor.clearColor(),
                        NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!]],
                [[NSForegroundColorAttributeName: UIColor.whiteColor(),
                    NSBackgroundColorAttributeName: UIColor.clearColor(),
                    NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 24.0)!],
                    [NSForegroundColorAttributeName: UIColor.whiteColor(),
                        NSBackgroundColorAttributeName: UIColor.clearColor(),
                        NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!]]]
    private var HighlightCaptiontextstrings: [[String]] = [["Channel Islands Live presentation (NPS, photo by Bill Kendig )", "Bald Eagle web cam view (NPS)"],["Anacapa Island, lighthouse springtime flowers"],["Island Packers ferry service at Scorpion Bay, Santa Cruz Island (photo by Tim Hauf)"],["Smugglers Cove, Santa Cruz Island (photo by Tim Hauf)","Smugglers Cove with sailboats, Santa Cruz Island"],[""],["Pinnipeds haul out at Point Bennett, San Miguel Island (NPS)","Cuyler Bay, San Miguel Island"],["Torrey Pines and Bechers Bay, Santa Rosa Island (NPS)"],["Snorkelers at Landing Cove, Santa Barbara Island (photo by Tim Hauf)","Sea lion rookery, Santa Barbara Island (NPS)"]]
    private var HighlightCaptionAttributes : [[[String: AnyObject]]] = [[[NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSBackgroundColorAttributeName: UIColor.clearColor(),
        NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 16.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 16.0)!]],
                [[NSForegroundColorAttributeName: UIColor.whiteColor(),
                NSBackgroundColorAttributeName: UIColor.clearColor(),
                NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 16.0)!]],
                [[NSForegroundColorAttributeName: UIColor.whiteColor(),
                    NSBackgroundColorAttributeName: UIColor.clearColor(),
                    NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 16.0)!]],
                [[NSForegroundColorAttributeName: UIColor.whiteColor(),
                    NSBackgroundColorAttributeName: UIColor.clearColor(),
                    NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 16.0)!],
                    [NSForegroundColorAttributeName: UIColor.whiteColor(),
                        NSBackgroundColorAttributeName: UIColor.clearColor(),
                        NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 16.0)!]],
                [[NSForegroundColorAttributeName: UIColor.whiteColor(),
                    NSBackgroundColorAttributeName: UIColor.clearColor(),
                    NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 16.0)!]],
                [[NSForegroundColorAttributeName: UIColor.whiteColor(),
                    NSBackgroundColorAttributeName: UIColor.clearColor(),
                    NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 16.0)!],
                    [NSForegroundColorAttributeName: UIColor.whiteColor(),
                        NSBackgroundColorAttributeName: UIColor.clearColor(),
                        NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 16.0)!]],
                [[NSForegroundColorAttributeName: UIColor.whiteColor(),
                    NSBackgroundColorAttributeName: UIColor.clearColor(),
                    NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 16.0)!]],
                [[NSForegroundColorAttributeName: UIColor.whiteColor(),
                    NSBackgroundColorAttributeName: UIColor.clearColor(),
                    NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 16.0)!],
                    [NSForegroundColorAttributeName: UIColor.whiteColor(),
                        NSBackgroundColorAttributeName: UIColor.clearColor(),
                        NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 16.0)!]]]
    private let photonames: [[String]] = [["Bald_Eagle_Web_Cam_View","Channel_Island_Live_Presentation"],["ANACAPA_LIGHTHOUSE","none"],["SCORPION_BAY","none"],["SMUGGLERS_COVE_1","SMUGGLERS_COVE_SAILBOATS"],["PAINTED_CAVE","none"],["PINNIPEDS_HAUL","CUYLER_BAY"],["TORREY_PINES","none"],["LANDING_COVE","ROOKERY"]]
    private var logonames: [String] = ["HIGHLIGHT_1_BIG", "HIGHLIGHT_2_BIG", "HIGHLIGHT_3_BIG","HIGHLIGHT_4_BIG","HIGHLIGHT_5_BIG","HIGHLIGHT_6_BIG","HIGHLIGHT_7_BIG","HIGHLIGHT_8_BIG"]
    private var HighlightTitlestrings: [String] = ["Channel Islands Live and\nChannel Islands National Park Visitor Center", " Anacapa Island", " Santa Cruz Island"," Santa Cruz Island"," Santa Cruz Island"," San Miguel Island"," Santa Rosa Island"," Santa Barbara Island"]
    
    
    
    private var HighlightTitleAttributes : [[String: AnyObject]] = [[NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSBackgroundColorAttributeName: UIColor.clearColor(),
        NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 33.0)!]]
    /*
    // create attributed string
    let myString = "Swift Attributed String"
    let myAttribute = [ NSForegroundColorAttributeName: UIColor.whiteColor()]
    let myAttrString = NSAttributedString(string: "Test string", attributes: myAttribute)
    
    // set attributed text on a UILabel
    TextView1.attributedText = myAttrString
    */
    
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
        if self.Highlight2Active{
            if segue.identifier == "AncToIsland"{
            }
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
        self.ScrollView.contentSize.height = 950
        self.ScrollView.hidden = true
        self.DismissInfo.hidden = true
        self.DismissPlanning.hidden = true
        self.ScrollView2.contentSize.height = 950
        self.ScrollView2.hidden = true
        self.CloseTV.hidden = true
        self.Highlight1ScrollView.contentSize.height = 950
        /*
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .Center
        self.HighlightTitleAttributes[0][NSParagraphStyleAttributeName]=paragraphStyle
        */
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
    
    override func viewDidAppear(animated: Bool){
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
        )//*/
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
        //WaterImg0.animationImages = imageArr2
        //WaterImg0.animationDuration = 6.0
        //WaterImg0.startAnimating()

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
                self.WaterAnimView.alpha = 1
            }
            self.ScrollView.alpha = 0
            self.IView2.alpha = 0
            self.CloseTV.alpha = 0
            self.Highlight1Title.alpha = 0
            }, completion: { finished in
                if (finished){
                    
                    
                    self.ScrollView.hidden = true
                    self.CloseTV.hidden = true
                    if self.HightlightsActive{
                        self.Highlight1Button.hidden = false
                    }
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
        /*
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
        */
        let lmystr = "Discover your Channnel Islands"
        let lmyAttributes = self.HighlightTitleAttributes[0]
        let lmyAttrString1 = NSAttributedString(string: lmystr,
                                                attributes: lmyAttributes)
        self.Highlight1Title.attributedText = lmyAttrString1
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
        if self.Highlight1Active{
            self.DismissHighlight1.hidden = true
        }
        if self.planningActive{
            self.PlanningLabel.textColor = UIColor.whiteColor()
        }
        UIView.animateWithDuration(2.0, delay: 0.0, options: .CurveEaseOut, animations: {
            self.IView.alpha = 0
            self.ScrollView.alpha = 1
            self.IView2.alpha = 1
            self.Highlight1Title.alpha = 1
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
            self.WaterAnimView.alpha = 0
            if self.HightlightsActive {
                self.HighlightNumbersView.alpha = 0
                
            }
            if self.Highlight1Active{
                self.Highlight1ScrollView.alpha = 0
                self.Highlight1Logo.alpha = 0
                //self.Highlight1Title.alpha = 0
            }
            if self.planningActive{
                self.ScrollView2.alpha = 0
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
                    if self.Highlight1Active{
                        self.Highlight1Active = false
                    }
                    if self.planningActive{
                        self.planningActive = false
                        self.DismissPlanning.hidden = true
                        self.ScrollView2.hidden = true
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
            self.Highlight1Button.hidden = true
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
            self.Highlight1Button.hidden = false
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
            let delay = 0.10 * Double(NSEC_PER_SEC)
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
            let delay2 = 0.20 * Double(NSEC_PER_SEC)
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
            let delay3 = 0.3 * Double(NSEC_PER_SEC)
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
            let delay4 = 0.4 * Double(NSEC_PER_SEC)
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
            let delay5 = 0.5 * Double(NSEC_PER_SEC)
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
            let delay6 = 0.6 * Double(NSEC_PER_SEC)
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
            let delay7 = 0.7 * Double(NSEC_PER_SEC)
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
    

    @IBAction func Highlight1Clicked(sender: AnyObject) {
        print("Clicked")
        self.enableHighlight1(0)
    }


    @IBAction func Highlight2Clicked(sender: AnyObject) {
        self.enableHighlight1(1)
        self.Highlight2Active = true
    }
    
    @IBAction func Highlight3Clicked(sender: AnyObject) {
        self.enableHighlight1(2)
        //self.Highlight2Active = true
    }
    
    
    @IBAction func Highlight4Clicked(sender: AnyObject) {
        self.enableHighlight1(3)
    }
    
    @IBAction func Highlight5Clicked(sender: AnyObject) {
        self.enableHighlight1(4)
    }
    
    @IBAction func Highlight6Clicked(sender: AnyObject) {
        self.enableHighlight1(5)
    }
    
    @IBAction func Highlight7Clicked(sender: AnyObject) {
        self.enableHighlight1(6)
    }
    
    @IBAction func HIghlight8Clicked(sender: AnyObject) {
        self.enableHighlight1(7)
    }
    
    func enableHighlight1(hlightID : Int){
        if self.infoActive {
            self.ScrollView2.hidden = false
            self.infoActive = false
            self.planningActive = true
            self.NavBar.image = UIImage(named: "CI_Main_Icon_Set_ALL_WHITE_V02")
            self.InfoLabel.textColor = UIColor.whiteColor()
            //self.PlanningLabel.textColor = UIColor.blackColor()
            UIView.animateWithDuration(2.0, delay: 0.0, options: .CurveEaseOut, animations: {
                
                self.ScrollView.alpha = 0
                self.ScrollView2.alpha = 1
                }, completion: { finished in
                    if (finished){
                        //self.PlanningButton.hidden = true
                        self.InfoButton.hidden = true
                        self.ScrollView.hidden = true
                        
                    }
            })
        }
        else{
            
            var captions: [UITextView!] = [self.Caption1, self.Caption2]
            var images: [UIImageView!] = [self.Highlight1Image, self.Highlight1Image2]
            var ihighlightstrs : [String] = self.Highlighttextstrings[hlightID]
            var i = 0
            let result = NSMutableAttributedString()
            self.Highlight1Logo.image = UIImage(imageLiteral: self.logonames[hlightID])
            var lmystr = self.HighlightTitlestrings[hlightID]
            var lmyAttributes = self.HighlightTitleAttributes[0]
            var lmyAttrString1 = NSAttributedString(string: lmystr,
                                                   attributes: lmyAttributes)
            self.Highlight1Title.attributedText = lmyAttrString1
            for ihighlightstr: String in ihighlightstrs{
                
                var myAttributes = self.HighlightAttributes[hlightID][i]
                var myAttrString1 = NSAttributedString(string: ihighlightstr,
                                                       attributes: myAttributes)
                result.appendAttributedString(myAttrString1)
                i+=1
            }
            self.TextView1.attributedText = result
            /*
            var str: String = Highlighttextstrings[0][0]
            var str2: String = Highlighttextstrings[0][1]
            var myAttributes = HighlightAttributes[0][0]
            var myAttrString1 = NSAttributedString(string: str, attributes: myAttributes)
            var myAttributes1 = HighlightAttributes[0][1]
            let myAttrString2 = NSAttributedString(string: str2, attributes: myAttributes1)
            let result = NSMutableAttributedString()
            result.appendAttributedString(myAttrString1)
            result.appendAttributedString(myAttrString2)
            */
            i = 0
            let skip : [[Bool]] = [[false,false],[false,true],[false,true],[false,false],[false,true],[false,false],[false,true],[false,false]]  //set skip on highlight photos
            let cihighlightstrs : [String] = self.HighlightCaptiontextstrings[hlightID]
            for cihighlightstr: String in cihighlightstrs{
                let cmyAttributes = self.HighlightCaptionAttributes[hlightID][i]
                let cmyAttrString1 = NSAttributedString(string: cihighlightstr,attributes: cmyAttributes)
                let caption  = captions[i]
                let Image = images[i]
                
                
                Image.image = UIImage(imageLiteral: self.photonames[hlightID][i])

                caption.attributedText = cmyAttrString1
                i+=1
            }
            i = 0
            for skipi : Bool in skip[hlightID]{
                let Image = images[i]
                let caption = captions[i]
                if skipi{
                    Image.alpha = 0
                    caption.alpha = 0
                }
                else{
                    Image.alpha = 1
                    caption.alpha = 1
                }
                i+=1
            }
            /*
            var cstr: String = HighlightCaptiontextstrings[0][0]
            var cstr2: String = HighlightCaptiontextstrings[0][1]
            var cmyAttributes = HighlightCaptionAttributes[0][0]
            var cmyAttrString1 = NSAttributedString(string: cstr, attributes: cmyAttributes)
            var cmyAttributes1 = HighlightCaptionAttributes[0][1]
            let cmyAttrString2 = NSAttributedString(string: cstr2, attributes: cmyAttributes1)
            */
            //let cresult = NSMutableAttributedString()
            //cresult.appendAttributedString(cmyAttrString1)
            //self.Caption1.attributedText = cmyAttrString1
            //self.Caption2.attributedText = cmyAttrString2
            self.Highlight1ScrollView.hidden = false
            self.CloseTV.hidden = false
            self.Highlight1Active = true
            /*
            if self.HightlightsActive {
                self.PlanningLabel.textColor = UIColor.blackColor()
                self.HighlightsLabel.textColor = UIColor.whiteColor()
            }
            else{
                self.PlanningLabel.textColor = UIColor.blackColor()
                self.MapsLabel.textColor = UIColor.whiteColor()
            }*/
            self.NavBar.image = UIImage(named: "CI_Main_Icon_Set_ALL_WHITE_V02")
            UIView.animateWithDuration(2.0, delay: 0.0, options: .CurveEaseOut, animations: {
                self.IView.alpha = 0
                self.Highlight1ScrollView.alpha = 1
                self.IView2.alpha = 1
                self.CloseTV.alpha = 1
                self.Highlight1Logo.alpha = 1
                self.Highlight1Title.alpha = 1
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
                self.WaterAnimView.alpha = 0
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
            self.DismissHighlight1.hidden = false
            self.PlanningButton.hidden = false
            self.InfoButton.hidden = false
            self.HighlightsButton.hidden = false
            self.PhotographyButton.hidden = false
        }
    }
    
    
    @IBAction func DismissHighlight1Clicked(sender: AnyObject) {
        self.dismissHighlight1()
    }
    
    func dismissHighlight1(){
        self.IView.hidden = false
        self.GreenDotAnimIView.hidden = false
        self.GreenDotAnimView2.hidden = false
        self.GreenDotAnimView3.hidden = false
        self.GreenDotAnimView4.hidden = false
        self.GreenDotAnimView5.hidden = false
        self.planningActive = false
        self.Highlight1Active = false
        if self.HightlightsActive {
            self.HighlightNumbersView.hidden = false
            self.NavBar.image = UIImage(named: "CI_Main_Icon_HIGHLIGHTS_V02")
            
        }
        else{
            self.NavBar.image = UIImage(named: "CI_Main_Icon_HOME_V02")
        }
        if self.HightlightsActive {
            //self.PlanningLabel.textColor = UIColor.whiteColor()
            self.HighlightsLabel.textColor = UIColor.blackColor()
        }
        else{
            //self.PlanningLabel.textColor = UIColor.whiteColor()
            self.MapsLabel.textColor = UIColor.blackColor()
        }


        //myAttrString1.append(myAttrString2)
        UIView.animateWithDuration(2.0, delay: 0.0, options: .CurveEaseOut, animations: {
            self.IView.alpha = 1
            self.Highlight1ScrollView.alpha = 0
            self.IView2.alpha = 0
            self.CloseTV.alpha = 0
            self.GreenDotAnimIView.alpha = 1
            self.GreenDotAnimView2.alpha = 1
            self.GreenDotAnimView3.alpha = 1
            self.GreenDotAnimView4.alpha = 1
            self.GreenDotAnimView5.alpha = 1
            self.Highlight1Logo.alpha = 0
            self.Highlight1Title.alpha = 0
            self.WaterAnimView.alpha = 1
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
                self.Highlight1Button.hidden = false
            }
            
            //self.HighlightNumbersView.alpha = 1
            }, completion: { finished in
                if (finished){
                    
                    self.ScrollView2.hidden = true
                    self.CloseTV.hidden = true
                    
                }
        })
        self.DismissHighlight1.hidden = true
        //self.DismissPlanning.hidden = true
        self.PlanningButton.hidden = false
        self.InfoButton.hidden = false
        self.HighlightsButton.hidden = false
        self.PhotographyButton.hidden = false
        print("Dismiss Highlights1 Button Pressed")
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
        if self.Highlight1Active{
            self.dismissHighlight1()
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
            self.WaterAnimView.alpha = 1
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
                self.Highlight1Button.hidden = false
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
        /*
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
        */
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
            if self.Highlight1Active{
                self.DismissHighlight1.hidden = true;
            }
        if self.infoActive{
            self.InfoLabel.textColor = UIColor.whiteColor()
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
                self.WaterAnimView.alpha = 0
                if self.HightlightsActive {
                    self.HighlightNumbersView.alpha = 0
                    self.Highlight1Logo.alpha = 0
                    self.Highlight1Title.alpha = 0
                    
                }
                if self.Highlight1Active{
                    self.Highlight1ScrollView.alpha = 0
                }
                if self.infoActive{
                    self.ScrollView.alpha = 0
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
                        if self.Highlight1Active{
                            self.Highlight1Active = false
                        }
                        if self.infoActive{
                            self.infoActive = false
                            self.DismissInfo.hidden = true
                            self.ScrollView.hidden = true
                        }
                    }
            })
            self.DismissPlanning.hidden = false
            self.PlanningButton.hidden = true
            self.InfoButton.hidden = false
            self.HighlightsButton.hidden = false
            self.PhotographyButton.hidden = false
        
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

