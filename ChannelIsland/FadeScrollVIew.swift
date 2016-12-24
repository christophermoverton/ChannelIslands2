//
//  FadeScrollVIew.swift
//  ChannelIsland
//
//  Created by Christopher Overton on 12/14/16.
//  Copyright © 2016 Christopher Overton. All rights reserved.
//

import UIKit

class FadeScrollVIew: UIScrollView {
    let fadePercentage = CGFloat(0.2)
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        var transparent = UIColor.clearColor().CGColor
        var opaque = UIColor.blackColor().CGColor
        
        var maskLayer = CALayer()
        maskLayer.frame = self.bounds
        
        var gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRectMake(self.bounds.origin.x, 0, self.bounds.size.width, self.bounds.size.height)
        gradientLayer.colors = [transparent, opaque, opaque, transparent]
        gradientLayer.locations = [0, 0, 1 - fadePercentage, 1]
        
        maskLayer.addSublayer(gradientLayer)
        self.layer.mask = maskLayer
        
    }



}
