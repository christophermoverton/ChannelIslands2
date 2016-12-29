//
//  AnacapaViewController.swift
//  ChannelIsland
//
//  Created by Christopher Overton on 8/30/16.
//  Copyright © 2016 Christopher Overton. All rights reserved.
//


import UIKit



class AnacapaViewController: UIViewController, UITextViewDelegate, UITableViewDelegate {
    private let photoSequeId = "Photography"
    private let revealSequeId = "revealSegue"
    private var swipeState: Bool = true  //right state
    private let horizontalTransitionController = HorizontalTransitionController()
    private let iname1 = "bar4"
    private let iname2 = "bar5"
    private let iname3 = "bar3"
    let vname: String = "Anacapa Island"
    var imageArray: [UIImage] = []
    @IBOutlet weak var Barview: UIImageView!
    @IBOutlet weak var TitleText: UITextView!
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
    @IBOutlet weak var MapButton: UIButton!
    @IBOutlet weak var PhotoButton: UIButton!
    @IBOutlet weak var ActButView: UIView!
    @IBOutlet weak var BoatingButton: UIButton!
    @IBOutlet weak var WildlifeButton: UIButton!
    @IBOutlet weak var FishingButton: UIButton!
    @IBOutlet weak var SwimmingButton: UIButton!
    @IBOutlet weak var HikingButton: UIButton!
    @IBOutlet weak var CampingButton: UIButton!
   
    
    @IBOutlet weak var ActivitiesBar: UIImageView!
    private var infoActive: Bool = false
    private var anchorageActive: Bool = false
    private var activitiesActive: Bool = false
    private var otherPageActive: Bool = false
    private var switchPage: Bool = true
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
    @IBOutlet weak var HomeLabel: UITextField!
    @IBOutlet weak var InfoLabel: UITextField!
    @IBOutlet weak var MapLabel: UITextField!
    @IBOutlet weak var ActivitiesLabel: UITextField!
    @IBOutlet weak var AnchoragesLabel: UITextField!
    @IBOutlet weak var PhotoGalleryLabel: UITextField!
    @IBOutlet weak var BoatingLabel: UITextView!
    @IBOutlet weak var WildlifeLabel: UITextView!
    @IBOutlet weak var FishingLabel: UITextView!
    @IBOutlet weak var SwimmingLabel: UITextView!
    @IBOutlet weak var CampingLabel: UITextView!
   
    @IBOutlet weak var HikingLabel: UITextView!
    
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
    @IBOutlet var AnacapaView: UIView!
    private var dataSource: HikesDataSource
    private var dataSource2: CampgroundDataSource
    private var pageID : Int = 0
    private var prevpageID: Int = 0
    private var actHikes: [Hike] = [Hike(destination: "Destination",distance: "Distance",difficulty: "Difficulty",briefdescription: "Brief Description"),Hike(destination: "Inspiration Point",distance: "1.5",difficulty: "Easy",briefdescription: "Extraordinary views. Not to be missed."),Hike(destination: "Pinniped Point",distance: ".4 ",difficulty: "Easy",briefdescription: "Overlooks a haul out site for California sea lions."),Hike(destination: "Cathedral Cove",distance: ".6",difficulty: "Easy",briefdescription: "Overlooks a cove with beautiful rock formations."),Hike(destination: "Lighthouse",distance: ".5",difficulty: "Easy",briefdescription: "View the historic lighthouse built in 1932.")]
    
    private var campgrounds: [Campground] = [Campground(island: "Island", rreservation: "Required Reservation", distlandtocamp: "Distance From Landing To Campground",nofcampsites: "Number Of Campsites",camperspsite: "Campers Per Site"),Campground(island: "Anacapa", rreservation: "Yes", distlandtocamp: "157 stairs, .5 miles",nofcampsites: "7",camperspsite: "4-6"),Campground(island: "Eastern Santa Cruz (Scorpion Ranch)", rreservation: "          Yes", distlandtocamp: ".5 miles, flat",nofcampsites: "31",camperspsite: "6-15"),Campground(island: "Western Santa Cruz (The Nature Conservancy)", rreservation: "NO CAMPING ALLOWED", distlandtocamp: "NO CAMPING ALLOWED",nofcampsites: "NO CAMPING ALLOWED",camperspsite: "NO CAMPING ALLOWED"),Campground(island: "Santa Rosa", rreservation: "Yes", distlandtocamp: "1.5 miles from pier, flat; .25 miles from airstrip, flat",nofcampsites: "15",camperspsite: "5"),Campground(island: "San Miguel", rreservation: "Yes", distlandtocamp: "1 mile, steep uphill",nofcampsites: "9",camperspsite: "4"),Campground(island: "Santa Barbara", rreservation: "Yes", distlandtocamp: ".25 miles, steep uphill",nofcampsites: "10",camperspsite: "4")]
    
