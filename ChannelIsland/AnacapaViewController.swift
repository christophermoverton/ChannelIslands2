//
//  AnacapaViewController.swift
//  ChannelIsland
//
//  Created by Christopher Overton on 8/30/16.
//  Copyright © 2016 Christopher Overton. All rights reserved.
//


import UIKit



class AnacapaViewController: UIViewController, UITextViewDelegate, UITableViewDelegate {
    
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
    private var MapView: UIView!
    private var pageIVs2: [[UIImageView!]] = [[UIImageView!]]() // side photos
    private var capPagTVs2: [[UITextView!]] = [[UITextView!]]()
    private var pageIVs3: [[UIImageView!]] = [[UIImageView!]]()  //side photos 2nd page
    private var capPagTVs3: [[UITextView!]] = [[UITextView!]]()
    private var actPagHeaders: [UITextView!] = [UITextView!]()  //beyond main text view
    private var actPagHeaders2: [UITextView!] = [UITextView!]()//
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
    private var actHikes: [Hike] = [Hike(destination: "Destination",distance: "Distance",difficulty: "Difficulty",briefdescription: "Brief Description"),Hike(destination: "Historic Ranch",distance: ".5",difficulty: "Easy",briefdescription: "View the historic Scorpion Ranch complex."),Hike(destination: "Cavern Point",distance: "2",difficulty: "Moderate",briefdescription: "Magnificent coastal vistas and whale viewing."),Hike(destination: "Potato Harbor",distance: "4",difficulty: "Moderate",briefdescription: "Spectacular coastal views. No beach access."),Hike(destination: "Scorpion Canyon",distance: "4 (loop)",difficulty: "Moderate to strenuous",briefdescription: "A scenic loop hike that includes steep canyon walls and a chance to see the unique island scrub-jay."), Hike(destination: "Smugglers Cove",distance: "7",difficulty: "Strenuous",briefdescription: "An all-day hike with beach access at Smugglers Cove."),Hike(destination: "Montañon Ridge",distance: "8",difficulty: "Strenuous",briefdescription: "For experienced, off-trail hikers. Great views."),Hike(destination: "Prisoners Harbor",distance: "28",difficulty: "Strenuous",briefdescription: "Arrange a boat pickup for a one-way trip or camp at Del Norte backcountry camp."),Hike(destination: "From Smugglers Cove:",distance: "",difficulty: "",briefdescription: ""),Hike(destination: "Smugglers Canyon",distance: "   2",difficulty: "Moderate to strenuous",briefdescription: "Opportunities to view native island vegetation.  Be prepared for uneven terrain and loose rock."),Hike(destination: "Yellowbanks",distance: "3",difficulty: "Moderate",briefdescription: "Off-trail hike to an overlook. No beach access."),Hike(destination: "San Pedro Point",distance: "4",difficulty: "Moderate",briefdescription: "For experienced, off-trail hikers."),Hike(destination: "From Prisoners Harbor:",distance: "",difficulty: "",briefdescription: ""),Hike(destination: "Prisoners Harbor",distance: ".25 -.5",difficulty: "Easy",briefdescription: "View the historic Prisoners Harbor area and search for the island scrub-jay."),Hike(destination: "Del Norte Camp",distance: "7",difficulty: "Strenuous",briefdescription: "Follow the rugged Del Norte trail east to the backcountry camp."),Hike(destination: "Navy Road- Del Norte Loop",distance: "     8.5",difficulty: "Strenuous",briefdescription: "Route includes the Navy Road and the Del Norte Trail. Good views."),Hike(destination: "Chinese Harbor",distance: "15.5",difficulty: "Strenuous",briefdescription: "A long hike that ends at the only beach accessible by land on the isthmus."),Hike(destination: "China Pines",distance: "18",difficulty: "Strenuous",briefdescription: "Explore the Santa Cruz Island pine grove."),Hike(destination: "Montañon Ridge",distance: "21",difficulty: "Strenuous",briefdescription: "For experienced, off-trail hikers. Must be able to read topographic maps."),Hike(destination: "Scorpion Anchorage",distance: "       28",difficulty: "Strenuous",briefdescription: "Arrange a boat pickup for a one-way trip or camp at Del Norte backcountry camp."),Hike(destination: "Pelican Bay",distance: "4",difficulty: "Moderate to strenuous",briefdescription: "This trail may only be traveled by those who have obtained a permit in advance from The Nature Conservancy or are accompanied by Island Packers (a boat concessioner) staff.")]
    
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
    
