//
//  SantaCruzViewController.swift
//  ChannelIsland
//
//  Created by Christopher Overton on 8/30/16.
//  Copyright © 2016 Christopher Overton. All rights reserved.
//


import UIKit



struct Hike {
    let destination: String
    let distance: String
    let difficulty: String
    let briefdescription: String
}

struct Campground {
    let island: String
    let rreservation: String
    let distlandtocamp: String
    let nofcampsites: String
    let camperspsite: String
}

class CampgroundCell: UITableViewCell {
    //private var destinationLabel: UITextView = UITextView()
    private var islandLabel: UITextView = UITextView()
    private var rreservationLabel: UITextView = UITextView()
    private var distlandtocampLabel: UITextView = UITextView()
    private var nofcampsitesLabel: UITextView = UITextView()
    private var camperspsiteLabel: UITextView = UITextView()
    private var captionAttr: [String: AnyObject] = [NSForegroundColorAttributeName: UIColor.whiteColor(),
                                                    NSBackgroundColorAttributeName: UIColor.clearColor(),
                                                    NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 15.0)!]
    private var captionAttr2: [String: AnyObject] = [NSForegroundColorAttributeName: UIColor.whiteColor(),
                                                     NSBackgroundColorAttributeName: UIColor.clearColor(),
                                                     NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 15.0)!]
    internal var index = 0
    init(){
        super.init(style: UITableViewCellStyle.Value2, reuseIdentifier: "cell")
        //destinationLabel.frame = CGRect(x: 0,y: 10,width: 20,height: 110)
        //destinationLabel.backgroundColor = UIColor.clearColor()
        islandLabel.frame = CGRect(x: 0, y: 10, width: 150, height: 110)
        islandLabel.backgroundColor = UIColor.clearColor()
        //destinationLabel.textAlignment =  .Center
        rreservationLabel.frame = CGRect(x: 130,y: 10,width: 80,height: 110)
        rreservationLabel.backgroundColor = UIColor.clearColor()
        distlandtocampLabel.frame = CGRect(x: 220,y: 10,width: 90,height: 110)
        distlandtocampLabel.backgroundColor = UIColor.clearColor()
        nofcampsitesLabel.frame = CGRect(x: 310,y: 10,width: 90,height: 110)
        nofcampsitesLabel.backgroundColor = UIColor.clearColor()
        camperspsiteLabel.frame = CGRect(x: 400,y: 10,width: 90,height: 110)
        camperspsiteLabel.backgroundColor = UIColor.clearColor()
        self.addSubview(islandLabel)
        self.addSubview(rreservationLabel)
        self.addSubview(distlandtocampLabel)
        self.addSubview(nofcampsitesLabel)
        self.addSubview(camperspsiteLabel)
    }
    
    var island: String? {
        didSet {
            //destinationLabel.text = destination
            /*
             let myAttrString1 = NSAttributedString(string: destination!,
             attributes: captionAttr)
             destinationLabel.attributedText = myAttrString1
             */
            if self.index > 0{
                let myAttrString1 = NSAttributedString(string: island!,
                                                       attributes: captionAttr)
                islandLabel.attributedText = myAttrString1
            }
            else{
                let myAttrString1 = NSAttributedString(string: island!,
                                                       attributes: captionAttr2)
                islandLabel.attributedText = myAttrString1
            }
            
        }
    }
    
    var rreservation: String? {
        didSet {
            //distanceLabel.text = distance
            if self.index > 0{
                let myAttrString1 = NSAttributedString(string: rreservation!,
                                                       attributes: captionAttr)
                rreservationLabel.attributedText = myAttrString1
            }
            else{
                let myAttrString1 = NSAttributedString(string: rreservation!,
                                                       attributes: captionAttr2)
                rreservationLabel.attributedText = myAttrString1
            }
            
        }
    }
    var distlandtocamp: String? {
        didSet {
            //difficultyLabel.text = difficulty
            if self.index > 0{
                let myAttrString1 = NSAttributedString(string: distlandtocamp!,
                                                       attributes: captionAttr)
                distlandtocampLabel.attributedText = myAttrString1
            }
            else{
                let myAttrString1 = NSAttributedString(string: distlandtocamp!,
                                                       attributes: captionAttr2)
                distlandtocampLabel.attributedText = myAttrString1
            }
        }
    }
    
    var nofcampsites: String? {
        didSet {
            //briefdescriptionLabel.text = briefdescription
            if self.index > 0{
                let myAttrString1 = NSAttributedString(string: nofcampsites!,
                                                       attributes: captionAttr)
                nofcampsitesLabel.attributedText = myAttrString1
            }
            else{
                let myAttrString1 = NSAttributedString(string: nofcampsites!,
                                                       attributes: captionAttr2)
                nofcampsitesLabel.attributedText = myAttrString1
            }
        }
    }
    
    var camperspsite: String? {
        didSet {
            //briefdescriptionLabel.text = briefdescription
            if self.index > 0{
                let myAttrString1 = NSAttributedString(string: camperspsite!,
                                                       attributes: captionAttr)
                camperspsiteLabel.attributedText = myAttrString1
            }
            else{
                let myAttrString1 = NSAttributedString(string: camperspsite!,
                                                       attributes: captionAttr2)
                camperspsiteLabel.attributedText = myAttrString1
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
}

class HikeCell: UITableViewCell {
    //private var destinationLabel: UITextView = UITextView()
    private var destinationLabel2: UITextView = UITextView()
    private var distanceLabel: UITextView = UITextView()
    private var difficultyLabel: UITextView = UITextView()
    private var briefdescriptionLabel: UITextView = UITextView()
    private var captionAttr: [String: AnyObject] = [NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSBackgroundColorAttributeName: UIColor.clearColor(),
        NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 15.0)!]
    private var captionAttr2: [String: AnyObject] = [NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSBackgroundColorAttributeName: UIColor.clearColor(),
        NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 15.0)!]
    internal var index = 0
    init(){
         super.init(style: UITableViewCellStyle.Value2, reuseIdentifier: "cell")
        //destinationLabel.frame = CGRect(x: 0,y: 10,width: 20,height: 110)
        //destinationLabel.backgroundColor = UIColor.clearColor()
        destinationLabel2.frame = CGRect(x: 0, y: 10, width: 150, height: 110)
        destinationLabel2.backgroundColor = UIColor.clearColor()
        //destinationLabel.textAlignment =  .Center
        distanceLabel.frame = CGRect(x: 130,y: 10,width: 80,height: 110)
        distanceLabel.backgroundColor = UIColor.clearColor()
        difficultyLabel.frame = CGRect(x: 220,y: 10,width: 90,height: 110)
        difficultyLabel.backgroundColor = UIColor.clearColor()
        briefdescriptionLabel.frame = CGRect(x: 310,y: 10,width: 200,height: 110)
        briefdescriptionLabel.backgroundColor = UIColor.clearColor()
        self.addSubview(destinationLabel2)
        self.addSubview(distanceLabel)
        self.addSubview(difficultyLabel)
        self.addSubview(briefdescriptionLabel)
    }
    
    var destination: String? {
        didSet {
            //destinationLabel.text = destination
            /*
            let myAttrString1 = NSAttributedString(string: destination!,
                                                   attributes: captionAttr)
            destinationLabel.attributedText = myAttrString1
            */
            if self.index > 0{
                let myAttrString1 = NSAttributedString(string: destination!,
                                                   attributes: captionAttr)
                destinationLabel2.attributedText = myAttrString1
            }
            else{
                let myAttrString1 = NSAttributedString(string: destination!,
                                                       attributes: captionAttr2)
                destinationLabel2.attributedText = myAttrString1
            }
            
        }
    }
    
    var distance: String? {
        didSet {
            //distanceLabel.text = distance
            if self.index > 0{
                let myAttrString1 = NSAttributedString(string: distance!,
                                                   attributes: captionAttr)
                distanceLabel.attributedText = myAttrString1
            }
            else{
                let myAttrString1 = NSAttributedString(string: distance!,
                                                       attributes: captionAttr2)
                distanceLabel.attributedText = myAttrString1
            }
            
        }
    }
    var difficulty: String? {
        didSet {
            //difficultyLabel.text = difficulty
            if self.index > 0{
                let myAttrString1 = NSAttributedString(string: difficulty!,
                                                       attributes: captionAttr)
                difficultyLabel.attributedText = myAttrString1
            }
            else{
                let myAttrString1 = NSAttributedString(string: difficulty!,
                                                       attributes: captionAttr2)
                difficultyLabel.attributedText = myAttrString1
            }
        }
    }
    
    var briefdescription: String? {
        didSet {
            //briefdescriptionLabel.text = briefdescription
            if self.index > 0{
                let myAttrString1 = NSAttributedString(string: briefdescription!,
                                                       attributes: captionAttr)
                briefdescriptionLabel.attributedText = myAttrString1
            }
            else{
                let myAttrString1 = NSAttributedString(string: briefdescription!,
                                                       attributes: captionAttr2)
                briefdescriptionLabel.attributedText = myAttrString1
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
}

class CampgroundDataSource: NSObject {
    let campgrounds: [Campground]
    
    init(campgrounds: [Campground]) {
        self.campgrounds = campgrounds
    }
}

extension CampgroundDataSource: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return campgrounds.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCellWithIdentifier(String(HikeCell)) as! HikeCell
        let cell = CampgroundCell()
        let campground = campgrounds[indexPath.row]
        cell.index = indexPath.row
        cell.island = campground.island
        //cell.destination = hike.destination
        cell.rreservation = campground.rreservation
        cell.distlandtocamp = campground.distlandtocamp
        cell.nofcampsites = campground.nofcampsites
        cell.camperspsite = campground.camperspsite
        cell.backgroundColor = UIColor.clearColor()
        cell.autoresizesSubviews = false
        
        //cell.frame = CGRectMake(0, 0, 300, 110)
        cell.tintColor = UIColor.clearColor()
        
        return cell
    }
}

class HikesDataSource: NSObject {
    let hikes: [Hike]
    
    init(hikes: [Hike]) {
        self.hikes = hikes
    }
}

extension HikesDataSource: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hikes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCellWithIdentifier(String(HikeCell)) as! HikeCell
        let cell = HikeCell()
        let hike = hikes[indexPath.row]
        cell.index = indexPath.row
        cell.destination = hike.destination
        //cell.destination = hike.destination
        cell.distance = hike.distance
        cell.difficulty = hike.difficulty
        cell.briefdescription = hike.briefdescription
        cell.backgroundColor = UIColor.clearColor()
        cell.autoresizesSubviews = false
        
        //cell.frame = CGRectMake(0, 0, 300, 110)
        cell.tintColor = UIColor.clearColor()
        
        return cell
    }
}

