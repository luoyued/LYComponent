//
//  UIScrollView+extension.swift
//  LYComponent
//
//  Created by luoyue on 2021/8/8.
//  Copyright © 2021 luoyue. All rights reserved.
//

import UIKit
import MJRefresh

extension UIScrollView{
    
    /// add header refresh
    /// - Parameter refreshingBlock:
    public func addHeaderRefresh(refreshingBlock: @escaping ()->Void) {
        
        mj_header = MJRefreshNormalHeader(refreshingBlock: refreshingBlock)
    }
    
    /// add footer refresh
    /// - Parameter refreshingBlock:
    public func addFooterRefresh(refreshingBlock: @escaping ()->Void) {
        
        mj_footer = MJRefreshBackNormalFooter(refreshingBlock: refreshingBlock)
            //MJRefreshAutoNormalFooter(refreshingBlock: refreshingBlock)
    }
    
    
    /// end refreshing
    public func endRefreshing() {
        
        if mj_header != nil {
            mj_header!.endRefreshing()
        }
        if mj_footer != nil {
            mj_footer!.endRefreshing()
        }
    }
    
    /// 开始刷新
    public func beginRefreshing() {
        
        if mj_header != nil {
            mj_header!.beginRefreshing()
        }
    }
    
    
    
    public func noMoreData() {
        mj_footer?.endRefreshingWithNoMoreData()
    }
    /// end redreshing no more data
    public func endRefreshingWithNoMoreData() {
        
        if mj_header != nil {
           mj_header!.endRefreshing()
        }
        if mj_footer != nil {
           mj_footer!.endRefreshingWithNoMoreData()
        }
    }
}




