//
//  UITableView+extension.swift
//  LYExtension
//
//  Created by luoyue on 2021/8/5.
//

import UIKit
extension UICollectionView {
    
    /// regist cell
    /// - Parameter cell: cell description
   public func registerCell(_ cell:UICollectionViewCell.Type){
        
        self.register(cell, forCellWithReuseIdentifier: UIView.viewIdentifier(cell))
    }
    
    /// regist header view
    /// - Parameter viewType: viewType description
    public func registHeaderView(_ reusableViewType:UICollectionReusableView.Type){
        
        self.register(reusableViewType, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: UIView.viewIdentifier(reusableViewType))
    }
    
    /// regist footer view
    /// - Parameter viewType: viewType description
    public func registFooterView(_ reusableViewType:UICollectionReusableView.Type){
        
        self.register(reusableViewType, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: UIView.viewIdentifier(reusableViewType))
    }
    
    /// dequeue cell
    /// - Parameters:
    /// - cellType:  cellType description
    /// - indexPath: indexPath description
    /// - Returns: description
    public func dequeueCell<T:UICollectionViewCell>(_ cellType:T.Type,for indexPath: IndexPath) -> T{
        
        return self.dequeueReusableCell(withReuseIdentifier: UIView.viewIdentifier(cellType), for: indexPath) as! T
    }
    
    /// dequeue HeaderView
    /// - Parameters:
    /// - identifier: PPSomeHeaderView.self
    /// - indexPath: indexPath
    /// - Returns: PPSomeHeaderView
    public func dequeueHeaderView<T:UICollectionReusableView>(reuseIdentifier cellType: T.Type, for indexPath: IndexPath) -> T{
        
        return dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: UIView.viewIdentifier(cellType), for: indexPath) as! T
    }
    
    /// dequeue FooterView
    /// - Parameters:
    /// - identifier: PPSomeFooterView.self
    /// - indexPath: indexPath
    /// - Returns: PPSomeFooterView
    public func dequeueFooterView<T:UICollectionReusableView>(reuseIdentifier cellType: T.Type, for indexPath: IndexPath) -> T{
        
        return dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: UIView.viewIdentifier(cellType), for: indexPath) as! T
    }
}
