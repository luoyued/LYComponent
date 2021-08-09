//
//  Bundle+extension.swift
//  LYComponent
//
//  Created by luoyue on 2021/8/8.
//  Copyright © 2021 luoyue. All rights reserved.
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

