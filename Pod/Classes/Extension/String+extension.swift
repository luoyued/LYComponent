//
//  String+extension.swift
//  LYComponent
//
//  Created by luoyue on 2021/8/8.
//  Copyright © 2021 luoyue. All rights reserved.
//

import UIKit
import Foundation
import CommonCrypto

extension String {
    
    /// 获取文本高度
    ///
    /// - Parameters:
    /// - maxWidth: 最大宽度
    /// - font: 字体
    public func textHeight(maxWidth:CGFloat, font:UIFont) -> CGFloat {
        print(self,NSString(string:self).boundingRect(with: CGSize(width: maxWidth, height: CGFloat(MAXFLOAT)), options: [.usesLineFragmentOrigin,.usesFontLeading], attributes: [NSAttributedString.Key.font : font], context: nil).height)
        
        return CGFloat(ceil(Double(NSString(string:self).boundingRect(with: CGSize(width: maxWidth, height: CGFloat(MAXFLOAT)), options: [.usesLineFragmentOrigin,.usesFontLeading], attributes: [NSAttributedString.Key.font : font], context: nil).height)))
    }
    
    /// 获取文本宽度
    ///
    /// - Parameters:
    /// - maxHeight: 最大高度
    /// - font: 字体
    public func textWidth(maxHeight:CGFloat, font:UIFont) -> CGFloat {
        return CGFloat(ceil(Double(NSString(string:self).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: maxHeight), options: [.usesLineFragmentOrigin,.usesFontLeading], attributes: [NSAttributedString.Key.font : font], context: nil).width)))
        
    }

    /// 检查密码设置是否满足要求
    /// - Parameter password: 密码
    public func passwordRegular() -> Bool{
        /// 密码规则
        let regular = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,15}$"
        var result = ""
        /// 创建正则表达式对象
        let regex1 = try! NSRegularExpression(pattern: regular, options: NSRegularExpression.Options.caseInsensitive)
        /// 开始匹配
        let res = regex1.matches(in: self, options: NSRegularExpression.MatchingOptions.init(rawValue: 0), range: NSMakeRange(0, self.count))
        /// 输出结果
        for checkingRes in res {
            result = result + (self as NSString).substring(with: checkingRes.range)
        }
        if result == self{
            return true
        }else{
            return false
        }
    }
    
    /// MD5
   public var md5:String {
        let utf8 = cString(using: .utf8)
        var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5(utf8, CC_LONG(utf8!.count - 1), &digest)
        let result = digest.reduce("") { $0 + String(format:"%02X", $1) }
        // 默认返回小写
        return result.lowercased()
    }
    
    /// String 转 CGFloat 不能直接转 需要中转
    public func cgfloadtValue() -> CGFloat {
        let double = Double(self)
        let float = CGFloat(double ?? 0)
        return float
    }
    
    /// 去掉首尾空格
    public var removeHeadAndTailSpace:String {
        let whitespace = NSCharacterSet.whitespaces
        return self.trimmingCharacters(in: whitespace)
    }
    
    /// 去掉首尾空格 包括后面的换行 \n
    public var removeHeadAndTailSpacePro:String {
        
        let whitespace = NSCharacterSet.whitespacesAndNewlines
        return self.trimmingCharacters(in: whitespace)
    }
     
    /// 去掉所有空格
    public var removeAllSapce: String {
        
        return self.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
    }
    
    /// 去掉首尾空格后 指定开头空格数
    public func beginSpaceNum(num: Int) -> String {
        
        var beginSpace = ""
        for _ in 0..<num {
            beginSpace += " "
        }
        return beginSpace + self.removeHeadAndTailSpacePro
    }
    
    /// sub string
    public func subStringInRange(_ r: Range<Int>) -> String? {
        
         if r.lowerBound < 0 || r.upperBound > self.count {
            return nil
         }
         let startIndex = self.index(self.startIndex, offsetBy:r.lowerBound)
         let endIndex   = self.index(self.startIndex, offsetBy:r.upperBound)
         return String(self[startIndex..<endIndex])
     }
    
     /// 手机号中间四位加密
     /// - Returns: description
    public func phoneEncryption() -> String {
        
        if count < 11{
            return self
        }
        let startIndex = (self.index(self.startIndex, offsetBy:3))
        let endIndex = self.index(startIndex, offsetBy:3)
        let setPhone = self.replacingCharacters(in: startIndex...endIndex, with: "****")
        return setPhone
    }
    
    
    public func idCardEncryption()-> String{
        
        if count == 15{
            let startIndex = (self.index(self.startIndex, offsetBy:6))
            let endIndex = self.index(startIndex, offsetBy:5)
            let newString = self.replacingCharacters(in: startIndex...endIndex, with: "******")
            return newString
        }else if count == 18{
            
//            610321199008083115
            let startIndex = (self.index(self.startIndex, offsetBy:6))
            let endIndex = self.index(startIndex, offsetBy:7)
            let newString = self.replacingCharacters(in: startIndex...endIndex, with: "********")
            return newString
        }else{
            return self
        }
        
    }
    
    
    /// 后四位加密
    /// - Returns: description
    public func lastFourEncryption() -> String {
        
        let startIndex = (self.index(self.startIndex, offsetBy:self.count - 5))
        let endIndex = self.index(startIndex, offsetBy:4)
        let setPhone = self.replacingCharacters(in: startIndex...endIndex, with: "****")
        return setPhone
   }
    
    /// 获取简要的姓名
    /// - Parameter name: name description
    /// - Returns: description
    public func briefName() -> String {
        
        if self.count <= 2 {
            
            return self
        }else{
            
            let startIndex = self.count - 2
            let endIndex = self.count
            return self.subStringInRange(startIndex..<endIndex) ?? ""
         }
    }
    
    
    public static func random(_ count: Int, _ isLetter: Bool = false) -> String {
        var ch: [CChar] = Array(repeating: 0, count: count)
        for index in 0..<count {
            var num = isLetter ? arc4random_uniform(58)+65:arc4random_uniform(75)+48
            if num>57 && num<65 && isLetter==false { num = num%57+48 }
            else if num>90 && num<97 { num = num%90+65 }
            ch[index] = CChar(num)
        }
        return String(cString: ch)
    }
    
    private static let random_str_characters = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    public static func randomStr(len : Int) -> String{
        var ranStr = ""
        for _ in 0..<len {
            let index = Int(arc4random_uniform(UInt32(random_str_characters.count)))
            ranStr.append(random_str_characters[random_str_characters.index(random_str_characters.startIndex, offsetBy: index)])
        }
        return ranStr
    }
    
}

extension CGFloat{
    
    /// string 转 cgfloat
    /// - Returns: description
    public func stringValue() -> String {
        
        return String.init(format:"%.2f",self)
    }
}
