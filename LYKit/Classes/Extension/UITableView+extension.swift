//
//  UITableView+extension.swift
//  LYExtension
//
//  Created by luoyue on 2021/8/5.
//

import UIKit

extension UITableView {
    /// regist cell
    public func registerCell(_ cellType:UITableViewCell.Type){
        self.register(cellType, forCellReuseIdentifier: UIView.viewIdentifier(cellType))
    }
    
    /// regist HeaderView Class
    /// - Parameter viewType: UITableViewHeaderFooterView.Type
    public func registHeaderFooterView(_ viewType:UITableViewHeaderFooterView.Type){
        register(viewType, forHeaderFooterViewReuseIdentifier: UIView.viewIdentifier(viewType))
    }
    
    /// dequeue Cell
    /// - Parameters:
    /// - identifier: PPSomeCell.self
    /// - indexPath: indexPath
    /// - Returns: PPSomeCell
    public func dequeueCell<T:UITableViewCell>(_ viewType: T.Type, for indexPath: IndexPath) -> T{
        
        return dequeueReusableCell(withIdentifier: UIView.viewIdentifier(viewType), for: indexPath) as! T
    }
    
    /// dequeue HeaderView & FooterView
    /// - Parameters:
    /// - identifier: PPSomeHeaderView.self
    /// - indexPath: indexPath
    /// - Returns: PPSomeHeaderView
    public func dequeueHeaderFooterView<T:UITableViewHeaderFooterView>(_ viewType: T.Type)
        -> T {

        return dequeueReusableHeaderFooterView(withIdentifier: UIView.viewIdentifier(viewType)) as! T
    }
    
}