class SantaCruzViewController: UIViewController, UITextViewDelegate, UITableViewDelegate,UIScrollViewDelegate {
    
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
    private var otherPageActive: Bool = false
    private var switchPage: Bool = true
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
    private var actpageIVs: [UIImageView!] = []
    private var actpageTVs: [UITextView!] = []
    private var pageIVs2: [[UIImageView!]] = [[UIImageView!]]()
    private var capPagTVs2: [[UITextView!]] = [[UITextView!]]()
    private var actpageTableView1: UITableView = UITableView()
    private var actpageTableView2: UITableView = UITableView()
    private var actpageTableView12: UITableView = UITableView()
    private var actpageTableView22: UITableView = UITableView()
    private var pageID : Int = 0
    private var prevpageID: Int = 0
    @IBOutlet weak var CapPagTV1: UITextView!
    @IBOutlet weak var CapPagTV2: UITextView!
    @IBOutlet weak var CapPagTV3: UITextView!
    @IBOutlet weak var CapPagTV4: UITextView!
    @IBOutlet weak var CapPagTV5: UITextView!
    @IBOutlet weak var CapPagTV6: UITextView!
    @IBOutlet weak var IPageV1: UIImageView!
    private var PageTextView2: UITextView!
    private var PageScrollView2: FadeScrollVIew!
    @IBOutlet var SantaCruzView: UIView!
    private var dataSource: HikesDataSource
    private var dataSource2: CampgroundDataSource
    private var actHikes: [Hike] = [Hike(destination: "Destination",distance: "Distance",difficulty: "Difficulty",briefdescription: "Brief Description"),Hike(destination: "Historic Ranch",distance: ".5",difficulty: "Easy",briefdescription: "View the historic Scorpion Ranch complex."),Hike(destination: "Cavern Point",distance: "2",difficulty: "Moderate",briefdescription: "Magnificent coastal vistas and whale viewing."),Hike(destination: "Potato Harbor",distance: "4",difficulty: "Moderate",briefdescription: "Spectacular coastal views. No beach access."),Hike(destination: "Scorpion Canyon",distance: "4 (loop)",difficulty: "Moderate to strenuous",briefdescription: "A scenic loop hike that includes steep canyon walls and a chance to see the unique island scrub-jay."), Hike(destination: "Smugglers Cove",distance: "7",difficulty: "Strenuous",briefdescription: "An all-day hike with beach access at Smugglers Cove."),Hike(destination: "Montañon Ridge",distance: "8",difficulty: "Strenuous",briefdescription: "For experienced, off-trail hikers. Great views."),Hike(destination: "Prisoners Harbor",distance: "28",difficulty: "Strenuous",briefdescription: "Arrange a boat pickup for a one-way trip or camp at Del Norte backcountry camp."),Hike(destination: "From Smugglers Cove:",distance: "",difficulty: "",briefdescription: ""),Hike(destination: "Smugglers Canyon",distance: "   2",difficulty: "Moderate to strenuous",briefdescription: "Opportunities to view native island vegetation.  Be prepared for uneven terrain and loose rock."),Hike(destination: "Yellowbanks",distance: "3",difficulty: "Moderate",briefdescription: "Off-trail hike to an overlook. No beach access."),Hike(destination: "San Pedro Point",distance: "4",difficulty: "Moderate",briefdescription: "For experienced, off-trail hikers."),Hike(destination: "From Prisoners Harbor:",distance: "",difficulty: "",briefdescription: ""),Hike(destination: "Prisoners Harbor",distance: ".25 -.5",difficulty: "Easy",briefdescription: "View the historic Prisoners Harbor area and search for the island scrub-jay."),Hike(destination: "Del Norte Camp",distance: "7",difficulty: "Strenuous",briefdescription: "Follow the rugged Del Norte trail east to the backcountry camp."),Hike(destination: "Navy Road- Del Norte Loop",distance: "8.5",difficulty: "Strenuous",briefdescription: "Route includes the Navy Road and the Del Norte Trail. Good views."),Hike(destination: "Chinese Harbor",distance: "15.5",difficulty: "Strenuous",briefdescription: "A long hike that ends at the only beach accessible by land on the isthmus."),Hike(destination: "China Pines",distance: "18",difficulty: "Strenuous",briefdescription: "Explore the Santa Cruz Island pine grove."),Hike(destination: "Montañon Ridge",distance: "21",difficulty: "Strenuous",briefdescription: "For experienced, off-trail hikers. Must be able to read topographic maps."),Hike(destination: "Scorpion Anchorage",distance: "       28",difficulty: "Strenuous",briefdescription: "Arrange a boat pickup for a one-way trip or camp at Del Norte backcountry camp."),Hike(destination: "Pelican Bay",distance: "4",difficulty: "Moderate to strenuous",briefdescription: "This trail may only be travled by those who have obtained a permit in advance from The Nature Conservancy or are accompanied by Island Packers (a boat concessioner) staff.")]
    private var campgrounds: [Campground] = [Campground(island: "Island", rreservation: "Required Reservation", distlandtocamp: "Distance From Landing To Campground",nofcampsites: "Number Of Campsites",camperspsite: "Campers Per Site"),Campground(island: "Anacapa", rreservation: "Yes", distlandtocamp: "157 stairs, .5 miles",nofcampsites: "7",camperspsite: "4-6"),Campground(island: "Eastern Santa Cruz (Scorpion Ranch)", rreservation: "Yes", distlandtocamp: ".5 miles, flat",nofcampsites: "31",camperspsite: "6-15"),Campground(island: "Western Santa Cruz (The Nature Conservancy)", rreservation: "NO CAMPING ALLOWED", distlandtocamp: "NO CAMPING ALLOWED",nofcampsites: "NO CAMPING ALLOWED",camperspsite: "NO CAMPING ALLOWED"),Campground(island: "Santa Rosa", rreservation: "Yes", distlandtocamp: "1.5 miles from pier, flat; .25 miles from airstrip, flat",nofcampsites: "15",camperspsite: "5"),Campground(island: "San Miguel", rreservation: "Yes", distlandtocamp: "1 mile, steep uphill",nofcampsites: "9",camperspsite: "4"),Campground(island: "Santa Barbara", rreservation: "Yes", distlandtocamp: ".25 miles, steep uphill",nofcampsites: "10",camperspsite: "4")]
    private var Activitiestextstrings: [String] = ["ACTIVITIES\n\n","Boating and Kayaking\n\n","With one of the world’s largest sea caves and clear coastal waters, Santa Cruz is a sea kayaker’s paradise. Formal guided tours are offered at both Scorpion Bay and Prisoners Harbor.\n\n","Diving, Snorkeling, and Swimming\n\n","The easiest place for walk-in diving, snorkeling, and swimming is right off the pier at Scorpion Beach. To the east, Smuggler’s Cove offers great diving and snorkeling too. With the exception of Anacapa, these are the warmest waters you’re likely to find in the Channel Islands.\n\n","Wildlife Watching\n\n","With 145 species of life found nowhere else on Earth, the wildlife watcher is in for a treat on Santa Cruz.\n\nSanta Cruz Island is home to the island scrub jay and small island fox. They reveal two evolutionary strategies to adapt to the island’s unique ecosystem. The jay is bigger than its mainland cousins; the fox is much smaller.\n\n","Fishing\n\n","\t·Over 80 percent of the waters near the Channel Islands are open to fishing.\n\t·Sport fishing is allowed outside marine protected areas and requires possession of a valid California state fishing license with an ocean enhancement stamp.\n\t·All California Department of Fish and Game regulations apply.\n\n"," Hiking\n\n","\t·Several roads and trails traverse eastern Santa Cruz Island. Trails near historic Scorpion Ranch are well maintained and of moderate difficulty. Hiking trails in the more rugged Montañon area are generally more strenuous.\n\t·Rangers and naturalists offer guided tours year-round at Scorpion Anchorage and Prisoners Harbor.\n\t·Note that the western side of Santa Cruz requires a permit from the Nature Conservancy to enter.  For more information, please visit: https://www.nps.gov/chis/index.htm.\n\n","Camping\n\n","\t·Of all the five islands, Santa Cruz provides the most accommodations and amenities for campers. Take your pick between developed and well shaded campgrounds at Scorpion Bay and backcountry sites at Del Norte..\n\t·Year-round camping is available; overnight fees apply. Reserve your site well in advance at recreation.gov or call 877-444-6777.  Concession boats fill to capacity more quickly than campground sites are filled, so book your boat transportation for overnight trips first.\n\t·Scorpion Bay campground provides picnic tables, lock boxes for food, drinking water, and pit toilets.\n\t·Remember that you’ll be hauling everything else from the pier to your site, so bring essentials only.\n\t·Be prepared to pack in your own water when utilizing the backcountry campsites.\n\n","Hiking Information\n\n"]
    
