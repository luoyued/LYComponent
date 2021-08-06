//
//  NBGradientLayerCategory.swift
//  
//
//  Created by luoyue on 2020/3/5.
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
