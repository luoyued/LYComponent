 //
//  UIAlertActionCategory.swift
//  MeditationDiary
//
//  Created by 落月 on 2019/12/30.
//  Copyright © 2019 Novabeyond. All rights reserved.
//

import UIKit

extension UIAlertController{
    
    public static func alertController(_ title:String?, _ message:String?,_ cancel:String?,_ moreButtonTitles: [String]?,_ callBack:((_ index:Int)->())?) -> UIAlertController{
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        var index = 0
        if cancel != nil{
            let currentIndex = index
            let cancelAction = UIAlertAction(title: cancel, style: .cancel) { (action) in
                callBack?(currentIndex)
            }
            index += 1
            alertVC.addAction(cancelAction)
        }
        for btnTitle in moreButtonTitles ?? [] {
            let currentIndex = index
            let action = UIAlertAction(title: btnTitle, style: .default) { (action) in
                callBack?(currentIndex)
            }
            index += 1
            alertVC.addAction(action)
        }
        
        return alertVC
    }
    
}
