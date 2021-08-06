//
//  BundleExtension.swift
//  WisdomFN
//
//  Created by Zhangxu on 2020/7/10.
//  Copyright © 2020 Zhangxu. All rights reserved.
//

import UIKit

extension Bundle {
    
    /// object bundle name
    public var namespace : String {
        return infoDictionary?["CFBundleName"] as! String
    }
    
    /// object version
    public var appVersion : String {
        return infoDictionary?["CFBundleShortVersionString"] as! String
    }
    
    /// object build
    public var appBuild : String {
        return infoDictionary?["CFBundleVersion"] as! String
    }
    
    /// plist path
    ///
    /// - Parameter name: plist name
    /// - Returns: plist path
    public static func plistPath(name : String) -> String? {
        return NSHomeDirectory() + "/Library/Preferences/\(name).plist"
    }
    
}

