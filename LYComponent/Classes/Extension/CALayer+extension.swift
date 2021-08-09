//
//  CALayer+extension.swift
//  LYComponent
//
//  Created by luoyue on 2021/8/8.
//  Copyright © 2021 luoyue. All rights reserved.
//

import UIKit

extension CALayer {

    public func setShadow(color: UIColor? = UIColor.black,
                           alpha: CGFloat = 0.5,
                           x: CGFloat = 0, y: CGFloat = 2,
                           blur: CGFloat = 4,
                           spread: CGFloat = 0) {
            shadowOffset = CGSize(width: x, height: y)
            shadowRadius = blur * 0.5
            shadowColor = color?.cgColor
            shadowOpacity = Float(alpha)

            let rect = bounds.insetBy(dx: -spread, dy: -spread)
            let path = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
            shadowPath = path.cgPath
        }
}
