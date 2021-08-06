//
//  YBSystemPathTool.swift
//
//  Created by luoyue on 2019/5/10.
//  Copyright © 2019 luoyue. All rights reserved.
//

import UIKit

public class YBSystemPathTool: NSObject {
    /**根目录*/
    public static func documentPath() -> String{
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last ?? ""
    }
}
