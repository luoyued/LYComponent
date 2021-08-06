//
//  ZWCSaveFileTool.swift
//  huijieshou
//
//  Created by luoyue on 2021/3/18.
//

import UIKit

public class ZWCSaveFileTool: NSObject {
    public static func saveImageToDocument(_ image:UIImage) -> String{
        let data = image.pngData()
        let path = YBSystemPathTool.documentPath() + "/" + String(format: "%.0f", Date().timeIntervalSince1970 * 1000) +  String.randomStr(len: 32)  + ".png"
        
       
        do{
            let url = URL(fileURLWithPath: path)
            try data?.write(to: url, options: .atomic)
            return path
        }catch{
            print("保存图片失败")
            return ""
        }
    }
}