    private var Infotextstrings: [String] = ["INFO\n\n","Only 12 miles from the mainland, this breathtaking 5-mile spine of rock thrusts up from the ocean and separates into three islets. Waves and wind have eroded Anacapa’s rocky shores, creating towering cliffs, sea caves, and natural bridges, including the iconic Arch Rock. This stunning island also provides a safe haven for shore and seabirds, seals and sea lions. Watch for seasonal closures to protect their nesting and pupping grounds."]
    
    private var InfoAttributes : [[String: AnyObject]] = [[NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSBackgroundColorAttributeName: UIColor.clearColor(),
        NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 24.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSBackgroundColorAttributeName: UIColor.clearColor(),
        NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!]]
    private var Anchoragestextstrings: [String] = ["ANCHORAGES\n\n","Landing Cove\n\n","Located on East Anacapa’s northern shore, Landing Cove is the main anchorage for the island. Passenger ferry operators dock here. Landing Cove is an ideal destination for boaters on either one-day or multi-day trips to the Channel Islands. \n\n","Frenchy’s Cove\n\n","Also located on the northern shore of East Anacapa, Frenchy’s Cove is a popular fair weather anchorage for daytime use.\n\n","East Fish Camp\n\n","Located on the southern side of Middle Anacapa, East Fish Camp offers good fair weather anchorage for daytime use. "]
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
        NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 24.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!]]
    
    private var Activitiestextstrings: [String] = ["ACTIVITIES\n\n","Boating and Kayaking\n\n","Boating Safety\n","\t•Don’t be tempted to cross through the gap between East and Middle Anacapa. It’s too shallow and has too much surge to cross, even for kayaks. Please don’t try it!\n\t• Please be aware no personal watercraft (i.e. Waverunner tm) are allowed within the National Park.\n\n","Kayaking\n\n","East Anacapa\n\n","\t• Not far from Landing Cove, the small sea cave called Frenchy’s Secret is a popular destination for kayakers.\n\t• Many kayakers paddle out to the easternmost point of Anacapa to visit the iconic Arch Rock. This open-water area is recommended for expert kayakers only.\n\n","Middle Anacapa\n\n","\t Kayakers exploring beautiful Cathedral Cove on Middle Anacapa have a chance to paddle next to stunning spires such as the iconic Witch’s Hat and several sea caves.\n\n","Diving, Snorkeling, and Swimming\n\n","Marine Protected Areas\n\n","\t• When diving in all marine protected areas, please remember: \"Leave only bubbles, take only memories.\"\n\n","East Anacapa\n\n","\t• Some of East Anacapa’s best diving may be found at Landing Cove and Cathedral Cove. Both areas are within the marine protected area and offer divers the chance to see lots of fish on any given day.\n\n","West Anacapa\n\n","\t• Goldfish Bowl and Cat Rock on West Anacapa offer good diving as conditions permit.\n\n","Wildlife Watching\n\n","\t• With miles of both marine protected and conservation areas, Anacapa offers refuge to diverse marine life: rookeries for the endangered California Brown Pelican dot the rocks; California sea lions and harbor seals rest and breed along the shores; and Scripps’s Murrelets wheel in the sky.\n\n\t• Kayakers will likely see sea lions, seal pups, pelicans, and cormorants; bright orange Garibaldi flitting through the water, and blowholes spewing in the rocks.\n\n\t•  Please maintain a distance of 100 meters offshore so as not to disturb nesting and pupping sites.\n\n","Fishing\n\n","\t• Over 80 percent of the waters near the Channel Islands is open to fishing.\n\n\t• Anacapa’s south side is open to fishing. The north side is within a protected Marine Reserve.\n\n\t• Sport fishing outside marine protected areas requires possession of a valid State of California fishing license with an ocean enhancement stamp.\n\n\t• All California Department of Fish and Game regulations apply.\n\n\t• Rockfish, White Sea Bass, Halibut, Barracuda, Calico Bass, and Yellowtail are all caught in these rich waters.\n\n","Hiking\n\n","\t• East Anacapa’s hiking trails are short (around 2 miles) but utterly spectacular.\n\n\t•  Please note that disembarking and ascending 157 steps to the plateau can be moderately strenuous.\n\n\t•  Rangers and naturalists offer guided tours year-round at Middle Anacapa.\n\n\t• Note that West Anacapa is a Natural Research area and is closed on the eastern tip, with the exception of Frenchy’s Cove. Frenchy’s is a popular anchorage for boaters and offers fabulous tide-pooling.\n\n","Camping\n\n","\t• The campground on Anacapa is on an open plateau with ocean views. It is a half-mile trek from the landing and has 7 campsites.\n\n\t• Year-round camping is available; overnight fees apply. Reserve your site well in advance at recreation.gov or call 877-444-6777. Concession boats fill to capacity more quickly than campground sites are filled, so book your boat transportation for overnight trips first. There is no water or shade, so pack what you need.\n\n\t• The park provides picnic tables, lock boxes for food, and pit toilets.\n\n\t• Remember that you’ll be hauling everything else from the pier to your site, so bring essentials only.\n\n\t• The campsite can be noisy: expect to have nesting gulls nearby.\n\n","","______________________________\n\nBoating and Kayaking \n\n","Weather\n","\t• Visitors can boat to the islands on their own or with the park’s approved ferry operators. Strong currents, shifting swells, dense fog, strong winds and choppy seas can appear suddenly. Come prepared.\n\n","Anchorages\n\n","\t• Anacapa’s main anchorages are at Landing Cove and Frenchy’s Cove. On the south side, East Fish Camp or Cat Rock provide shelter and additional anchorage sites, although they are exposed to southerly swells.\n\n\t• Wherever you anchor, there are no all-weather anchorages around the islands.  Therefore, it is recommended that a person stay on board at all times.\n\n","Forecasts\n","\t• Monitor VHFG Weather Channel 3 (WX3), VHF-FM 162.475 mhz for marine forecasts. On the web, channelislands.noaa.gov or nwsla.noaa.gov have current weather. There are electronic weather kiosks in Santa Barbara and Channel Islands harbors.\n\n","______________________________\n\nWildlife Watching\n\n","What to Look For\n","\t• January/February: enjoy great tidepooling in the afternoons. See gray whales heading to Baja California.\n\n\t• March/April: Island flowers are in full bloom through April. The giant coreopsis are in full bloom. Gray whales are visible through May. Brant geese are on the same schedule. Western Gulls begin nesting. Scripps’s Murrelets are nesting through July. Grunions leave the water to spawn on the beach, now through May.\n\n\t• May/June: Dense fog is common. Blue and humpback whales arrive to feed on krill. Red-Necked Phalaropes can be seen in the Santa Barbara Channel.  Grunion beach spawning continues after high tides and continues for several hours. Endangered Least Terns, Pink-footed Shearwaters and Ashy Storm Petrels can be seen in the channel at these times. California sea lion breeding and pupping runs from May through July. Scripps’s Murrelets nest March thru July. Grunion spawning peaks around this time.\n\n\t• July/August: Fog diminishes and underwater visibility increases. More of the same as blue and humpback whales feed on krill. Sooty and Pink-footed Shearwaters visit the channel. Red-necked Phalaropes and Ashy and Black Storm petrels do the same. Endangered Least Terns and Scripps’s Murrelets can be seen on the islands.\n\n\t• September/October: Warm weather, calm winds and seas are common.  Jellies are abundant in the coastal waters. Fin whales, Sei whales and blue whales can be observed feeding. Sooty and Pink-footed Shearwaters visit the channel. Red-necked Phalaropes, and Ashy and Black Storm Petrels do the same. Endangered Least Terns and Scripps’s Murrelets can be seen on the islands.\n\n\t• November/December: Winter storms appear. Best tidepooling months are now, as afternoon low tides expose invertebrates. Jellies are in abundance.\n\n","______________________________\n\nFishing\n\n","\t• Check out daily marine forecasts: http://www.usps.org/ventura/currentconditions.html\n\n\t•  California Ocean Sport fishing regulations: http://www.dfg.ca.gov/marine/oceansportregs.asp\n\n\t","______________________________\n\nDiving, Snorkeling, and Swimming \n\n","Diving\n","• Even in August the water is rather cold, so a wet suit is recommended for snorkeling and swimming.\n\n\t• Anacapa’s trails don’t provide shore access, as the island is ringed by steep cliffs.\n\n\t• Cathedral Cove and Frenchy’s Cove are accessible only by boat or kayak.\n\n\t","______________________________\n\nHiking\n","\t• After climbing the steep stairs at Landing Cove, the trails are a figure-8 shaped system that meanders over gentle slopes to dramatic overlooks and coastal views.\n\t• The trails are all easy and range from .5 and 1.5 miles, round trip.\n\t• Please walk only on established trails. This protects the fragile bird nests on the ground.\n\t•  An interpretive trail guide is available at the visitor center.\n\n","Hiking Trails\n"]
    
    private var ActivitiesAttributes : [[String: AnyObject]] = [
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 28.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
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
        NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 24.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSBackgroundColorAttributeName: UIColor.clearColor(),
        NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSBackgroundColorAttributeName: UIColor.clearColor(),
        NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 28.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
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
            NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 28.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 24.0)!],
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
            NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 28.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 24.0)!],
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
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!],
        [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 24.0)!]]
    
        private let photonames: [String] = ["Anacapa_Landing_Cove"]
        private let infophotonames: [String] = ["Inspiration_point"]
        private let activitiesphotonames: [String] = ["anacapaimage009","anacapaimage011","anacapaimage013","anacapaimage015","anacapaimage017","anacapaimage019","anacapaimage021","anacapaimage023","anacapaimage025","anacapaimage027","anacapaimage029","anacapaimage031","anacapaimage033","anacapaimage035","anacapaimage037","anacapaimage039","anacapaimage041","anacapaimage043"]
    private var InfoCaptiontextstrings: [String] = ["Anacapa Island, Inspiration point."]
    private var AnchoragesCaptiontextstrings: [String] = ["Anacapa’s Landing Cove; NPS"]
    private var ActivitiesCaptiontextstrings: [String] = ["Kayaking Anacapa’s Arch Rock, the easternmost point; photo by Tim Hauf","Arch Rock, Anacapa. Photographer; How Cheng","Anacapa Island, Cathedral Cove; photo by Tim Hauf","Anacapa Aerial View of Arch Point, Bob Schwemmer/NPS","NOAA fish survey at Anacapa; Bob Schwemmer","Anacapa’s western shore, wreck diving the Del Rio; Bob Schwemmer","Anacapa kelp beds; Claire Fackler","Diver at Anacapa; Clark Anderson/wikimedia","California Brown Pelican; NPS","Harbor seal and pup at Anacapa; photo by Jeff Foote ","Humbpack Whale; Bob Schwemmer","Wildflowers (giant coreopsis) and the Anacapa lighthouse in the background; NPS","Anacapa Arch, Shauna Bingham/NOAA","Lighthouse seen from the trail. Public Domain photo.","Inspiration Point, Anacapa; Claire Fackler/NPS","Anacapa Campground; Tim Hauf","Middle Anacapa, giant coreopsis in bloom; Bob Schwemmer","Anacapa, Western Gull; Claire Fackler",""]
    private var InfoCaptionAttributes : [[String: AnyObject]] =
        [[NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSBackgroundColorAttributeName: UIColor.clearColor(),
            NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 16.0)!]]
    /*
    private var Activitiestextstrings2: [String] = ["ACTIVITIES\n\n","Boating and Kayaking\n\n","Boating Safety\n","\t•Don’t be tempted to cross through the gap between East and Middle Anacapa. It’s too shallow and has too much surge to cross, even for kayaks. Please don’t try it!\n\t• Please be aware no personal watercraft (i.e. Waverunner tm) are allowed within the National Park.\n\n","Kayaking\n\n","East Anacapa\n\n","\t Not far from Landing Cove, the small sea cave called Frenchy’s Secret is a popular destination for kayakers.\n\t• Many kayakers paddle out to the easternmost point of Anacapa to visit the iconic Arch Rock. This open-water area is recommended for expert kayakers only.\n\n","Middle Anacapa\n\n,","\t	Kayakers exploring beautiful Cathedral Cove on Middle Anacapa have a chance to paddle next to stunning spires such as the iconic Witch’s Hat and several sea caves.\n\n","Diving, Snorkeling, and Swimming\n\n","Marine Protected Areas\n\n","\t•	When diving in all marine protected areas, please remember: \"Leave only bubbles, take only memories.\"\n\n","East Anacapa\n\n","\t•	Some of East Anacapa’s best diving may be found at Landing Cove and Cathedral Cove. Both areas are within the marine protected area and offer divers the chance to see lots of fish on any given day.\n\n","West Anacapa\n\n","\t• Goldfish Bowl and Cat Rock on West Anacapa offer good diving as conditions permit.\n\n","Wildlife Watching\n\n","\t• With miles of both marine protected and conservation areas, Anacapa offers refuge to diverse marine life: rookeries for the endangered California Brown Pelican dot the rocks; California sea lions and harbor seals rest and breed along the shores; and Scripps’s Murrelets wheel in the sky.\n\n\t• Kayakers will likely see sea lions, seal pups, pelicans, and cormorants; bright orange Garibaldi flitting through the water, and blowholes spewing in the rocks.\n\n\t•  Please maintain a distance of 100 meters offshore so as not to disturb nesting and pupping sites.\n\n","Fishing\n\n","\t• Over 80 percent of the waters near the Channel Islands is open to fishing.\n\n\t• Anacapa’s south side is open to fishing. The north side is within a protected Marine Reserve.\n\n\t• Sport fishing outside marine protected areas requires possession of a valid State of California fishing license with an ocean enhancement stamp.\n\n\t• All California Department of Fish and Game regulations apply.\n\n\t• Rockfish, White Sea Bass, Halibut, Barracuda, Calico Bass, and Yellowtail are all caught in these rich waters.\n\n","Hiking\n\n","\t• East Anacapa’s hiking trails are short (around 2 miles) but utterly spectacular.\n\n\t•  Please note that disembarking and ascending 157 steps to the plateau can be moderately strenuous.\n\n\t•  Rangers and naturalists offer guided tours year-round at Middle Anacapa.\n\n\t• Note that West Anacapa is a Natural Research area and is closed on the eastern tip, with the exception of Frenchy’s Cove. Frenchy’s is a popular anchorage for boaters and offers fabulous tide-pooling.\n\n","Camping\n\n","\t• The campground on Anacapa is on an open plateau with ocean views. It is a half-mile trek from the landing and has 7 campsites.\n\n\t• Year-round camping is available; overnight fees apply. Reserve your site well in advance at recreation.gov or call 877-444-6777. Concession boats fill to capacity more quickly than campground sites are filled, so book your boat transportation for overnight trips first. There is no water or shade, so pack what you need.\n\n\t• The park provides picnic tables, lock boxes for food, and pit toilets.\n\n\t• Remember that you’ll be hauling everything else from the pier to your site, so bring essentials only.\n\n\t• The campsite can be noisy: expect to have nesting gulls nearby.\n\n","Activities (More Info Level)\n\n","Boating and Kayaking (more info)\n\n","Weather\n","\t• Visitors can boat to the islands on their own or with the park’s approved ferry operators. Strong currents, shifting swells, dense fog, strong winds and choppy seas can appear suddenly. Come prepared.\n\n","Anchorages\n\n","\t• Anacapa’s main anchorages are at Landing Cove and Frenchy’s Cove. On the south side, East Fish Camp or Cat Rock provide shelter and additional anchorage sites, although they are exposed to southerly swells.\n\n\t• Wherever you anchor, there are no all-weather anchorages around the islands.  Therefore, it is recommended that a person stay on board at all times.\n\n","Forecasts\n","\t• Monitor VHFG Weather Channel 3 (WX3), VHF-FM 162.475 mhz for marine forecasts. On the web, channelislands.noaa.gov or nwsla.noaa.gov have current weather. There are electronic weather kiosks in Santa Barbara and Channel Islands harbors.\n\n","Wildlife Watching (more info)\n\n","What to Look For\n,","\t•	January/February: enjoy great tidepooling in the afternoons. See gray whales heading to Baja California.\n\n\t•	March/April: Island flowers are in full bloom through April. The giant coreopsis are in full bloom. Gray whales are visible through May. Brant geese are on the same schedule. Western Gulls begin nesting. Scripps’s Murrelets are nesting through July. Grunions leave the water to spawn on the beach, now through May.\n\n\t• May/June: Dense fog is common. Blue and humpback whales arrive to feed on krill. Red-Necked Phalaropes can be seen in the Santa Barbara Channel.  Grunion beach spawning continues after high tides and continues for several hours. Endangered Least Terns, Pink-footed Shearwaters and Ashy Storm Petrels can be seen in the channel at these times. California sea lion breeding and pupping runs from May through July. Scripps’s Murrelets nest March thru July. Grunion spawning peaks around this time.\n\n\t• July/August: Fog diminishes and underwater visibility increases. More of the same as blue and humpback whales feed on krill. Sooty and Pink-footed Shearwaters visit the channel. Red-necked Phalaropes and Ashy and Black Storm petrels do the same. Endangered Least Terns and Scripps’s Murrelets can be seen on the islands.\n\n\t• September/October: Warm weather, calm winds and seas are common.  Jellies are abundant in the coastal waters. Fin whales, Sei whales and blue whales can be observed feeding. Sooty and Pink-footed Shearwaters visit the channel. Red-necked Phalaropes, and Ashy and Black Storm Petrels do the same. Endangered Least Terns and Scripps’s Murrelets can be seen on the islands.\n\n\t• November/December: Winter storms appear. Best tidepooling months are now, as afternoon low tides expose invertebrates. Jellies are in abundance.\n\n","Fishing (more info)\n\n","\t• Check out daily marine forecasts: http://www.usps.org/ventura/currentconditions.html\n\n\t•  California Ocean Sport fishing regulations: http://www.dfg.ca.gov/marine/oceansportregs.asp\n\n\t","Diving, Snorkeling, and Swimming (more info)\n\n","Diving\n","• Even in August the water is rather cold, so a wet suit is recommended for snorkeling and swimming.\n\n\t• Anacapa’s trails don’t provide shore access, as the island is ringed by steep cliffs.\n\n\t• Cathedral Cove and Frenchy’s Cove are accessible only by boat or kayak.\n\n\t","Hiking (more info)\n","\t• After climbing the steep stairs at Landing Cove, the trails are a figure-8 shaped system that meanders over gentle slopes to dramatic overlooks and coastal views.\n\t• The trails are all easy and range from .5 and 1.5 miles, round trip.\n\t• Please walk only on established trails. This protects the fragile bird nests on the ground.\n\t•  An interpretive trail guide is available at the visitor center.\n\n\t"]
    */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("Got This Far!")
        print(segue.identifier)
        var checkString: String = (segue.identifier)!
        print(checkString.rangeOfString(revealSequeId) != nil)
        self.horizontalTransitionController.f1 = self.TitleText.frame
        self.horizontalTransitionController.vname1 = "Anacapa Island"
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
        if segue.identifier == photoSequeId, let photographyPageViewController = segue.destinationViewController as? IslandPhotoCommentViewController {
            print("Hit Photography Page View Seque")
            //photographyPageViewController.photos = photos
            photographyPageViewController.islandID = 1
            photographyPageViewController.photoIndex = 0
            photographyPageViewController.photoName = photographyPageViewController.islandsPhotos[1][0]
            
        }
        if checkString.rangeOfString("revealSegue") != nil, let destinationViewController = segue.destinationViewController as? SantaCruzViewController {
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
        if checkString.rangeOfString("revealSeque") != nil, let destinationViewController = segue.destinationViewController as? SantaBarbaraViewController {
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
        self.PageTextView2.frame = CGRectMake(200, 75, 500, 8000)
        self.PageTextView2.editable = false
        self.PageTextView2.alpha = 1
        self.PageScrollView2 = FadeScrollVIew()
        self.PageScrollView2.frame = CGRectMake(0, 120, 1024, 565)
        self.PageScrollView2.alpha = 0
        self.PageScrollView2.addSubview(self.PageTextView2)
        self.PageScrollView2.delegate = self
        self.AnacapaView.insertSubview(self.PageScrollView2,atIndex: 7)
        self.PageScrollView2.contentSize.height = 9000
        self.PageTextView3 = UITextView()
        self.PageTextView3.backgroundColor = UIColor.clearColor()
        self.PageTextView3.frame = CGRectMake(200, 75, 500, 8000)
        self.PageTextView3.editable = false
        self.PageTextView3.alpha = 1
        self.PageScrollView3 = FadeScrollVIew()
        self.PageScrollView3.frame = CGRectMake(0, 120, 1024, 565)
        self.PageScrollView3.alpha = 0
        self.PageScrollView3.addSubview(self.PageTextView3 )
        self.PageScrollView3.delegate = self
        self.AnacapaView.insertSubview(self.PageScrollView3,atIndex: 7)
        self.PageScrollView3.contentSize.height = 9000
        let inames: [[String]] = [self.photonames, self.infophotonames, self.activitiesphotonames]
        let tnames: [[String]] = [self.AnchoragesCaptiontextstrings,self.InfoCaptiontextstrings,self.ActivitiesCaptiontextstrings]
        var j = 0
        
        //load more info buttons 
        let fms = [CGRectMake(615,150,78,19),CGRectMake(615,980,78,19), CGRectMake(615,1587,78,19),CGRectMake(615,2109,78,19),CGRectMake(615,2688,78,19),CGRectMake(615,3191,78,19)]
        
        var ui = UIImage(imageLiteral: "MORE_INFO")
        for frm: CGRect in fms{
            
            let imgv = UIImageView()
            imgv.image = ui
            imgv.frame = frm
            imgv.alpha = 0
            imgv.contentMode = .ScaleAspectFit
            self.PageScrollView2.addSubview(imgv)
            actPagMInfo.append(imgv)
        }
        
        for frm: CGRect in fms{
            
            let imgv = UIImageView()
            imgv.image = ui
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
                textView.frame = CGRectMake(xcg, ycg+newheight-10.0, 300.0, 60.0)
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
                var tvy = ycg+newheight-10.0
                if j == 2{
                    tvy = ycg+newheight
                }
                textView.frame = CGRectMake(xcg, tvy, 300.0, 60.0)
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
        ui = UIImage(imageLiteral: "ANACAPA_MAP")
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
        self.MapView.backgroundColor = UIColor.clearColor()
        self.MapView.alpha = 0
        self.MapView.addSubview(imageView3)
        let tv = UITextView()
        tv.backgroundColor = UIColor.clearColor()
        let mmyattr = [NSForegroundColorAttributeName: UIColor.blackColor(),
         NSBackgroundColorAttributeName: UIColor.clearColor(),
         NSFontAttributeName: UIFont(name: "Trajan Pro", size: 25.0)!]

        let mmystr = "Anacapa Island"
        let mmyAttrString1 = NSAttributedString(string: mmystr,
                                               attributes: mmyattr)
        tv.attributedText = mmyAttrString1
        tv.frame = CGRectMake(384, 23, 333, 43)
        self.MapView.addSubview(tv)
        self.AnacapaView.insertSubview(self.MapView, atIndex: 9)

        
        var button = UIButton(frame: CGRect(x: 615, y: 150, width: 78, height: 19))
        button.backgroundColor = .clearColor()
        button.alpha = 1
        button.hidden = true
        button.setTitle("", forState: .Normal)
        button.addTarget(self, action: #selector(bA1), forControlEvents: .TouchUpInside)
        actPagMInfoB.append(button)
        self.PageScrollView2.addSubview(button)
        button = UIButton(frame: CGRect(x: 615, y: 980, width: 78, height: 19))
        button.backgroundColor = .clearColor()
        button.alpha = 1
        button.hidden = true
        button.setTitle("", forState: .Normal)
        button.addTarget(self, action: #selector(bA4), forControlEvents: .TouchUpInside)
        actPagMInfoB.append(button)
        self.PageScrollView2.addSubview(button)
        button = UIButton(frame: CGRect(x: 615, y: 1587, width: 78, height: 19))
        button.backgroundColor = .clearColor()
        button.alpha = 1
        button.hidden = true
        button.setTitle("", forState: .Normal)
        button.addTarget(self, action: #selector(bA2), forControlEvents: .TouchUpInside)
        actPagMInfoB.append(button)
        self.PageScrollView2.addSubview(button)
        button = UIButton(frame: CGRect(x: 615, y: 2109, width: 78, height: 19))
        button.backgroundColor = .clearColor()
        button.alpha = 1
        button.hidden = true
        button.setTitle("", forState: .Normal)
        button.addTarget(self, action: #selector(bA3), forControlEvents: .TouchUpInside)
        actPagMInfoB.append(button)
        self.PageScrollView2.addSubview(button)
        button = UIButton(frame: CGRect(x: 615, y: 2688, width: 78, height: 19))
        button.backgroundColor = .clearColor()
        button.alpha = 1
        button.hidden = true
        button.setTitle("", forState: .Normal)
        button.addTarget(self, action: #selector(bA5), forControlEvents: .TouchUpInside)
        actPagMInfoB.append(button)
        self.PageScrollView2.addSubview(button)
        button = UIButton(frame: CGRect(x: 615, y: 150, width: 78, height: 19))
        button.backgroundColor = .clearColor()
        button.alpha = 1
        button.hidden = true
        button.setTitle("", forState: .Normal)
        button.addTarget(self, action: #selector(bA1), forControlEvents: .TouchUpInside)
        actPagMInfoB2.append(button)
        self.PageScrollView3.addSubview(button)
        button = UIButton(frame: CGRect(x: 615, y: 980, width: 78, height: 19))
        button.backgroundColor = .clearColor()
        button.alpha = 1
        button.hidden = true
        button.setTitle("", forState: .Normal)
        button.addTarget(self, action: #selector(bA4), forControlEvents: .TouchUpInside)
        actPagMInfoB2.append(button)
        self.PageScrollView3.addSubview(button)
        button = UIButton(frame: CGRect(x: 615, y: 1587, width: 78, height: 19))
        button.backgroundColor = .clearColor()
        button.alpha = 1
        button.hidden = true
        button.setTitle("", forState: .Normal)
        button.addTarget(self, action: #selector(bA2), forControlEvents: .TouchUpInside)
        actPagMInfoB2.append(button)
        self.PageScrollView3.addSubview(button)
        button = UIButton(frame: CGRect(x: 615, y: 2109, width: 78, height: 19))
        button.backgroundColor = .clearColor()
        button.alpha = 1
        button.hidden = true
        button.setTitle("", forState: .Normal)
        button.addTarget(self, action: #selector(bA3), forControlEvents: .TouchUpInside)
        actPagMInfoB2.append(button)
        self.PageScrollView3.addSubview(button)
        button = UIButton(frame: CGRect(x: 615, y: 2688, width: 78, height: 19))
        button.backgroundColor = .clearColor()
        button.alpha = 1
        button.hidden = true
        button.setTitle("", forState: .Normal)
        button.addTarget(self, action: #selector(bA5), forControlEvents: .TouchUpInside)
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
        self.actpageTableView2.frame = CGRectMake(200, 7750, 500, 2000)
        
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
        self.actpageTableView1.frame = CGRectMake(200, 7750, 500, 2000)
        
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
        self.actpageTableView22.frame = CGRectMake(185, 9550, 510, 2000)
        
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
        self.actpageTableView12.frame = CGRectMake(200, 9550, 500, 2000)
        
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
        campTV.frame = CGRectMake(185, 9500, 300, 50)
        campTV.alpha = 0
        campTV.backgroundColor = UIColor.clearColor()
        campTV2.frame = CGRectMake(185, 9500, 300, 50)
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
        print("Number of Activities strings")
        print("Number of Activities attributes")
        print(self.Activitiestextstrings.count)
        print(self.ActivitiesAttributes.count)
        self.PageScrollView.contentSize.height = 1900
        /*
        var imageArr : [UIImage] = []
        for i in 0...58{
            let str : String = "TAP_HERE_V01_LOOP_"+String(format: "%05d", i)+".png"
            //print(str)
            imageArr.append(UIImage(named:str)!)
        }
        */
        print("Loaded Anacapa animation")
        /*
         ClickHere.animationImages = [
         UIImage(named:"TAP_HERE_V01_LOOP_00000.png")!
         ]
         */
        //Clickhere.animationImages = imageArr
        //Clickhere.animationDuration = 2.0
        //Clickhere.startAnimating()
    
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //self.dataLabel!.text = dataObject
        /*
        var imageArr : [UIImage] = []
        for i in 0...58{
            let str : String = "TAP_HERE_V01_LOOP_"+String(format: "%05d", i)+".png"
            //print(str)
            imageArr.append(UIImage(named:str)!)
        }
         */
        print("Loaded Anacapa animation")
        /*
         ClickHere.animationImages = [
         UIImage(named:"TAP_HERE_V01_LOOP_00000.png")!
         ]
         */
        //Clickhere.animationImages = imageArr
        //Clickhere.animationDuration = 2.0
        //Clickhere.startAnimating()
    
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
    
    @IBAction func MapClicked(sender: AnyObject) {
        enableMap()
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

extension AnacapaViewController: UIViewControllerTransitioningDelegate {
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        //horizontalTransitionController.originFrame = CardView.frame
        //horizontalTransitionController.swipeDirection = self.swipeState
        return horizontalTransitionController
    }
}