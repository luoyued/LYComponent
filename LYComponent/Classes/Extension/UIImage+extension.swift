//
//  UIImageExtension.swift
//
//  Created by luoyue on 2019/4/30.
//  Copyright © 2019 luoyue. All rights reserved.
//

import UIKit
import Foundation

extension UIImage{
    
    public enum GradientType {
        case topToBottom
        case leftToRight
        case leftTopToRightBottom
        case leftBottomToRightTop
    }
    
    
    /**通过颜色 和尺寸生成一张纯色图片*/
   public class func creatImage(_ size:CGSize = CGSize(width: 1, height: 1),_ color:UIColor) -> UIImage!{
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(CGRect(origin: .zero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    public class func creatImage(_ color:UIColor) -> UIImage!{
        let size = CGSize(width: 1, height: 1)
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(CGRect(origin: .zero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    
    public class func createGradientImage(_ size:CGSize,_ gradientColors:[UIColor],_ percentage:[CGFloat],_ gradientType:GradientType) -> UIImage!{
        
        var colorArray:[CGColor] = Array()
        for color in gradientColors {
            colorArray.append(color.cgColor)
        }
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        context?.saveGState()
        let colorSpace = colorArray.last!.colorSpace
        let gradient = CGGradient(colorsSpace: colorSpace, colors: colorArray as CFArray, locations: percentage)
        
        var start:CGPoint!
        var end:CGPoint!
        
        switch gradientType {
        case .topToBottom:
            start = CGPoint(x: size.width/2, y: 0)
            end = CGPoint(x: size.width/2, y: size.height)
        case .leftToRight:
            start = CGPoint(x: 0, y: size.height/2)
            end = CGPoint(x: size.width, y: size.height/2)
        case .leftTopToRightBottom:
            start = CGPoint(x: 0, y: 0)
            end = CGPoint(x: size.width, y: size.height)
        case .leftBottomToRightTop:
            start = CGPoint(x: 0, y: size.height)
            end = CGPoint(x: size.width, y: 0)
        }
        context?.drawLinearGradient(gradient!, start: start, end: end, options: [.drawsBeforeStartLocation,.drawsAfterEndLocation])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        
        return image!
    }
    
    
    /**
        压缩图片尺寸和体积
        maxImageLength  图片尺寸
        maxSizeKB    图片体积 kb
     */
    
    public class func resetImgSize(_ image:UIImage,maxImageLength: CGFloat, maxSizeKB:CGFloat) -> Data?{
        var maxSize = maxSizeKB
        var maxImageSize = maxImageLength
        if (maxSize <= 0.0) {
            maxSize = 1024.0;
        }
        if (maxImageSize <= 0.0)  {
            maxImageSize = 1024.0;
        }
        //先调整分辨率
        var newSize = CGSize(width: image.size.width, height: image.size.height)
        if max(image.size.width, image.size.height) > maxImageSize{
            if image.size.width > image.size.height{
                newSize = CGSize(width: maxImageSize, height: maxImageSize * image.size.height / image.size.width)
            }
            if image.size.height > image.size.width{
                newSize = CGSize(width: maxImageSize * image.size.width / image.size.height, height: maxImageSize)
            }
            
        }
        UIGraphicsBeginImageContext(newSize)
        image.draw(in: CGRect.init(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext() 
        
        var imageData = newImage?.jpegData(compressionQuality: 1)
        var sizeOriginKB : CGFloat = CGFloat((imageData?.count)!) / 1024.0;
        //调整大小
        var resizeRate = 0.9;
        while (sizeOriginKB > maxSize && resizeRate > 0.1) {
            imageData = newImage?.jpegData(compressionQuality: CGFloat(resizeRate))
            sizeOriginKB = CGFloat((imageData?.count)!) / 1024.0;
            resizeRate -= 0.1;
        }

        return imageData
    }
    
}
