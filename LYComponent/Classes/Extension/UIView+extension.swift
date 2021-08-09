//
//  UIView+extension.swift
//  LYComponent
//
//  Created by luoyue on 2021/8/8.
//  Copyright © 2021 luoyue. All rights reserved.
//

import UIKit

extension UIView{
    
    /// viewName
    /// - Returns: description
    public class func viewName() -> String {
        return NSStringFromClass(self.classForCoder())
    }
    
    /// viewIdentifier  eg: use regist cell
    /// - Parameter viewType: viewType description
    /// - Returns: description
    public class func viewIdentifier<T :UIView>(_ viewType: T.Type) -> String {
        
        let identifier = viewType.viewName()
        var namespace = Bundle.main.namespace
        namespace = namespace + "."
        return identifier.replacingOccurrences(of: namespace, with: "")
    }
    
    /// 获取view的父控制器
    /// - Returns: description
    public func currentViewController() -> UIViewController? {
        //1.通过响应者链关系，取得此视图的下一个响应者
        var n = next
        while n != nil {
            //2.判断响应者对象是否是视图控制器类型
            if n is UIViewController {
               //3.转换类型后 返回
               return n as? UIViewController
            }
            n = n?.next
        }
        return nil
    }
}

// MARK:- UIView.frame
extension UIView {
    public var x:CGFloat{
        get{
            return self.frame.origin.x
        }
        set{
            var frame = self.frame
            frame.origin.x = newValue;
            self.frame = frame
        }
    }
    
    public var y:CGFloat{
        get{
            return self.frame.origin.x
        }
        set{
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    public var left:CGFloat{
        get{
            return self.frame.origin.x
        }
        set{
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    public var right:CGFloat{
        get{
            return self.frame.origin.x + self.frame.size.width
        }
        set{
            var frame = self.frame
            frame.origin.x = newValue - self.frame.size.width
            self.frame = frame
        }
    }
    
    public var centerX:CGFloat{
        get{
            return self.center.x
        }
        set{
            var center = self.center
            center.x = newValue
            self.center = center
        }
    }
    
    public var centerY:CGFloat{
        get{
            return self.center.y
        }
        set{
            var center = self.center
            center.y = newValue
            self.center = center
        }
    }
    
    public var origin:CGPoint{
        get{
            return self.frame.origin
        }
        set{
            var frame = self.frame
            frame.origin = newValue
            self.frame = frame
        }
    }
    
    public var size:CGSize{
        get{
            return self.frame.size
        }
        set{
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }
    
    public var width:CGFloat{
        get{
            return self.frame.width
        }
        set{
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    public var height:CGFloat{
        get{
            return self.frame.size.height
        }
        set{
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    public var top:CGFloat{
        get{
            return self.frame.origin.y
        }
        set{
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    public var bottom:CGFloat{
        get{
            return self.frame.origin.y + self.frame.size.height
        }
        set{
            var frame = self.frame
            frame.origin.y = newValue - self.frame.size.height
            self.frame = frame
        }
    }
}

// MARK: - methon
extension UIView{
    
    public func viewTransformToUIImage() -> UIImage {
        
        let size = self.bounds.size
        ///第一个参数表示区域大小。
        ///第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传false，否则传true。
        ///第三个参数就是屏幕密度了
        UIGraphicsBeginImageContextWithOptions(size,false,UIScreen.main.scale)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    
    /// search Specified SubView
    /// - Parameter subView:
    /// - Returns:
    public class func searchSpecifiedSubView<T:UIView>(subView:T,subviews:[UIView]?) -> T? {
        
        guard let subviewsArray = subviews else { return nil }
        for view in subviewsArray {
            
            if view is T {
                return view as? T
            }
        }
        return nil
    }
    
    /// 设置不规则圆角
    /// - Parameters:
    ///   - corners: corners description
    ///   - cornerRadii: cornerRadii description
    public func setRoundingCorners(_ corners: UIRectCorner, cornerRadii: CGSize) {
        
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: cornerRadii)
        let mask = CAShapeLayer()
        mask.frame = self.bounds
        mask.path  = path.cgPath
        layer.mask = mask
    }
}