    private var Activitiestextstrings: [String] = ["ACTIVITIES\n\n","Boating and Kayaking\n\n","Boating Safety\n","\t•Don’t be tempted to cross through the gap between East and Middle Anacapa. It’s too shallow and has too much surge to cross, even for kayaks. Please don’t try it!\n\t• Please be aware no personal watercraft (i.e. Waverunner tm) are allowed within the National Park.\n\n","Kayaking\n\n","East Anacapa\n\n","\t• Not far from Landing Cove, the small sea cave called Frenchy’s Secret is a popular destination for kayakers.\n\t• Many kayakers paddle out to the easternmost point of Anacapa to visit the iconic Arch Rock. This open-water area is recommended for expert kayakers only.\n\n","Middle Anacapa\n\n,","\t Kayakers exploring beautiful Cathedral Cove on Middle Anacapa have a chance to paddle next to stunning spires such as the iconic Witch’s Hat and several sea caves.\n\n","Diving, Snorkeling, and Swimming\n\n","Marine Protected Areas\n\n","\t• When diving in all marine protected areas, please remember: \"Leave only bubbles, take only memories.\"\n\n","East Anacapa\n\n","\t• Some of East Anacapa’s best diving may be found at Landing Cove and Cathedral Cove. Both areas are within the marine protected area and offer divers the chance to see lots of fish on any given day.\n\n","West Anacapa\n\n","\t• Goldfish Bowl and Cat Rock on West Anacapa offer good diving as conditions permit.\n\n","Wildlife Watching\n\n","\t• With miles of both marine protected and conservation areas, Anacapa offers refuge to diverse marine life: rookeries for the endangered California Brown Pelican dot the rocks; California sea lions and harbor seals rest and breed along the shores; and Scripps’s Murrelets wheel in the sky.\n\n\t• Kayakers will likely see sea lions, seal pups, pelicans, and cormorants; bright orange Garibaldi flitting through the water, and blowholes spewing in the rocks.\n\n\t•  Please maintain a distance of 100 meters offshore so as not to disturb nesting and pupping sites.\n\n","Fishing\n\n","\t• Over 80 percent of the waters near the Channel Islands is open to fishing.\n\n\t• Anacapa’s south side is open to fishing. The north side is within a protected Marine Reserve.\n\n\t• Sport fishing outside marine protected areas requires possession of a valid State of California fishing license with an ocean enhancement stamp.\n\n\t• All California Department of Fish and Game regulations apply.\n\n\t• Rockfish, White Sea Bass, Halibut, Barracuda, Calico Bass, and Yellowtail are all caught in these rich waters.\n\n","Hiking\n\n","\t• East Anacapa’s hiking trails are short (around 2 miles) but utterly spectacular.\n\n\t•  Please note that disembarking and ascending 157 steps to the plateau can be moderately strenuous.\n\n\t•  Rangers and naturalists offer guided tours year-round at Middle Anacapa.\n\n\t• Note that West Anacapa is a Natural Research area and is closed on the eastern tip, with the exception of Frenchy’s Cove. Frenchy’s is a popular anchorage for boaters and offers fabulous tide-pooling.\n\n","Camping\n\n","\t• The campground on Anacapa is on an open plateau with ocean views. It is a half-mile trek from the landing and has 7 campsites.\n\n\t• Year-round camping is available; overnight fees apply. Reserve your site well in advance at recreation.gov or call 877-444-6777. Concession boats fill to capacity more quickly than campground sites are filled, so book your boat transportation for overnight trips first. There is no water or shade, so pack what you need.\n\n\t• The park provides picnic tables, lock boxes for food, and pit toilets.\n\n\t• Remember that you’ll be hauling everything else from the pier to your site, so bring essentials only.\n\n\t• The campsite can be noisy: expect to have nesting gulls nearby.\n\n","Activities (More Info Level)\n\n","Boating and Kayaking (more info)\n\n","Weather\n","\t• Visitors can boat to the islands on their own or with the park’s approved ferry operators. Strong currents, shifting swells, dense fog, strong winds and choppy seas can appear suddenly. Come prepared.\n\n","Anchorages\n\n","\t• Anacapa’s main anchorages are at Landing Cove and Frenchy’s Cove. On the south side, East Fish Camp or Cat Rock provide shelter and additional anchorage sites, although they are exposed to southerly swells.\n\n\t• Wherever you anchor, there are no all-weather anchorages around the islands.  Therefore, it is recommended that a person stay on board at all times.\n\n","Forecasts\n","\t• Monitor VHFG Weather Channel 3 (WX3), VHF-FM 162.475 mhz for marine forecasts. On the web, channelislands.noaa.gov or nwsla.noaa.gov have current weather. There are electronic weather kiosks in Santa Barbara and Channel Islands harbors.\n\n","Wildlife Watching (more info)\n\n","What to Look For\n,","\t• January/February: enjoy great tidepooling in the afternoons. See gray whales heading to Baja California.\n\n\t• March/April: Island flowers are in full bloom through April. The giant coreopsis are in full bloom. Gray whales are visible through May. Brant geese are on the same schedule. Western Gulls begin nesting. Scripps’s Murrelets are nesting through July. Grunions leave the water to spawn on the beach, now through May.\n\n\t• May/June: Dense fog is common. Blue and humpback whales arrive to feed on krill. Red-Necked Phalaropes can be seen in the Santa Barbara Channel.  Grunion beach spawning continues after high tides and continues for several hours. Endangered Least Terns, Pink-footed Shearwaters and Ashy Storm Petrels can be seen in the channel at these times. California sea lion breeding and pupping runs from May through July. Scripps’s Murrelets nest March thru July. Grunion spawning peaks around this time.\n\n\t• July/August: Fog diminishes and underwater visibility increases. More of the same as blue and humpback whales feed on krill. Sooty and Pink-footed Shearwaters visit the channel. Red-necked Phalaropes and Ashy and Black Storm petrels do the same. Endangered Least Terns and Scripps’s Murrelets can be seen on the islands.\n\n\t• September/October: Warm weather, calm winds and seas are common.  Jellies are abundant in the coastal waters. Fin whales, Sei whales and blue whales can be observed feeding. Sooty and Pink-footed Shearwaters visit the channel. Red-necked Phalaropes, and Ashy and Black Storm Petrels do the same. Endangered Least Terns and Scripps’s Murrelets can be seen on the islands.\n\n\t• November/December: Winter storms appear. Best tidepooling months are now, as afternoon low tides expose invertebrates. Jellies are in abundance.\n\n","Fishing (more info)\n\n","\t• Check out daily marine forecasts: http://www.usps.org/ventura/currentconditions.html\n\n\t•  California Ocean Sport fishing regulations: http://www.dfg.ca.gov/marine/oceansportregs.asp\n\n\t","Diving, Snorkeling, and Swimming (more info)\n\n","Diving\n","• Even in August the water is rather cold, so a wet suit is recommended for snorkeling and swimming.\n\n\t• Anacapa’s trails don’t provide shore access, as the island is ringed by steep cliffs.\n\n\t• Cathedral Cove and Frenchy’s Cove are accessible only by boat or kayak.\n\n\t","Hiking (more info)\n","\t• After climbing the steep stairs at Landing Cove, the trails are a figure-8 shaped system that meanders over gentle slopes to dramatic overlooks and coastal views.\n\t• The trails are all easy and range from .5 and 1.5 miles, round trip.\n\t• Please walk only on established trails. This protects the fragile bird nests on the ground.\n\t•  An interpretive trail guide is available at the visitor center.\n\n\t"]
    
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
        self.AnacapaView.insertSubview(self.PageScrollView2,atIndex: 7)
        self.PageScrollView2.contentSize.height = 8000
        self.PageTextView3 = UITextView()
        self.PageTextView3.backgroundColor = UIColor.clearColor()
        self.PageTextView3.frame = CGRectMake(185, 75, 510.0, 3500.0)
        self.PageTextView3.alpha = 1
        self.PageScrollView3 = FadeScrollVIew()
        self.PageScrollView3.frame = CGRectMake(0, 120, 1024, 565)
        self.PageScrollView3.alpha = 0
        self.PageScrollView3.addSubview(self.PageTextView3 )
        self.AnacapaView.insertSubview(self.PageScrollView3,atIndex: 7)
        self.PageScrollView3.contentSize.height = 8000
        //let inames: [[String]] = [self.photonames, self.infophotonames, self.activitiesphotonames]
        //let tnames: [[String]] = [self.AnchoragesCaptiontextstrings,self.InfoCaptiontextstrings,self.ActivitiesCaptiontextstrings]
        var j = 0
        /*
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
                y = y + 60.0 + Double(newheight)
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
                y = y + 60.0 + Double(newheight)
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
                textView.frame = CGRectMake(xcg, ycg+newheight-10.0, 300.0, 60.0)
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
        */
        //add map image view
        let ui = UIImage(imageLiteral: "Santa_Cruz_Island_MAP")
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
        self.AnacapaView.insertSubview(self.MapView, atIndex: 9)
        
        
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
        self.actpageTableView2.frame = CGRectMake(185, 2400, 510, 3000)
        
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
        self.actpageTableView1.frame = CGRectMake(185, 2400, 510, 3000)
        
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
        self.actpageTableView22.frame = CGRectMake(185, 4450, 510, 2000)
        
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
        self.actpageTableView12.frame = CGRectMake(185, 4450, 510, 2000)
        
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
        campTV.frame = CGRectMake(185, 4400, 300, 50)
        campTV.alpha = 0
        campTV.backgroundColor = UIColor.clearColor()
        campTV2.frame = CGRectMake(185, 4400, 300, 50)
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
        self.PageScrollView.contentSize.height = 1900
        var imageArr : [UIImage] = []
        for i in 0...58{
            let str : String = "TAP_HERE_V01_LOOP_"+String(format: "%05d", i)+".png"
            //print(str)
            imageArr.append(UIImage(named:str)!)
        }
        print("Loaded Anacapa animation")
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
        print("Loaded Anacapa animation")
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

extension AnacapaViewController: UIViewControllerTransitioningDelegate {
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        //horizontalTransitionController.originFrame = CardView.frame
        //horizontalTransitionController.swipeDirection = self.swipeState
        return horizontalTransitionController
    }
}