    private var ActivitiesAttributes : [[String: AnyObject]] = [[NSForegroundColorAttributeName: UIColor.whiteColor(),
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
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!]]
    
    private var Infotextstrings: [String] = ["INFO\n\n","With relatively easy boat access, amazing kayaking, and great kelp beds near popular campsites, Santa Cruz offers an all-in-one destination. Located in the transition zone between warm southern currents and colder northern currents, Santa Cruz supports diverse marine life. Fishing is permitted outside reserves and protected areas. Land management is shared by the National Park Service and Nature Conservancy. Going ashore on the Nature Conservancy property requires a permit."]
    
    private var InfoAttributes : [[String: AnyObject]] = [[NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSBackgroundColorAttributeName: UIColor.clearColor(),
        NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 24.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSBackgroundColorAttributeName: UIColor.clearColor(),
        NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!]]
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
    private let infophotonames: [String] = ["SANTA_CRUZ_LOOKING_NORTH","SCORPION_CANYON_SC","SC_KAYAKERS"]
    private let activitiesphotonames: [String] = ["PAINTED_CAVE_SCI","PAINTED_CAVE_SCI_2","SNORKLER_FREE_DIVING","POTATO_HARBOR","DIVER_HORN_SHARK","DIVER_KELP","WHALE_SIGHTING","PACIFIC_WHITE_SIDING","LOOK_FOR_WHALES","CALIFORNIA_SEA_LION","CSL_AT_PLAY","CLOSER_TO_SHORE","ISLAND_FOX_UNIQUE","ISLAND_SCRUB_JAY","LIVE_FOREVER","HOFFMANNS_SLENDER","HIKING_TO_POTATO_HILL","SC_NEAR_SBA"]
    private var InfoCaptiontextstrings: [String] = ["Santa Cruz Island, looking west. (photo by Tim Hauf)","Scorpion Canyon near Scorpion Bay anchorages, Santa Cruz Island","Kayakers at Potato Harbor, Santa Cruz Island"]
    private var AnchoragesCaptiontextstrings: [String] = ["Prisoner’s Harbor Pier, Santa Cruz Island","Scorpion Bay pier on Santa Cruz Island","Scorpion Bay anchorages, Santa Cruz Island","Aerial of anchorage at Smugglers’ Cove, Santa Cruz Island","Boaters at anchor in Pelican Bay, Santa Cruz Island","Aerial view of Pelican Bay, Santa Cruz Island"]
    private var ActivitiesCaptiontextstrings: [String] = ["Painted Cave, Santa Cruz Island","Painted Cave, Santa Cruz Island","Snorkeler free-diving , Santa Cruz Island","Potato Harbor, Santa Cruz Island","Diver with horn shark.","Diving in the kelp, Santa Cruz Island","Whale sighting, Santa Barbara Channel (NPS)","Pacific White-sided Dolphins leaping","Look for whales, dolphins, and seabirds during your channel crossing.","California Sea Lion","California Sea Lions at play.","Closer to shore, you’re likely to see seals, sea lions, shorebirds, and bald eagles.","Island Fox, unique to the Channel Islands, photo by Tim Coonan","Island Scrub Jay","Santa Cruz Island live-forever, Santa Cruz Island","Hoffmann’s slender-flowered gilia, Santa Cruz Island","Santa Cruz Island, hiking to Potato Harbor ","Scorpion Canyon near Scorpion Bay anchorages, Santa Cruz Island"]
    private var InfoCaptionAttributes : [[String: AnyObject]] =
        [[NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 16.0)!],
         [NSForegroundColorAttributeName: UIColor.whiteColor(),NSBackgroundColorAttributeName: UIColor.clearColor(),NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 16.0)!],
         [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 16.0)!],
         [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 16.0)!]]
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
    required init?(coder aDecoder: NSCoder) {
        //self.actpageTableView2.registerClass(HikeCell.self, forCellReuseIdentifier: "HikeCell")
        
        self.dataSource = HikesDataSource(hikes: actHikes)
        self.dataSource2 = CampgroundDataSource(campgrounds: self.campgrounds)
        super.init(coder: aDecoder)
    }
    func loadScrollPageTV2(){
        self.PageTextView2 = UITextView()
        self.PageTextView2.backgroundColor = UIColor.clearColor()
        self.PageTextView2.frame = CGRectMake(185, 75, 510.0, 3500.0)
        self.PageTextView2.alpha = 1
        self.PageScrollView2 = FadeScrollVIew()
        self.PageScrollView2.frame = CGRectMake(0, 120, 1024, 565)
        self.PageScrollView2.alpha = 0
        self.PageScrollView2.addSubview(self.PageTextView2)
        self.SantaCruzView.insertSubview(self.PageScrollView2,atIndex: 5)
        self.PageScrollView2.contentSize.height = 8000
        let inames: [[String]] = [self.photonames, self.infophotonames, self.activitiesphotonames]
        let tnames: [[String]] = [self.AnchoragesCaptiontextstrings,self.InfoCaptiontextstrings,self.ActivitiesCaptiontextstrings]
        var j = 0
        for iname: [String] in inames{
            var i = 0
            var y = 90.0
            let x = 710.0
            var iViews: [UIImageView!] = []
            var tViews: [UITextView!] = []
            print(iname)
            for astr : String in iname{
                let ycg = CGFloat(y)
                let xcg = CGFloat(x)
                let ui = UIImage(imageLiteral: astr)
                let imageView = UIImageView(image: ui)
                let newheight = ui.size.height/1.85
                let newwidth = ui.size.width/1.85
                imageView.contentMode = .ScaleAspectFit
                imageView.frame = CGRectMake(xcg, ycg, newwidth, newheight)//(piv.frame.x,piv.frame.y,piv.frame.width,newheight)
                imageView.alpha = 0
                y = y + 60.0 + Double(newheight)
                iViews.append(imageView)
                print(j)
                print(i)
                print(imageView)
                self.PageScrollView2.addSubview(imageView)
                let textView = UITextView()
                let acstr: String = tnames[j][i]
                let myAttributes = self.InfoCaptionAttributes[0]
                let myAttrString1 = NSAttributedString(string: acstr,
                                                       attributes: myAttributes)
                textView.attributedText = myAttrString1
                textView.frame = CGRectMake(xcg, ycg+newheight-10.0, 300.0, 60.0)
                textView.alpha = 0
                textView.backgroundColor = UIColor.clearColor()
                tViews.append(textView)
                self.PageScrollView2.addSubview(textView)
                i += 1
            }
            print(iViews.count)
            self.pageIVs2.append(iViews)
            self.capPagTVs2.append(tViews)

            j += 1
        }
        
        //add tableview
        self.actpageTableView2.delegate = self
        self.actpageTableView2.alpha = 0
        self.actpageTableView2.backgroundColor = UIColor.clearColor()
        self.actpageTableView2.tintColor = UIColor.clearColor()
        self.actpageTableView2.allowsSelection = false
        self.actpageTableView2.separatorColor = UIColor.clearColor()
        self.actpageTableView2.rowHeight = 90
        self.actpageTableView2.tableFooterView = UIView(frame: CGRectZero)
        self.actpageTableView2.tableHeaderView = UIView(frame: CGRectZero)
        //self.actpageTableView2.style = UITableViewStyle.Grouped;
        //self.actpageTableView2.
        //self.actpageTableView2.rowHeight = UITableViewAutomaticDimension
        self.actpageTableView2.dataSource = dataSource
        self.actpageTableView2.reloadData()
        self.PageScrollView2.addSubview(self.actpageTableView2)
        self.actpageTableView2.frame = CGRectMake(185, 2400, 510, 3000)
        
        self.actpageTableView22.delegate = self
        self.actpageTableView22.alpha = 0
        self.actpageTableView22.backgroundColor = UIColor.clearColor()
        self.actpageTableView22.tintColor = UIColor.clearColor()
        self.actpageTableView22.allowsSelection = false
        self.actpageTableView22.separatorColor = UIColor.clearColor()
        self.actpageTableView22.rowHeight = 90
        self.actpageTableView22.tableFooterView = UIView(frame: CGRectZero)
        self.actpageTableView22.tableHeaderView = UIView(frame: CGRectZero)
        //self.actpageTableView2.style = UITableViewStyle.Grouped;
        //self.actpageTableView2.
        //self.actpageTableView2.rowHeight = UITableViewAutomaticDimension
        self.actpageTableView22.dataSource = dataSource2
        self.actpageTableView22.reloadData()
        self.PageScrollView2.addSubview(self.actpageTableView22)
        self.actpageTableView22.frame = CGRectMake(185, 4500, 510, 2000)
        print(self.pageIVs2.count)
        print(self.pageIVs2[0].count)
        print(self.pageIVs2[1].count)
        print(self.pageIVs2[2].count)
    }
    
    func loadActIVs(){
        var y = 90.0
        let x = 710.0
        var i = 0
        for astr: String in self.activitiesphotonames{
            let ycg = CGFloat(y)
            let xcg = CGFloat(x)
            let ui = UIImage(imageLiteral: astr)
            let imageView = UIImageView(image: ui)
            let newheight = ui.size.height/1.85
            let newwidth = ui.size.width/1.85
            imageView.contentMode = .ScaleAspectFit
            imageView.frame = CGRectMake(xcg, ycg, newwidth, newheight)//(piv.frame.x,piv.frame.y,piv.frame.width,newheight)
            imageView.alpha = 0
            
            self.actpageIVs.append(imageView)
            self.PageScrollView.addSubview(imageView)
            let textView = UITextView()
            let acstr: String = self.ActivitiesCaptiontextstrings[i]
            let myAttributes = self.InfoCaptionAttributes[0]
            let myAttrString1 = NSAttributedString(string: acstr,
                                                   attributes: myAttributes)
            textView.attributedText = myAttrString1
            textView.frame = CGRectMake(xcg, ycg+newheight-10.0, 300.0, 60.0)
            textView.alpha = 0
            textView.backgroundColor = UIColor.clearColor()
            self.actpageTVs.append(textView)
            self.PageScrollView.addSubview(textView)
            y = y + 60.0 + Double(newheight)
            i+=1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadActIVs()
        self.loadScrollPageTV2()
        print(self.Activitiestextstrings.count)
        self.PageScrollView.delegate = self
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
    
    func scrollViewDidScroll(PageScrollView: UIScrollView) {
        /*
        if self.infoActive{
            var i = 0
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
                piv.frame = CGRectMake(piv.frame.origin.x, piv.frame.origin.y, piv.frame.size.width, newheight)
                i+=1
            }
        }
       */
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
        self.prevpageID = self.pageID
        self.pageID = 2
        self.enablepageTransition()
    }
    
    func enableAnchorages(){
        self.anchorageActive = true
        self.prevpageID = self.pageID
        self.pageID = 0
        self.enablepageTransition()
    }
    
    func enableInfo(){
        self.infoActive = true
        self.prevpageID = self.pageID
        self.pageID = 1
        self.enablepageTransition()
    }
    
    func enablepageTransition(){
        self.PageScrollView.contentOffset = CGPoint(x: 0, y: 0)
        self.IView2.hidden = false
        self.PageScrollView.hidden = false
        var flagTransit = false
        
        if self.otherPageActive{
            if self.switchPage{
                self.PageScrollView2.hidden = false
                self.PageScrollView2.contentOffset = CGPoint(x: 0, y: 0)
                let ptextstrings: [[String]] = [self.Anchoragestextstrings, self.Infotextstrings, self.Activitiestextstrings]
                let pattributes: [[[String: AnyObject]]] = [self.AnchoragesAttributes, self.InfoAttributes, self.ActivitiesAttributes]
                var i = 0
                let result = NSMutableAttributedString()
                for textstring: String in ptextstrings[self.pageID]{
                    
                    
                    
                    let myAttributes = pattributes[pageID][i]
                    let myAttrString1 = NSAttributedString(string: textstring,
                                                               attributes: myAttributes)
                    result.appendAttributedString(myAttrString1)
                    
                    
                    i+=1
                }
                self.PageTextView2.attributedText = result
                //change alphas on captions and photos for scrollview2 controller
                i = 0
                print("Page ID: ")
                print(self.pageID)
                for iv: UIImageView in self.pageIVs2[self.pageID]{
                    iv.alpha = 1
                    self.capPagTVs2[self.pageID][i].alpha = 1
                    i+=1
                }
                if (self.pageID == 2){
                    self.actpageTableView2.alpha = 1
                    self.actpageTableView22.alpha = 1
                }
                flagTransit = true
                
            }
            if self.prevpageID == 0{
                self.anchorageActive = false
                self.AnchorageButton.hidden = false
            }
            else if self.prevpageID == 1{
                self.infoActive = false
                self.InfoButton.hidden = false
            }
            else{
                self.activitiesActive = false
                self.ActivitiesButton.hidden = false
            }
        }
        if self.pageID == 0{
            self.AnchorageButton.hidden = true
        }
        else if self.pageID == 1{
            self.InfoButton.hidden = true
        }
        else{
            self.ActivitiesButton.hidden = true
        }
        if self.anchorageActive && !flagTransit{
            self.PageScrollView.contentSize.height = 1900
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
            self.PageTextView.attributedText = result
            //self.viewDidLayoutSubviews()
        }
        
        if self.infoActive && !flagTransit{
            self.PageScrollView.contentSize.height = 1900
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
            for piv: UIImageView in self.pageIVs{
                piv.alpha = 1
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
            }
            self.PageTextView.attributedText = result
        }
        
        if self.activitiesActive && !flagTransit{
            self.PageScrollView.contentSize.height = 4000
            var i = 0
            let result = NSMutableAttributedString()
            for astr: String in self.Activitiestextstrings{
                let myAttributes = self.ActivitiesAttributes[i]
                let myAttrString1 = NSAttributedString(string: astr,
                                                       attributes: myAttributes)
                result.appendAttributedString(myAttrString1)
                i+=1
            }
            i = 0
            
             for piv: UIImageView in self.pageIVs{

             

             //piv.frame = CGRectMake(piv.frame.origin.x, piv.frame.origin.y, piv.frame.size.width, newheight)//(piv.frame.x,piv.frame.y,piv.frame.width,newheight)
             piv.alpha = 0
             self.capPagTVs[i].alpha = 0

             i+=1
             }
             i = 0
            for piv: UIImageView! in self.actpageIVs{
                piv.alpha = 1
                self.actpageTVs[i].alpha = 1
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
            else{
                self.ActivitiesBar.alpha = 0
            }
            if !self.otherPageActive{
                self.PageScrollView.alpha = 1
            }
            else{
                if self.switchPage{
                    self.PageScrollView.alpha = 0
                    self.PageScrollView2.alpha = 1
                }
                else{
                    self.PageScrollView.alpha = 1
                    self.PageScrollView2.alpha = 0
                }
            }
            self.CloseTV.alpha = 1
            }, completion: { finished in
                if (finished){
                    if self.otherPageActive{
                        if self.switchPage{
                            self.switchPage = false
                            //clean up 1rst ScrollView for photos and captions
                            var i = 0
                            for piv: UIImageView! in self.actpageIVs{
                                piv.alpha = 0
                                self.actpageTVs[i].alpha = 0
                                i+=1
                            }
                        }
                        else{
                            var i = 0
                            for iv: UIImageView in self.pageIVs2[self.prevpageID]{
                                iv.alpha = 0
                                self.capPagTVs2[self.prevpageID][i].alpha = 0
                                i+=1
                            }
                            self.actpageTableView2.alpha = 0
                            self.actpageTableView22.alpha = 0
                            self.switchPage = true
                        }
                    }
                    self.IView.hidden = true
                    self.DismissPage.hidden = false
                    self.otherPageActive = true
                }
        })
    }
    
    func enablemainpageTransition(){
        self.IView.hidden = false
        UIView.animateWithDuration(2.0, delay: 0.0, options: .CurveEaseOut, animations: {
            self.IView2.alpha = 0
            self.IView.alpha = 1
            self.PageScrollView2.alpha = 0
            self.PageScrollView.alpha = 0
            
            self.ActivitiesBar.alpha = 0
           
            
            self.CloseTV.alpha = 0
            }, completion: { finished in
                if (finished){
                    self.IPageV1.alpha = 0
                    self.PageScrollView.hidden = true
                    self.PageScrollView2.hidden = true
                    self.IView2.hidden = true
                    self.DismissPage.hidden = true
                    self.infoActive = false
                    self.anchorageActive = false
                    self.activitiesActive = false
                    self.otherPageActive = false
                    self.ActivitiesButton.hidden = false
                    self.AnchorageButton.hidden = false
                    self.InfoButton.hidden = false
                    self.switchPage = true
                    var i = 0
                    for piv: UIImageView! in self.actpageIVs{
                        piv.alpha = 0
                        self.actpageTVs[i].alpha = 0
                        i+=1
                    }
                    var j = 0
                    for pivs: [UIImageView!] in self.pageIVs2{
                        i = 0
                        for piv: UIImageView in pivs{
                            piv.alpha = 0
                            self.capPagTVs2[j][i].alpha = 0
                            i+=1
                        }
                        j+=1
                    }
                    self.actpageTableView2.alpha = 0
                    self.actpageTableView22.alpha = 0
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
