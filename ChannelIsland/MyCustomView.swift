//
//  MyCustomView.swift
//  ChannelIsland
//
//  Created by Christopher Overton on 8/31/16.
//  Copyright © 2016 Christopher Overton. All rights reserved.
//

import UIKit

class MyCustomView: UIView {
    //var label: UILabel = UILabel()
    //var myNames = ["dipen","laxu","anis","aakash","santosh","raaa","ggdds","house"]
    internal var imageName: String = ""
    internal var imageView: UIImageView!
     var imageArray: [UIImage] = []
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addCustomView()
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addCustomView() {
        /*
        label.frame = CGRectMake(50, 10, 200, 100)
        label.backgroundColor=nil
        label.textAlignment = NSTextAlignment.Center
        label.text = "test label"
        label.hidden=true
        self.addSubview(label)
        */
        /*
        var btn: UIButton = UIButton()
        btn.frame=CGRectMake(50, 120, 200, 100)
        btn.backgroundColor=UIColor.redColor()
        btn.setTitle("button", forState: UIControlState.Normal)
        btn.addTarget(self, action: "changeLabel", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(btn)
        
        var txtField : UITextField = UITextField()
        txtField.frame = CGRectMake(50, 250, 100,50)
        txtField.backgroundColor = UIColor.grayColor()
        self.addSubview(txtField)
        */
        self.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.0)
    }
    
    func addImageV(imageName: String){
        let image = UIImage(named: imageName)
        imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 0, width: 1024, height: 768)
        imageView.contentMode = UIViewContentMode.ScaleAspectFit;
        self.addSubview(imageView)
    }
    func addImageAnimV(imageName: String){
        //let image = UIImage(named: imageName)
        var imageArr : [UIImage] = []
        for i in 0...58{
            let str : String = imageName+String(format: "%05d", i)+".png"
            //print(str)
            imageArr.append(UIImage(named:str)!)
        }
        /*
         ClickHere.animationImages = [
         UIImage(named:"TAP_HERE_V01_LOOP_00000.png")!
         ]
         */
        //Clickhere.animationImages = imageArr
        //Clickhere.animationDuration = 2.0
        //Clickhere.startAnimating()
        imageView = UIImageView()
        imageView.frame = CGRect(x: 450, y: 321, width: 125, height: 125)
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        imageView.animationImages = imageArr
        imageView.animationDuration = 2.0
        imageView.startAnimating()
        self.addSubview(imageView)
    }
    func addTitleV(aframe: CGRect, title: String){
        var bframe: CGRect = aframe
        bframe.origin.x = bframe.origin.x+5
        bframe.origin.y = bframe.origin.y-1
        let myField: UITextField = UITextField (frame: bframe);
        myField.font = UIFont(name:"TrajanPro-Regular", size: 25)
        myField.textAlignment = NSTextAlignment.Left
        myField.text = title
        myField.textColor = UIColor.whiteColor()
        myField.contentMode = UIViewContentMode.ScaleAspectFit;
        self.addSubview(myField)
    }
    
    func addTitleV(aframe: CGRect, textfield: UITextField){
        var bframe: CGRect = aframe
        bframe = textfield.frame
        //bframe.origin.= textfield.frame.origin//bframe.origin.x+3
        //bframe.origin.y = bframe.origin.y-3
        let myField: UITextField = UITextField (frame: bframe)
        myField.font = textfield.font
        //myField.font = UIFont(name:"TrajanPro-Regular", size: 25)
        //myField.textAlignment = NSTextAlignment.Left
        myField.textAlignment = textfield.textAlignment
        myField.text = textfield.text
        myField.textColor = textfield.textColor
        myField.contentMode = UIViewContentMode.ScaleAspectFit;
        self.addSubview(myField)
    }
    
    func addTitleV(textfield: UITextField){
        let bframe: CGRect = textfield.frame
        //bframe.origin.= textfield.frame.origin//bframe.origin.x+3
        //bframe.origin.y = bframe.origin.y-3
        let myField: UITextField = UITextField (frame: bframe)
        myField.font = textfield.font
        //myField.font = UIFont(name:"TrajanPro-Regular", size: 25)
        //myField.textAlignment = NSTextAlignment.Left
        myField.textAlignment = textfield.textAlignment
        myField.text = textfield.text
        myField.textColor = textfield.textColor
        myField.contentMode = UIViewContentMode.ScaleAspectFit;
        self.addSubview(myField)
    }

    func addPageControl(pageControl: UIPageControl){
        let pc3 = UIPageControl(frame: pageControl.frame)
        pc3.numberOfPages = pageControl.numberOfPages
        pc3.currentPage = pageControl.currentPage
        self.addSubview(pc3)
    }

}