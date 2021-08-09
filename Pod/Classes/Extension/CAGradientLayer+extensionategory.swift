//
//  CAGradientLayer+extensionategory.swift
//  LYComponent
//
//  Created by luoyue on 2021/8/8.
//  Copyright © 2021 luoyue. All rights reserved.
//

import UIKit
extension CAGradientLayer{
    
    public func setGradient(_ colors: [CGColor]?,
                     _ startPoint: CGPoint,
                     _ endPoint: CGPoint,
                     _ locations:[NSNumber]?, _ cornerRadius: CGFloat = 0){
        self.colors = colors
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.locations = locations
        self.cornerRadius = cornerRadius
    }
    
    
}
