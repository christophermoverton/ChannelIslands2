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

}