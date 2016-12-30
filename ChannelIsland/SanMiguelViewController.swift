//
//  SanMiguelViewController.swift
//  ChannelIsland
//
//  Created by Christopher Overton on 8/30/16.
//  Copyright © 2016 Christopher Overton. All rights reserved.
//

import UIKit
class SanMiguelViewController: UIViewController, UITextViewDelegate,UITableViewDelegate {
    private let photoSequeId = "Photography"
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
    @IBOutlet weak var ActButView: UIView!
    @IBOutlet weak var MapLabel: UITextField!
    @IBOutlet weak var InfoLabel: UITextField!
    @IBOutlet weak var ActivitiesLabel: UITextField!
    @IBOutlet weak var AnchoragesLabel: UITextField!
    @IBOutlet weak var HomeLabel: UITextField!
    @IBOutlet weak var PhotoGalleryLabel: UITextField!
    @IBOutlet weak var BoatingLabel: UITextView!
    @IBOutlet weak var WildlifeLabel: UITextView!
    @IBOutlet weak var FishingLabel: UITextView!
    @IBOutlet weak var SwimmingLabel: UITextView!
    @IBOutlet weak var HikingLabel: UITextView!
    @IBOutlet weak var CampingLabel: UITextView!
    @IBOutlet weak var BoatingButton: UIButton!
    @IBOutlet weak var WildlifeButton: UIButton!
    @IBOutlet weak var FishingButton: UIButton!
    @IBOutlet weak var SwimmingButton: UIButton!
    @IBOutlet weak var HikingButton: UIButton!
    @IBOutlet weak var CampingButton: UIButton!
    @IBOutlet var SanMiguelView: UIView!
    @IBOutlet weak var MapButton: UIButton!
    @IBOutlet weak var PhotoButton: UIButton!
    
    private var infoActive: Bool = false
    private var anchorageActive: Bool = false
    private var activitiesActive: Bool = false
    private var otherPageActive: Bool = false
    private var switchPage: Bool = true
    
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
    private var dataSource: HikesDataSource
    private var dataSource2: CampgroundDataSource
    private var pageID : Int = 0
    private var prevpageID: Int = 0
    private var actHikes: [Hike] = [Hike(destination: "Destination",distance: "Distance",difficulty: "Difficulty",briefdescription: "Brief Description"),Hike(destination: "Inspiration Point",distance: "1.5",difficulty: "Easy",briefdescription: "Extraordinary views. Not to be missed."),Hike(destination: "Pinniped Point",distance: ".4 ",difficulty: "Easy",briefdescription: "Overlooks a haul out site for California sea lions."),Hike(destination: "Cathedral Cove",distance: ".6",difficulty: "Easy",briefdescription: "Overlooks a cove with beautiful rock formations."),Hike(destination: "Lighthouse",distance: ".5",difficulty: "Easy",briefdescription: "View the historic lighthouse built in 1932.")]
    
