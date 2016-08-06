//
//  ViewController.swift
//  ChannelIsland
//
//  Created by Christopher Overton on 8/2/16.
//  Copyright © 2016 Christopher Overton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Properties
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var ImageView2: UIImageView!

    @IBOutlet weak var ClickHere: UIImageView!
    @IBOutlet weak var entryButton: UIButton!
    
    var imageArray: [UIImage] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        var imageArr : [UIImage] = []
        for i in 0...58{
            let str : String = "TAP_HERE_V01_LOOP_"+String(format: "%05d", i)+".png"
            print(str)
            imageArr.append(UIImage(named:str)!)
        }
        /*
         ClickHere.animationImages = [
         UIImage(named:"TAP_HERE_V01_LOOP_00000.png")!
         ]
         */
        ClickHere.animationImages = imageArr
        ClickHere.animationDuration = 2.0
        ClickHere.startAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewDidAppear(animated: Bool) {
        
        var ini = true;
        var ini2 = false;
        var ini3 = false;
        var ini4 = true;
        //while !ini4{
        
            UIView.animateWithDuration(2.0, delay: 4.0, options: .CurveEaseOut, animations: {
                self.imageView1.alpha = 0;
                self.ImageView2.alpha = 1;},
                completion: { finished in
                    if ( finished ) {
                        UIView.animateWithDuration(0.0, delay: 0.0, options: .CurveEaseOut, animations: {
                            self.imageView1.image = UIImage(named:"Image-3");
                            }, completion: { finished in
                                if (finished){
                                    UIView.animateWithDuration(2.0, delay: 4.0, options: .CurveEaseOut, animations: {
                                        self.imageView1.alpha = 1;
                                        self.ImageView2.alpha = 0;
                                        }, completion: { finished in
                                            if (finished){
                                                UIView.animateWithDuration(0.0, delay: 0.0, options: .CurveEaseOut, animations: {
                                                    self.ImageView2.image = UIImage(named:"Image-4");
                                                    }, completion: { finished in
                                                        if (finished){
                                                            UIView.animateWithDuration(2.0, delay: 4.0, options: .CurveEaseOut, animations: {
                                                                self.ImageView2.alpha = 1;
                                                                self.imageView1.alpha = 0;
                                                                }, completion: { (value: Bool) in ini4 = true
                                                            })
                                                        }
                                                })
                                            }
                                    })
                                }
                        })
                    }
                })
            
        
        /*
        UIView.animateWithDuration(2.0, delay: 4.0, options: .CurveEaseOut, animations: {
            self.ImageView2.alpha = 1;
            }, completion: { finished in
                print("Finished!")
        })*/
        /*
        if ini2{
            UIView.animateWithDuration(0.0, delay: 12.0, options: .CurveEaseOut, animations: {
                self.imageView1.image = UIImage(named:"Image-3");
                }, completion: { finished in
                    print("Finished2!")
            })
       
            UIView.animateWithDuration(2.0, delay: 12.0, options: .CurveEaseOut, animations: {
                self.imageView1.alpha = 1;
                self.ImageView2.alpha = 0;
                }, completion: { (value: Bool) in ini3 = true
            })
            ini2 = false;
        }*/
        /*
        UIView.animateWithDuration(2.0, delay: 8.0, options: .CurveEaseOut, animations: {
            self.ImageView2.alpha = 0;
            }, completion: { finished in
                print("Finished4!")
        })
        */
        /*
        if ini3{
            UIView.animateWithDuration(0.0, delay: 16.0, options: .CurveEaseOut, animations: {
                self.ImageView2.image = UIImage(named:"Image-4");
                }, completion: { finished in
                    print("Finished5!")
            })
            UIView.animateWithDuration(2.0, delay: 16.0, options: .CurveEaseOut, animations: {
                self.ImageView2.alpha = 1;
                self.imageView1.alpha = 0;
                }, completion: { (value: Bool) in ini4 = true
            })
            ini3 = false;
        }*/
        
        /*
        UIView.animateWithDuration(2.0, delay: 12.0, options: .CurveEaseOut, animations: {
            self.imageView1.alpha = 0;
            }, completion: { finished in
                print("Finished!")
        })
        */
        
        UIView.animateWithDuration(2.0, delay: 19.0, options: .CurveEaseOut, animations: {
            self.ClickHere.alpha = 1;
            }, completion: { finished in
                print("Finished7!")
        })
        
        
    
        /*
         
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    }

}