    private var campgrounds: [Campground] = [Campground(island: "Island", rreservation: "Required Reservation", distlandtocamp: "Distance From Landing To Campground",nofcampsites: "Number Of Campsites",camperspsite: "Campers Per Site"),Campground(island: "Anacapa", rreservation: "Yes", distlandtocamp: "157 stairs, .5 miles",nofcampsites: "7",camperspsite: "4-6"),Campground(island: "Eastern Santa Cruz (Scorpion Ranch)", rreservation: "          Yes", distlandtocamp: ".5 miles, flat",nofcampsites: "31",camperspsite: "6-15"),Campground(island: "Western Santa Cruz (The Nature Conservancy)", rreservation: "NO CAMPING ALLOWED", distlandtocamp: "NO CAMPING ALLOWED",nofcampsites: "NO CAMPING ALLOWED",camperspsite: "NO CAMPING ALLOWED"),Campground(island: "Santa Rosa", rreservation: "Yes", distlandtocamp: "1.5 miles from pier, flat; .25 miles from airstrip, flat",nofcampsites: "15",camperspsite: "5"),Campground(island: "San Miguel", rreservation: "Yes", distlandtocamp: "1 mile, steep uphill",nofcampsites: "9",camperspsite: "4"),Campground(island: "Santa Barbara", rreservation: "Yes", distlandtocamp: ".25 miles, steep uphill",nofcampsites: "10",camperspsite: "4")]
    
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
    private var Activitiestextstrings: [String] = ["Activities\n\n","Boating and Kayaking\n\n","Boating\n","\t•On calm days, boaters will find isolated, windswept stretches of white sandy beaches and great fishing. If you go around the western point of the island, you’ll see thousands of seals hauled out on the beach at Point Bennett.\n\t•When San Miguel is shrouded in fog and surrounded by rocky shoreline, it can be a mariner’s nightmare. Consider another destination!\n\n\nKayaking\t•Cuyler Harbor is generally the most sheltered place to kayak.\n\t•San Miguel often gets 30-knot winds and is pounded by surf year-round, so kayaking is recommended for expert strong kayakers only.\n\n","Wildlife Watching\n\n","\t•If you choose to make the 16-mile round trip, ranger-guided hike to Point Bennett, you’ll be rewarded with an amazing sight: some 30,000 seals and sea lions, hauled out on the beach, pups frolicking. You’ll want binoculars or long lens cameras.\n\n\t•The seabird watching can be extraordinary. Prince Island in Cuyler Harbor is a bird watcher’s dream. Land birds are best spotted in Nidever Canyon, accessed from the trail between Cuyler Harbor and the campsite.\n\n,","Fishing\n\n","\t•Great sport fishing opportunities await, weather permitting.\n\n\t•San Miguel Island consistently produces incredible catches of rockfish, lingcod, calico bass, white sea bass and halibut.\n\n\t•When weather conditions are favorable, San Miguel offers the greatest variety of cold and warm water sport fishing in Southern California.\n\n\t•Sport fishing outside marine protected areas requires possession of a valid California state fishing license with an ocean enhancement stamp.\n\n\t•All California Department of Fish and Game regulations apply.\n\n","Diving, Snorkeling, and Swimming","\n\nDiving\n\n","Divers on San Miguel have many options, most of which are dependent upon calm weather. The northwest side of the island has the richest variety of marine life and can be amazing. The east side at Cuyler Harbor is nice and calm, but tends to have less sea life.  In good weather, usually during autumn, diving is great with spectacular clarity.\n\n","Snorkeling\n","Snorkeling is usually good at Cuyler as well, with a rocky reef, kelp forest, and soft sandy bottoms. Be aware that the water is cold: 44-52˙ F (7-11˙ C).\n\n,","Swimming\n\n","Swimmers will love the white sand beaches and easy entry to the water at Cuyler Harbor.\n\n","Hiking\n\n\t","•Visitors can explore the two-mile long Cuyler Harbor beach and the one-mile long trail to the ranger station on their own.\n\t•To see other parts of the island, such as Point Bennett or the Caliche Rorest, the rangers will be available to guide you.\n\t•Ranger-guided hikes are offered during the weekends that campers are present.\n\t•All hikers must stay on trails to protect fragile vegetation making a comeback. No off-trail hiking.\n\t•The island was used by the military as a bombing target, so if you ever see old ordnance, tell the ranger!\n\n","Camping\n\n\t","•Primitive camping is available near the Lester Ranch site.\n\t•Reserve your site well in advance at recreation.gov. Concession boats fill to capacity more quickly than campground sites are filled, so book your boat transportation for overnight trips first.\n\t•The campground is a little over one mile up the bluffs from the beach, where you will be dropped off by ferry operators. You may get wet during landing.\n\t•Remember that you’ll be hauling all your gear from the beach, so bring essentials only.\n\t•The park provides windbreaks, picnic tables, storage boxes for food, and pit toilets.30-knot winds are common. Bring tent stakes.\n\t•Remember to pack in your own water.\n\n",
        "______________________________\n\nBoating and Kayaking\n\n","Boating Safety\n\n","\t•Visitors can boat to the islands on their own, or with the park’s approved ferry operators. Strong currents, shifting swells, dense fog, strong winds and choppy seas can appear suddenly. Come prepared.\n\t•Only boaters with considerable experience cruising the Channel Islands should visit San Miguel Island. Weather is unpredictable and heavy swells can roll into seemingly sheltered anchorages.\n\t•Choose your weather and monitor the weather while you’re there.\n\t•The western end of San Miguel has submerged rocky hazards jutting offshore, so be careful\n\n","Anchorages\n\n","\t•Boaters making the long trek from the mainland will appreciate the beauty and relatively calm waters in Cuyler Harbor.\n\t•Overnight anchorage is permitted only at Cuyler Harbor and Tyler Bight.\n\t•Wherever you anchor, there are no all-weather anchorages around the islands.  Therefore, it is recommended that a capable person stay on board at all times.\n\n","Kayaking\n\n","\t•Cuyler Harbor is one of the most scenic beaches in the park, and a nice sheltered place to kayak. The rest of the island often is slammed by 30-knot winds and choppy seas.\n\t•Kayakers must be expert. Beach landings are permitted only at Cuyler Harbor.\n\n","Weather Forecasts\n","\t•Monitor VHFG Weather Channel 3 (WX3), VHF-FM 162.475 mhz for marine forecasts. On the web, channelislands.noaa.gov or nwsla.noaa.gov have current weather. There are electronic weather kiosks in Santa Barbara and Channel Islands harbors.\n\n","______________________________\n\nWildlife Watching\n\n","What to Look For\n","\t•The 16-mile round trip guided hike to the western shore of the island offers one of nature’s great displays of wildlife.\n\n\t•Native vegetation is making a remarkable comeback. Some island coreopsis are head high. Wildflowers are best viewed in late winter and spring. Gumplant, buckwheat, poppies and verbena bloom during the dry summers.\n\n\t•Island foxes are occasionally seen around the campground area. They’re cute, but please don’t feed them.\n\n\t•Prince Island in Cuyler Harbor hosts 13 nesting seabirds species, making it one of the most important and diverse nesting habitats on the West Coast.\n\n\t•Land birds are best spotted in Nidever Canyon.\n\n","Wildlife Calendar Trends\n\n","\t•January/February: See gray whales heading to Baja California.\n\n\t•March/April: Island Fox pups are born March and April.\n\n\t•May/June: Dense fog is common. Blue and humpback whales arrive to feed on krill. California sea lion breeding and pupping runs from May through July.\n\n\t•July/August: Fog diminishes and underwater visibility increases. More of the same as blue and humpback whales feed on krill.\n\n\t•September/October: Warm weather, calm winds and seas are common.  Jellies are abundant in the coastal waters. Fin whales, Sei whales and blue whales can be observed feeding.\n\n\t•November/December: Winter storms appear. Best tidepooling months are now, as afternoon low tides expose invertebrates.","______________________________\n\nFishing\n\n","Marine Protected Areas\n\n","\t•Roughly half island is open for fishing. The rest is in Marine Protected Areas (MPAs). Please check the maps.\n\n","What to Look For\n","\t•San Miguel Island is great for fishing because it has such diverse marine life. The island’s chilly, unsheltered waters have more cold water fish than other Channel Islands. The rugged, rocky seafloor discourages commercial net boats, so it is also more lightly fished.\n\n\t•In the summer, surface fishing is decent, with good catches of calico bass, bonito and salmon. Salmon appear in the spring. Throughout most of the year, rockfish, surfperch, sheephead, sculpin and other reef fishes are abundant. In winter, seabass and lingcod add some potentially heavyweight fish.\n\n","Weather Forecasts\n","\t•Check out daily marine forecasts: http://www.usps.org/ventura/currentconditions.html\n\n","Sport Fishing Regulations\n","\t•California Ocean Sport fishing regulations: http://www.dfg.ca.gov/marine/oceansportregs.asp\n\n","______________________________\n\nDiving, Snorkeling, and Swimming\n\n","Diving\n","\t•San Miguel Island may have the finest scuba diving in southern California. The sheer variety of marine life is terrific. The mix of cold and warm water fish make it a diver’s paradise when the weather is good. Divers should be experienced.\n\n\t•The cold water is bracing, but the views are gorgeous. The \"front side\" seamount dive sites off the northwest coast are extremely popular.\n\n\t•Closer to shore, shallower dives also on the front side, are the northwest reefs: Castle Rock, Simonton Cove, and Whistlebuoy Reef.\n\n\t•The \"back side\" dive sites—Cuyler Harbor, Tyler Bight, Wycoff Ledge—offer less diversity, but are still nice dives.\n\n\t•When diving in marine protected areas the policy is \"look but don’t touch\".\n\n","Snorkeling and Swimming\n\n","Due to strong winds, snorkeling is recommended for those with experience and conditioning.\n\n","Tidepools\n\n","There are excellent tidepools at the eastern end of Cuyler Harbor, which is the only landing area on the island.\n\n","______________________________\n\nHiking\n\n","\t•San Miguel is traversed by several trails.  Near Cuyler Beach there are moderate hikes along the beach, and up to the ranger station on the bluffs above where you’ll be landing.  Longer hikes to Point Bennett (16 miles round trip) pay off with amazing views of the seals and sea lions on the western point.  A ranger will escort you.\n\n•The Caliche Trail’s payoff is an unusual sight; the ghostly white sand-castings of ancient plants, called the Caliche Forest.  They suggest that the island once had forests of small trees.\n\n•Click the NPS San Miguel Island Guide to learn more; (click to open this as a popup window on the iPad); http://www.nps.gov/chis/planyourvisit/upload/smihiking2006website.pdf","\n\nHiking Trails\n\n","San Miguel’s 600 archeological sites reveal human occupation as far back as at least 10,700 years ago. So please stay on the trails, to preserve these sites.\n\n","______________________________\n\nCamping\n\n","\t•Due to the ferry schedule, minimum stay is generally 3 days.\n\n\t•The walk from the landing at Cuyler Harbor to the campsite on the bluffs above involves a steep one-mile hike.\n\n\t•It’s often very windy, so be prepared.\n\n\t•Sturdy, low profile tents and stakes and line for securing tents to the ground are essential, even with the wind shelters provided.\n\n\t•Fog comes often, making things cool and damp." ]
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
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 28.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 28.0)!],
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
            NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 28.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 28.0)!],
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
            NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 28.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 28.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 28.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!]]
    
    
    private let photonames: [String] = ["SMimage009","SM_SmallMap"]
    private let activitiesphotonames: [String] = ["SMimage012","SMimage014","SMimage016","SMimage018","SMimage020","SMimage022","SMimage024","SMimage026","SMimage028","SMimage030","SMimage032","SMimage034","SMimage036","SMimage038","SMimage040","SMimage042","SMimage047","SMimage049","SMimage051","SMimage053","SMimage055","SMimage057"]
    private let infophotonames: [String] = ["SMimage003","SMimage005","SMimage007"]
    private var ActivitiesCaptiontextstrings: [String] = ["San Miguel Island, with Cuyler Bay on a calm day; Desiree Cassell/NPS","San Miguel Island, Point Bennett pinnipeds hauled out on the beach; photo by Tim Hauf","Wildflowers on San Miguel; NPS (top right photo by Tim Hauf)","Hiking San Miguel Island; hikingSanMiguel-npsgalleryfoto.jpg","The Island fox is sometimes seen around the campground; photo by Tim Hauf","San Miguel Island, approaching Cuyler’s Harbor; smi-cuylers-approach.jpg","San Miguel Island, Point Bennett, Anchor of the wreck; Mark Norder-NOAA","San Miguel Island, Cuyler Harbor Beach; PD photo","The Caliche Forest; the ghostly remnants of ancient trees cast in sand.","San Miguel Island, typical campsite; PD photo","","San Miguel Island, Cuyler Harbor; Channel_Islands_National_Park_CHIS8069.jpg","San Miguel Island, buckwheat; PD photo","San Miguel, Point Bennett; seals and sea lions resting on the beach; PD","Colder ocean temperatures wrap around San Miguel; NOAA graphic","Seals curious about divers at San Miguel Island; NOAA photo","San Miguel Island Cardwell Point Trail-Bob-Schwemmer.jpg","San Miguel Island archeological sites; NPS photo","San Miguel Island, approaching the campsite; PD photo","San Miguel Island campsite; photo by Tim Hauf","San Miguel Island campsite view; PD photo, viewfrom-smi-campsite.jpg","San Miguel Island, Cabrillo Monument; photo by Tim Hauf"]
    
    private var AnchoragesCaptiontextstrings: [String] = ["San Miguel Island, Cuyler Harbor from Lester Point Trail; PD",""]
    
    private var InfoCaptiontextstrings: [String] = ["San Miguel Island, landing skiff drop-offs and pickups, Culyer Beach; photo by Tim Hauf","San Miguel Island, hiking down to Cuyler Beach, the landing site.","San Miguel Island, Point Bennett, Pinnipeds hauled out on the beach; PD photo"]
    private var InfoCaptionAttributes : [[String: AnyObject]] =
        [[NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 16.0)!]]
    
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
        if segue.identifier == photoSequeId, let photographyPageViewController = segue.destinationViewController as? IslandPhotoCommentViewController {
            print("Hit Photography Page View Seque")
            //photographyPageViewController.photos = photos
            photographyPageViewController.islandID = 2
            photographyPageViewController.photoIndex = 0
            photographyPageViewController.photoName = photographyPageViewController.islandsPhotos[2][0]
            
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
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 20 {
            return 160
        } else {
            return 90
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let contentOffset = scrollView.contentOffset.y
        print(contentOffset)
        let t1: Bool = contentOffset > 3919.0
        let t2: Bool = contentOffset > 4883.0
        let t3: Bool = contentOffset > 6458.0
        let t4: Bool = contentOffset > 6824.0
        let t5: Bool = contentOffset > 7281.0
        let t6: Bool = contentOffset > 10270.0
        let t7: Bool = self.pageID == 2
        
        if t1 && t7{
            let ui = UIImage(imageLiteral: "ACTIVITIES_SUB_BOATING_KAYAKING_V06")
            self.ActivitiesBar.image = ui
            self.BoatingLabel.textColor = UIColor.blackColor()
            self.WildlifeLabel.textColor = UIColor.whiteColor()
        }
        else{
            let ui = UIImage(imageLiteral: "ACTIVITIES_SUB_OVERVIEW_V06")
            self.ActivitiesBar.image = ui
            self.BoatingLabel.textColor = UIColor.whiteColor()
            
        }
        if t2 && t7{
            let ui = UIImage(imageLiteral: "ACTIVITIES_SUB_WILDLIFE_WATCHING_V06")
            self.ActivitiesBar.image = ui
            self.BoatingLabel.textColor = UIColor.whiteColor()
            self.WildlifeLabel.textColor = UIColor.blackColor()
            self.FishingLabel.textColor = UIColor.whiteColor()
        }
        if t3 && t7{
            let ui = UIImage(imageLiteral: "ACTIVITIES_SUB_FISHING_V06")
            self.ActivitiesBar.image = ui
            self.WildlifeLabel.textColor = UIColor.whiteColor()
            self.FishingLabel.textColor = UIColor.blackColor()
            self.SwimmingLabel.textColor = UIColor.whiteColor()
        }
        if t4 && t7{
            let ui = UIImage(imageLiteral: "ACTIVITIES_SUB_DIVING_SWIMMING_V06")
            self.ActivitiesBar.image = ui
            self.FishingLabel.textColor = UIColor.whiteColor()
            self.SwimmingLabel.textColor = UIColor.blackColor()
            self.HikingLabel.textColor = UIColor.whiteColor()
        }
        if t5 && t7{
            let ui = UIImage(imageLiteral: "ACTIVITIES_SUB_HIKING_V06")
            self.ActivitiesBar.image = ui
            self.SwimmingLabel.textColor = UIColor.whiteColor()
            self.HikingLabel.textColor = UIColor.blackColor()
            self.CampingLabel.textColor = UIColor.whiteColor()
        }
        if t6 && t7{
            let ui = UIImage(imageLiteral: "ACTIVITIES_SUB_CAMPING_V06")
            self.ActivitiesBar.image = ui
            self.HikingLabel.textColor = UIColor.whiteColor()
            self.CampingLabel.textColor = UIColor.blackColor()
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
        self.PageTextView2.frame = CGRectMake(200, 75, 500, 10900)
        self.PageTextView2.alpha = 1
        self.PageScrollView2 = FadeScrollVIew()
        self.PageScrollView2.frame = CGRectMake(0, 120, 1024, 565)
        self.PageScrollView2.alpha = 0
        self.PageScrollView2.addSubview(self.PageTextView2)
        self.PageScrollView2.delegate = self
        self.SanMiguelView.insertSubview(self.PageScrollView2,atIndex: 7)
        self.PageScrollView2.contentSize.height = 12000
        self.PageTextView3 = UITextView()
        self.PageTextView3.backgroundColor = UIColor.clearColor()
        self.PageTextView3.frame = CGRectMake(200, 75, 500, 10900)
        self.PageTextView3.alpha = 1
        self.PageScrollView3 = FadeScrollVIew()
        self.PageScrollView3.frame = CGRectMake(0, 120, 1024, 565)
        self.PageScrollView3.alpha = 0
        self.PageScrollView3.addSubview(self.PageTextView3 )
        self.PageScrollView3.delegate = self
        self.SanMiguelView.insertSubview(self.PageScrollView3,atIndex: 7)
        self.PageScrollView3.contentSize.height = 12000
        let inames: [[String]] = [self.photonames, self.infophotonames, self.activitiesphotonames]
        let tnames: [[String]] = [self.AnchoragesCaptiontextstrings,self.InfoCaptiontextstrings,self.ActivitiesCaptiontextstrings]
        var j = 0
        
        let fms = [CGRectMake(615,152,78,19),CGRectMake(615,374,78,19), CGRectMake(615,648,78,19),CGRectMake(615,1007,78,19),CGRectMake(615,1309,78,19),CGRectMake(615,1780,78,19)]
        
        let mui = UIImage(imageLiteral: "MORE_INFO")
        for frm: CGRect in fms{
            
            let imgv = UIImageView()
            imgv.image = mui
            imgv.frame = frm
            imgv.alpha = 0
            imgv.contentMode = .ScaleAspectFit
            self.PageScrollView2.addSubview(imgv)
            actPagMInfo.append(imgv)
        }
        
        for frm: CGRect in fms{
            
            let imgv = UIImageView()
            imgv.image = mui
            imgv.frame = frm
            imgv.alpha = 0
            imgv.contentMode = .ScaleAspectFit
            self.PageScrollView3.addSubview(imgv)
            actPagMInfo2.append(imgv)
        }
        
        for iname: [String] in inames{
            var i = 0
            var y = 90.0
            let x = 710.0
            var iViews: [UIImageView!] = []
            var tViews: [UITextView!] = []
            //print(iname)
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
                if j == 2 {
                    y = y + 200.0 + Double(newheight)
                }
                else{
                    y = y + 60.0 + Double(newheight)
                }
                iViews.append(imageView)
                //print(j)
                //print(i)
                //print(imageView)
                self.PageScrollView2.addSubview(imageView)
                let textView = UITextView()
                let acstr: String = tnames[j][i]
                let myAttributes = self.InfoCaptionAttributes[0]
                let myAttrString1 = NSAttributedString(string: acstr,
                                                       attributes: myAttributes)
                textView.attributedText = myAttrString1
                textView.frame = CGRectMake(xcg, ycg+newheight, 300.0, 60.0)
                textView.alpha = 0
                textView.backgroundColor = UIColor.clearColor()
                tViews.append(textView)
                self.PageScrollView2.addSubview(textView)
                i += 1
            }
            //print(iViews.count)
            self.pageIVs2.append(iViews)
            self.capPagTVs2.append(tViews)
            
            j += 1
        }
        j = 0
        for iname: [String] in inames{
            var i = 0
            var y = 90.0
            let x = 710.0
            var iViews: [UIImageView!] = []
            var tViews: [UITextView!] = []
            //print(iname)
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
                if j == 2 {
                    y = y + 200.0 + Double(newheight)
                }
                else{
                    y = y + 60.0 + Double(newheight)
                }
                iViews.append(imageView)
                //print(j)
                //print(i)
                //print(imageView)
                self.PageScrollView3.addSubview(imageView)
                let textView = UITextView()
                let acstr: String = tnames[j][i]
                let myAttributes = self.InfoCaptionAttributes[0]
                let myAttrString1 = NSAttributedString(string: acstr,
                                                       attributes: myAttributes)
                textView.attributedText = myAttrString1
                textView.frame = CGRectMake(xcg, ycg+newheight, 300.0, 60.0)
                textView.alpha = 0
                textView.backgroundColor = UIColor.clearColor()
                tViews.append(textView)
                self.PageScrollView3.addSubview(textView)
                i += 1
            }
            //print(iViews.count)
            self.pageIVs3.append(iViews)
            self.capPagTVs3.append(tViews)
            
            j += 1
        }
        
        //add map image view
        let ui = UIImage(imageLiteral: "SAN_MIGUEL_MAP")
        let imageView = UIImageView(image: ui)
        imageView.contentMode = .ScaleAspectFit
        imageView.frame = CGRectMake(0, 0, 1024, 768)
        imageView.alpha = 0
        let imageView2 = UIImageView(image: ui)
        imageView2.contentMode = .ScaleAspectFit
        imageView2.frame = CGRectMake(0, 0, 1024, 768)
        imageView2.alpha = 0
        let imageView3 = UIImageView(image: ui)
        imageView3.contentMode = .ScaleAspectFit
        imageView3.frame = CGRectMake(0, 0, 1024, 768)
        imageView3.alpha = 1
        self.PageScrollView3.addSubview(imageView2)
        self.PageScrollView2.addSubview(imageView)
        self.pageIVs3.append([imageView2])
        self.pageIVs2.append([imageView])
        self.capPagTVs2.append([]) //no captions on map page
        self.capPagTVs3.append([])  // no captions on map page
        self.MapView = UIView()
        self.MapView.frame = CGRect(x: 0 ,y: 0 ,width:1024,height: 768)
        self.MapView.backgroundColor = UIColor.blackColor()
        self.MapView.alpha = 0
        self.MapView.addSubview(imageView3)
        let tv = UITextView()
        tv.backgroundColor = UIColor.clearColor()
        let mmyattr = [NSForegroundColorAttributeName: UIColor.blackColor(),
                       NSBackgroundColorAttributeName: UIColor.clearColor(),
                       NSFontAttributeName: UIFont(name: "Trajan Pro", size: 25.0)!]
        
        let mmystr = "San Miguel Island"
        let mmyAttrString1 = NSAttributedString(string: mmystr,
                                                attributes: mmyattr)
        tv.attributedText = mmyAttrString1
        tv.frame = CGRectMake(384, 23, 333, 43)
        self.MapView.addSubview(tv)
        self.SanMiguelView.insertSubview(self.MapView, atIndex: 9)
        
        var button = UIButton(frame: CGRect(x: 615, y: 152, width: 78, height: 19))
        button.backgroundColor = .clearColor()
        button.alpha = 1
        button.hidden = true
        button.setTitle("", forState: .Normal)
        button.addTarget(self, action: #selector(bA1), forControlEvents: .TouchUpInside)
        actPagMInfoB.append(button)
        self.PageScrollView2.addSubview(button)
        button = UIButton(frame: CGRect(x: 615, y: 374, width: 78, height: 19))
        button.backgroundColor = .clearColor()
        button.alpha = 1
        button.hidden = true
        button.setTitle("", forState: .Normal)
        button.addTarget(self, action: #selector(bA4), forControlEvents: .TouchUpInside)
        actPagMInfoB.append(button)
        self.PageScrollView2.addSubview(button)
        button = UIButton(frame: CGRect(x: 615, y: 648, width: 78, height: 19))
        button.backgroundColor = .clearColor()
        button.alpha = 1
        button.hidden = true
        button.setTitle("", forState: .Normal)
        button.addTarget(self, action: #selector(bA2), forControlEvents: .TouchUpInside)
        actPagMInfoB.append(button)
        self.PageScrollView2.addSubview(button)
        button = UIButton(frame: CGRect(x: 615, y: 1007, width: 78, height: 19))
        button.backgroundColor = .clearColor()
        button.alpha = 1
        button.hidden = true
        button.setTitle("", forState: .Normal)
        button.addTarget(self, action: #selector(bA3), forControlEvents: .TouchUpInside)
        actPagMInfoB.append(button)
        self.PageScrollView2.addSubview(button)
        button = UIButton(frame: CGRect(x: 615, y: 1309, width: 78, height: 19))
        button.backgroundColor = .clearColor()
        button.alpha = 1
        button.hidden = true
        button.setTitle("", forState: .Normal)
        button.addTarget(self, action: #selector(bA5), forControlEvents: .TouchUpInside)
        actPagMInfoB.append(button)
        self.PageScrollView2.addSubview(button)
        button = UIButton(frame: CGRect(x: 615, y: 1780, width: 78, height: 19))
        button.backgroundColor = .clearColor()
        button.alpha = 1
        button.hidden = true
        button.setTitle("", forState: .Normal)
        button.addTarget(self, action: #selector(bA6), forControlEvents: .TouchUpInside)
        actPagMInfoB.append(button)
        self.PageScrollView2.addSubview(button)
        button = UIButton(frame: CGRect(x: 615, y: 152, width: 78, height: 19))
        button.backgroundColor = .clearColor()
        button.alpha = 1
        button.hidden = true
        button.setTitle("", forState: .Normal)
        button.addTarget(self, action: #selector(bA1), forControlEvents: .TouchUpInside)
        actPagMInfoB2.append(button)
        self.PageScrollView3.addSubview(button)
        button = UIButton(frame: CGRect(x: 615, y: 374, width: 78, height: 19))
        button.backgroundColor = .clearColor()
        button.alpha = 1
        button.hidden = true
        button.setTitle("", forState: .Normal)
        button.addTarget(self, action: #selector(bA4), forControlEvents: .TouchUpInside)
        actPagMInfoB2.append(button)
        self.PageScrollView3.addSubview(button)
        button = UIButton(frame: CGRect(x: 615, y: 648, width: 78, height: 19))
        button.backgroundColor = .clearColor()
        button.alpha = 1
        button.hidden = true
        button.setTitle("", forState: .Normal)
        button.addTarget(self, action: #selector(bA2), forControlEvents: .TouchUpInside)
        actPagMInfoB2.append(button)
        self.PageScrollView3.addSubview(button)
        button = UIButton(frame: CGRect(x: 615, y: 1007, width: 78, height: 19))
        button.backgroundColor = .clearColor()
        button.alpha = 1
        button.hidden = true
        button.setTitle("", forState: .Normal)
        button.addTarget(self, action: #selector(bA3), forControlEvents: .TouchUpInside)
        actPagMInfoB2.append(button)
        self.PageScrollView3.addSubview(button)
        button = UIButton(frame: CGRect(x: 615, y: 1309, width: 78, height: 19))
        button.backgroundColor = .clearColor()
        button.alpha = 1
        button.hidden = true
        button.setTitle("", forState: .Normal)
        button.addTarget(self, action: #selector(bA5), forControlEvents: .TouchUpInside)
        actPagMInfoB2.append(button)
        self.PageScrollView3.addSubview(button)
        button = UIButton(frame: CGRect(x: 615, y: 1780, width: 78, height: 19))
        button.backgroundColor = .clearColor()
        button.alpha = 1
        button.hidden = true
        button.setTitle("", forState: .Normal)
        button.addTarget(self, action: #selector(bA6), forControlEvents: .TouchUpInside)
        actPagMInfoB2.append(button)
        self.PageScrollView3.addSubview(button)
        
        //add tableview
        self.actpageTableView2.delegate = self
        self.actpageTableView2.alpha = 0
        self.actpageTableView2.backgroundColor = UIColor.clearColor()
        self.actpageTableView2.tintColor = UIColor.clearColor()
        self.actpageTableView2.allowsSelection = false
        self.actpageTableView2.separatorColor = UIColor(white: 1.0,alpha: 0.5)
        //self.actpageTableView2.rowHeight = 100
        self.actpageTableView2.tableFooterView = UIView(frame: CGRectZero)
        self.actpageTableView2.tableHeaderView = UIView(frame: CGRectZero)
        //self.actpageTableView2.style = UITableViewStyle.Grouped;
        self.actpageTableView2.estimatedRowHeight = 200
        //self.actpageTableView2.rowHeight = UITableViewAutomaticDimension
        self.actpageTableView2.dataSource = dataSource
        self.actpageTableView2.reloadData()
        self.PageScrollView2.addSubview(self.actpageTableView2)
        self.actpageTableView2.frame = CGRectMake(200, 8290, 505, 3000)
        
        self.actpageTableView1.delegate = self
        self.actpageTableView1.alpha = 0
        self.actpageTableView1.backgroundColor = UIColor.clearColor()
        self.actpageTableView1.tintColor = UIColor.clearColor()
        self.actpageTableView1.allowsSelection = false
        self.actpageTableView1.separatorColor = UIColor(white: 1.0,alpha: 0.5)
        //self.actpageTableView1.rowHeight = 100
        self.actpageTableView1.tableFooterView = UIView(frame: CGRectZero)
        self.actpageTableView1.tableHeaderView = UIView(frame: CGRectZero)
        //self.actpageTableView2.style = UITableViewStyle.Grouped;
        self.actpageTableView1.estimatedRowHeight = 200
        //self.actpageTableView2.rowHeight = UITableViewAutomaticDimension
        self.actpageTableView1.dataSource = dataSource
        self.actpageTableView1.reloadData()
        self.PageScrollView3.addSubview(self.actpageTableView1)
        self.actpageTableView1.frame = CGRectMake(200, 8290, 505, 3000)
        
        self.actpageTableView22.delegate = self
        self.actpageTableView22.alpha = 0
        self.actpageTableView22.backgroundColor = UIColor.clearColor()
        self.actpageTableView22.tintColor = UIColor.clearColor()
        self.actpageTableView22.allowsSelection = false
        self.actpageTableView22.separatorColor = UIColor(white: 1.0,alpha: 0.5)
        //self.actpageTableView22.rowHeight = 100
        self.actpageTableView22.tableFooterView = UIView(frame: CGRectZero)
        self.actpageTableView22.tableHeaderView = UIView(frame: CGRectZero)
        //self.actpageTableView2.style = UITableViewStyle.Grouped;
        //self.actpageTableView2.
        //self.actpageTableView2.rowHeight = UITableViewAutomaticDimension
        self.actpageTableView22.dataSource = dataSource2
        self.actpageTableView22.reloadData()
        
        self.PageScrollView2.addSubview(self.actpageTableView22)
        self.actpageTableView22.frame = CGRectMake(200, 11025, 500, 2000)
        
        self.actpageTableView12.delegate = self
        self.actpageTableView12.alpha = 0
        self.actpageTableView12.backgroundColor = UIColor.clearColor()
        self.actpageTableView12.tintColor = UIColor.clearColor()
        self.actpageTableView12.allowsSelection = false
        self.actpageTableView12.separatorColor = UIColor(white: 1.0,alpha: 0.5)
        //self.actpageTableView12.rowHeight = 100
        self.actpageTableView12.tableFooterView = UIView(frame: CGRectZero)
        self.actpageTableView12.tableHeaderView = UIView(frame: CGRectZero)
        //self.actpageTableView2.style = UITableViewStyle.Grouped;
        //self.actpageTableView2.
        //self.actpageTableView2.rowHeight = UITableViewAutomaticDimension
        self.actpageTableView12.dataSource = dataSource2
        self.actpageTableView12.reloadData()
        
        self.PageScrollView3.addSubview(self.actpageTableView12)
        self.actpageTableView12.frame = CGRectMake(200, 11025, 500, 2000)
        
        //add activities Headers beyond hiking
        let campTV = UITextView()
        let campTV2 = UITextView()
        let astr: String = "Campground Information\n\n"
        let myattr: [String: AnyObject] = [NSForegroundColorAttributeName: UIColor.whiteColor(),
                                           NSBackgroundColorAttributeName: UIColor.clearColor(),
                                           NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!]
        let myAttrString1 = NSAttributedString(string: astr,
                                               attributes: myattr)
        campTV.attributedText = myAttrString1
        campTV2.attributedText = myAttrString1
        campTV.frame = CGRectMake(200, 10975, 300, 50)
        campTV.alpha = 0
        campTV.backgroundColor = UIColor.clearColor()
        campTV2.frame = CGRectMake(200, 10975, 300, 50)
        campTV2.alpha = 0
        campTV2.backgroundColor = UIColor.clearColor()
        self.PageScrollView2.addSubview(campTV)
        self.PageScrollView3.addSubview(campTV2)
        actPagHeaders.append(campTV)
        actPagHeaders2.append(campTV2)
        
        print(self.pageIVs2.count)
        print(self.pageIVs2[0].count)
        print(self.pageIVs2[1].count)
        print(self.pageIVs2[2].count)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadScrollPageTV2()
        self.PageScrollView.contentSize.height = 1900
        /*
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
        */
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
    
    func bA1(sender: UIButton!) {
        UIView.animateWithDuration(0.25, delay: 0.0, options: .CurveEaseOut, animations: {
            self.PageScrollView2.contentOffset.y = 3920.0
            self.PageScrollView3.contentOffset.y = 3920.0
            }, completion: { finished in
                if (finished){}})
    }
    
    @IBAction func BoatingClicked(sender: AnyObject) {
        UIView.animateWithDuration(0.25, delay: 0.0, options: .CurveEaseOut, animations: {
            self.PageScrollView2.contentOffset.y = 3920.0
            self.PageScrollView3.contentOffset.y = 3920.0
            }, completion: { finished in
                if (finished){}})
    }
    
    func bA2(sender: UIButton!) {
        UIView.animateWithDuration(0.25, delay: 0.0, options: .CurveEaseOut, animations: {
            self.PageScrollView2.contentOffset.y = 4884.0
            self.PageScrollView3.contentOffset.y = 4884.0
            }, completion: { finished in
                if (finished){}})
    }
    
    @IBAction func WildlifeClicked(sender: AnyObject) {
        UIView.animateWithDuration(0.25, delay: 0.0, options: .CurveEaseOut, animations: {
            self.PageScrollView2.contentOffset.y = 4884.0
            self.PageScrollView3.contentOffset.y = 4884.0
            }, completion: { finished in
                if (finished){}})
    }
    
    func bA3(sender: UIButton!) {
        UIView.animateWithDuration(0.25, delay: 0.0, options: .CurveEaseOut, animations: {
            self.PageScrollView2.contentOffset.y = 6459.0
            self.PageScrollView3.contentOffset.y = 6459.0
            }, completion: { finished in
                if (finished){}})
    }
    
    @IBAction func FishingClicked(sender: AnyObject) {
        UIView.animateWithDuration(0.25, delay: 0.0, options: .CurveEaseOut, animations: {
            self.PageScrollView2.contentOffset.y = 6459.0
            self.PageScrollView3.contentOffset.y = 6459.0
            }, completion: { finished in
                if (finished){}})
    }
    
    func bA4(sender: UIButton!) {
        UIView.animateWithDuration(0.25, delay: 0.0, options: .CurveEaseOut, animations: {
            self.PageScrollView2.contentOffset.y = 6825.0
            self.PageScrollView3.contentOffset.y = 6825.0
            }, completion: { finished in
                if (finished){}})
    }
    
    @IBAction func SwimmingClicked(sender: AnyObject) {
        UIView.animateWithDuration(0.25, delay: 0.0, options: .CurveEaseOut, animations: {
            self.PageScrollView2.contentOffset.y = 6825.0
            self.PageScrollView3.contentOffset.y = 6825.0
            }, completion: { finished in
                if (finished){}})
    }
    
    func bA5(sender: UIButton!) {
        UIView.animateWithDuration(0.25, delay: 0.0, options: .CurveEaseOut, animations: {
            self.PageScrollView2.contentOffset.y = 7282.0
            self.PageScrollView3.contentOffset.y = 7282.0
            }, completion: { finished in
                if (finished){}})
    }
    
    @IBAction func HikingClicked(sender: AnyObject) {
        UIView.animateWithDuration(0.25, delay: 0.0, options: .CurveEaseOut, animations: {
            self.PageScrollView2.contentOffset.y = 7282.0
            self.PageScrollView3.contentOffset.y = 7282.0
            }, completion: { finished in
                if (finished){}})
    }
    
    func bA6(sender: UIButton!) {
        UIView.animateWithDuration(0.25, delay: 0.0, options: .CurveEaseOut, animations: {
            self.PageScrollView2.contentOffset.y = 10271.0
            self.PageScrollView3.contentOffset.y = 10271.0
            }, completion: { finished in
                if (finished){}})
    }
    
    @IBAction func CampingClicked(sender: AnyObject) {
        UIView.animateWithDuration(0.25, delay: 0.0, options: .CurveEaseOut, animations: {
            self.PageScrollView2.contentOffset.y = 10271.0
            self.PageScrollView3.contentOffset.y = 10271.0
            }, completion: { finished in
                if (finished){}})
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
    
    @IBAction func MapClicked(sender: AnyObject) {
        self.enableMap()
    }
    
    
    
    func enableActivities(){
        self.activitiesActive = true
        self.prevpageID = self.pageID
        self.pageID = 2
        self.enablepageTransition(true)
    }
    
    func enableAnchorages(){
        self.anchorageActive = true
        self.prevpageID = self.pageID
        self.pageID = 0
        self.enablepageTransition(true)
    }
    
    func enableInfo(){
        self.infoActive = true
        self.prevpageID = self.pageID
        self.pageID = 1
        self.enablepageTransition(true)
    }
    
    func enableMap(){
        //self.infoActive = true
        self.prevpageID = self.pageID
        self.pageID = 3
        self.enablepageTransition(true)
    }
    
    func enableActivitieswA(){
        self.activitiesActive = true
        self.prevpageID = self.pageID
        self.pageID = 2
        self.enablepageTransition(false)
    }
    
    func enableAnchorageswA(){
        self.anchorageActive = true
        self.prevpageID = self.pageID
        self.pageID = 0
        self.enablepageTransition(false)
    }
    
    func enableInfowA(){
        self.infoActive = true
        self.prevpageID = self.pageID
        self.pageID = 1
        self.enablepageTransition(false)
    }
    
    func enableMapwA(){
        //self.infoActive = true
        self.prevpageID = self.pageID
        self.pageID = 3
        self.enablepageTransition(false)
    }
    
    func enablepageTransition(withAnim:  Bool){
        self.PageScrollView.contentOffset = CGPoint(x: 0, y: 0)
        self.IView2.hidden = false
        self.PageScrollView.hidden = false
        self.DismissPage.hidden = false
        var flagTransit = false
        let pageToIcon: [Int: String] = [0: "IslandIcons_ANCHORAGES_V04", 1: "IslandIcons_INFO_V04",
                                         2: "IslandIcons_ACTIVITIES_V04", 3: "IslandIcons_MAP_V04"]
        let pageToILabel: [Int: UITextField] = [0: self.AnchoragesLabel, 1: self.InfoLabel, 2: self.ActivitiesLabel, 3: self.MapLabel]
        let ui = UIImage(imageLiteral: pageToIcon[self.pageID]!)
        self.NavBar.image = ui
        
        pageToILabel[self.pageID]!.textColor = UIColor.blackColor()
        if self.otherPageActive{
            pageToILabel[self.prevpageID]!.textColor = UIColor.whiteColor()
        }
        else{
            self.HomeLabel.textColor = UIColor.whiteColor()
        }
        if self.otherPageActive{
            if self.switchPage{
                self.PageScrollView2.hidden = false
                self.PageScrollView2.contentOffset = CGPoint(x: 0, y: 0)
                let ptextstrings: [[String]] = [self.Anchoragestextstrings, self.Infotextstrings, self.Activitiestextstrings,[""]]
                let pattributes: [[[String: AnyObject]]] = [self.AnchoragesAttributes, self.InfoAttributes, self.ActivitiesAttributes,[[NSForegroundColorAttributeName: UIColor.whiteColor(),
                    NSBackgroundColorAttributeName: UIColor.clearColor(),
                    NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 24.0)!]]]
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
                    //self.capPagTVs2[self.pageID][i].alpha = 1
                    i+=1
                }
                
                for tv: UITextView in self.capPagTVs2[self.pageID]{
                    tv.alpha = 1
                }
                if (self.pageID == 2){
                    self.actPagHeaders[0].alpha = 1
                    self.actpageTableView2.alpha = 1
                    self.actpageTableView22.alpha = 1
                    self.ActButView.hidden = false
                    for iv: UIImageView in actPagMInfo{
                        iv.alpha = 1
                    }
                    for bt: UIButton in self.actPagMInfoB{
                        bt.hidden = false
                    }
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
            else if self.prevpageID == 2{
                self.activitiesActive = false
                self.ActivitiesButton.hidden = false
                self.ActButView.hidden = true
            }
            else if self.prevpageID == 3{
                self.MapButton.hidden = false
            }
        }
        if self.pageID == 0{
            self.AnchorageButton.hidden = true
        }
        else if self.pageID == 1{
            self.InfoButton.hidden = true
        }
        else if self.pageID == 2{
            self.ActivitiesButton.hidden = true
        }
        else if self.pageID == 3{
            self.MapButton.hidden = true
        }
        if !flagTransit{
            self.PageScrollView3.hidden = false
            self.PageScrollView3.contentOffset = CGPoint(x: 0, y: 0)
            let ptextstrings: [[String]] = [self.Anchoragestextstrings, self.Infotextstrings, self.Activitiestextstrings,[""]]
            let pattributes: [[[String: AnyObject]]] = [self.AnchoragesAttributes, self.InfoAttributes, self.ActivitiesAttributes,[[NSForegroundColorAttributeName: UIColor.whiteColor(),
                NSBackgroundColorAttributeName: UIColor.clearColor(),
                NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 24.0)!]]]
            var i = 0
            let result = NSMutableAttributedString()
            for textstring: String in ptextstrings[self.pageID]{
                
                
                
                let myAttributes = pattributes[pageID][i]
                let myAttrString1 = NSAttributedString(string: textstring,
                                                       attributes: myAttributes)
                result.appendAttributedString(myAttrString1)
                
                
                i+=1
            }
            self.PageTextView3.attributedText = result
            //change alphas on captions and photos for scrollview2 controller
            i = 0
            print("Page ID: ")
            print(self.pageID)
            for iv: UIImageView in self.pageIVs3[self.pageID]{
                iv.alpha = 1
                //self.capPagTVs3[self.pageID][i].alpha = 1
                i+=1
            }
            for tv: UITextView in self.capPagTVs3[self.pageID]{
                tv.alpha = 1
            }
            if (self.pageID == 2){
                self.actPagHeaders2[0].alpha = 1
                self.actpageTableView1.alpha = 1
                self.actpageTableView12.alpha = 1
                self.ActButView.hidden = false
                for iv: UIImageView in actPagMInfo2{
                    iv.alpha = 1
                }
                for bt: UIButton in self.actPagMInfoB2{
                    bt.hidden = false
                }
            }
            
        }
        if self.pageID == 3{
            self.MapView.hidden = false
            
        }
        
        if withAnim{
            UIView.animateWithDuration(1.0, delay: 0.0, options: .CurveEaseOut, animations: {
                self.IView.alpha = 0
                self.IView2.alpha = 1
                if self.activitiesActive{
                    self.ActivitiesBar.alpha = 1
                    self.ActButView.alpha = 1
                }
                else{
                    self.ActivitiesBar.alpha = 0
                    self.ActButView.alpha = 0
                }
                if !self.otherPageActive{
                    self.PageScrollView3.alpha = 1
                }
                else{
                    if self.switchPage{
                        self.PageScrollView3.alpha = 0
                        self.PageScrollView2.alpha = 1
                    }
                    else{
                        self.PageScrollView3.alpha = 1
                        self.PageScrollView2.alpha = 0
                    }
                }
                if self.pageID == 3{
                    self.MapView.alpha = 1
                    
                }
                if self.prevpageID == 3{
                    self.MapView.alpha = 0
                }
                self.CloseTV.alpha = 1
                }, completion: { finished in
                    if (finished){
                        if self.otherPageActive{
                            if self.switchPage{
                                self.switchPage = false
                                /*
                                 //clean up 1rst ScrollView for photos and captions
                                 var i = 0
                                 for piv: UIImageView! in self.actpageIVs{
                                 piv.alpha = 0
                                 self.actpageTVs[i].alpha = 0
                                 i+=1
                                 }
                                 */
                                var i = 0
                                for iv: UIImageView in self.pageIVs3[self.prevpageID]{
                                    iv.alpha = 0
                                    //self.capPagTVs3[self.prevpageID][i].alpha = 0
                                    i+=1
                                }
                                for tv: UITextView in self.capPagTVs3[self.prevpageID]{
                                    tv.alpha = 0
                                }
                                for iv: UIImageView in self.actPagMInfo{
                                    iv.alpha = 0
                                }
                                for bt: UIButton in self.actPagMInfoB{
                                    bt.hidden = true
                                }
                                self.actpageTableView1.alpha = 0
                                self.actpageTableView12.alpha = 0
                                
                            }
                            else{
                                var i = 0
                                for iv: UIImageView in self.pageIVs2[self.prevpageID]{
                                    iv.alpha = 0
                                    //self.capPagTVs2[self.prevpageID][i].alpha = 0
                                    i+=1
                                }
                                for tv: UITextView in self.capPagTVs2[self.prevpageID]{
                                    tv.alpha = 0
                                }
                                for iv: UIImageView in self.actPagMInfo2{
                                    iv.alpha = 1
                                }
                                for bt: UIButton in self.actPagMInfoB2{
                                    bt.hidden = true
                                }
                                self.actpageTableView2.alpha = 0
                                self.actpageTableView22.alpha = 0
                                self.switchPage = true
                            }
                        }
                        self.IView.hidden = true
                        self.otherPageActive = true
                        if self.prevpageID == 3{
                            self.MapView.hidden = true
                        }
                    }
                    if !self.activitiesActive{
                        self.ActButView.hidden = true
                    }
            })
        }
        else{
            self.IView.alpha = 0
            self.IView2.alpha = 1
            if self.activitiesActive{
                self.ActivitiesBar.alpha = 1
                self.ActButView.hidden = false
                self.ActButView.alpha = 1
            }
            else{
                self.ActivitiesBar.alpha = 0
                self.ActButView.alpha = 0
                self.ActButView.hidden = true
            }
            if !self.otherPageActive{
                self.PageScrollView3.alpha = 1
            }
            else{
                if self.switchPage{
                    self.PageScrollView3.alpha = 0
                    self.PageScrollView2.alpha = 1
                }
                else{
                    self.PageScrollView3.alpha = 1
                    self.PageScrollView2.alpha = 0
                }
            }
            if self.pageID == 3{
                self.MapView.alpha = 1
                
            }
            if self.prevpageID == 3{
                self.MapView.alpha = 0
            }
            self.CloseTV.alpha = 1
            if self.otherPageActive{
                if self.switchPage{
                    self.switchPage = false
                    /*
                     //clean up 1rst ScrollView for photos and captions
                     var i = 0
                     for piv: UIImageView! in self.actpageIVs{
                     piv.alpha = 0
                     self.actpageTVs[i].alpha = 0
                     i+=1
                     }
                     */
                    var i = 0
                    for iv: UIImageView in self.pageIVs3[self.prevpageID]{
                        iv.alpha = 0
                        //self.capPagTVs3[self.prevpageID][i].alpha = 0
                        i+=1
                    }
                    for tv: UITextView in self.capPagTVs3[self.prevpageID]{
                        tv.alpha = 0
                    }
                    for iv: UIImageView in actPagMInfo{
                        iv.alpha = 0
                    }
                    for bt: UIButton in self.actPagMInfoB{
                        bt.hidden = true
                    }
                    self.actpageTableView1.alpha = 0
                    self.actpageTableView12.alpha = 0
                    
                }
                else{
                    var i = 0
                    for iv: UIImageView in self.pageIVs2[self.prevpageID]{
                        iv.alpha = 0
                        //self.capPagTVs2[self.prevpageID][i].alpha = 0
                        i+=1
                    }
                    for tv: UITextView in self.capPagTVs2[self.prevpageID]{
                        tv.alpha = 0
                    }
                    for iv: UIImageView in actPagMInfo2{
                        iv.alpha = 0
                    }
                    for bt: UIButton in self.actPagMInfoB2{
                        bt.hidden = true
                    }
                    self.actpageTableView2.alpha = 0
                    self.actpageTableView22.alpha = 0
                    self.switchPage = true
                }
            }
            self.IView.hidden = true
            self.otherPageActive = true
        }
    }
    
    func enablemainpageTransition(){
        self.IView.hidden = false
        
        let pageToILabel: [Int: UITextField] = [0: self.AnchoragesLabel, 1: self.InfoLabel, 2: self.ActivitiesLabel, 3: self.MapLabel]
        let ui = UIImage(imageLiteral: "IslandIcons_ALL_WHITE_V04")
        self.NavBar.image = ui
        pageToILabel[self.pageID]!.textColor = UIColor.whiteColor()
        //self.HomeLabel.textColor = UIColor.blackColor()
        
        UIView.animateWithDuration(1.0, delay: 0.0, options: .CurveEaseOut, animations: {
            self.IView2.alpha = 0
            self.IView.alpha = 1
            self.PageScrollView2.alpha = 0
            self.PageScrollView3.alpha = 0
            self.MapView.alpha = 0
            self.ActivitiesBar.alpha = 0
            self.ActButView.alpha = 0
            
            self.CloseTV.alpha = 0
            }, completion: { finished in
                if (finished){
                    self.ActButView.hidden = true
                    self.IPageV1.alpha = 0
                    self.PageScrollView3.hidden = true
                    self.PageScrollView2.hidden = true
                    self.MapView.hidden = true
                    self.IView2.hidden = true
                    self.DismissPage.hidden = true
                    self.infoActive = false
                    self.anchorageActive = false
                    self.activitiesActive = false
                    self.otherPageActive = false
                    self.ActivitiesButton.hidden = false
                    self.AnchorageButton.hidden = false
                    self.InfoButton.hidden = false
                    self.MapButton.hidden = false
                    self.switchPage = true
                    var i = 0
                    /*
                     for piv: UIImageView! in self.actpageIVs{
                     piv.alpha = 0
                     self.actpageTVs[i].alpha = 0
                     i+=1
                     }
                     */
                    var j = 0
                    for pivs: [UIImageView!] in self.pageIVs2{
                        i = 0
                        for piv: UIImageView in pivs{
                            piv.alpha = 0
                            //self.capPagTVs2[j][i].alpha = 0
                            i+=1
                        }
                        j+=1
                    }
                    
                    for tivs: [UITextView!] in self.capPagTVs2{
                        
                        for tiv: UITextView in tivs{
                            tiv.alpha = 0
                            //self.capPagTVs2[j][i].alpha = 0
                        }
                    }
                    
                    j = 0
                    for pivs: [UIImageView!] in self.pageIVs3{
                        i = 0
                        for piv: UIImageView in pivs{
                            piv.alpha = 0
                            //self.capPagTVs3[j][i].alpha = 0
                            i+=1
                        }
                        j+=1
                    }
                    
                    for tivs: [UITextView!] in self.capPagTVs3{
                        
                        for tiv: UITextView in tivs{
                            tiv.alpha = 0
                            //self.capPagTVs2[j][i].alpha = 0
                        }
                    }
                    for iv: UIImageView in self.actPagMInfo{
                        iv.alpha = 0
                    }
                    for iv: UIImageView in self.actPagMInfo2{
                        iv.alpha = 0
                    }
                    for bt: UIButton in self.actPagMInfoB{
                        bt.hidden = true
                    }
                    for bt: UIButton in self.actPagMInfoB2{
                        bt.hidden = true
                    }
                    self.actPagHeaders[0].alpha = 1
                    self.actpageTableView2.alpha = 0
                    self.actpageTableView22.alpha = 0
                    self.actpageTableView1.alpha = 0
                    self.actpageTableView12.alpha = 0
                    
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