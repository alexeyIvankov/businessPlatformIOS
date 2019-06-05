//
//  DynamicGridCollectionView.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 03/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

class CollectionPatternView : UIView, ICollectionPatternView{
 
    private var collectionView:AICollectionView!
    private var layout:UICollectionViewFlowLayout!
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.build()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.build()
    }
    
   
    private func build(){
        
        self.layout = UICollectionViewFlowLayout()
        self.collectionView = AICollectionView(frame:self.bounds, collectionViewLayout: self.layout)
      
        self.translatesAutoresizingMaskIntoConstraints = true
        self.collectionView.translatesAutoresizingMaskIntoConstraints = true
        
        self.collectionView.autoresizingMask = [UIView.AutoresizingMask.flexibleRightMargin,
                                                UIView.AutoresizingMask.flexibleLeftMargin,
                                                UIView.AutoresizingMask.flexibleTopMargin,
                                                UIView.AutoresizingMask.flexibleBottomMargin,
                                                UIView.AutoresizingMask.flexibleWidth,
                                                UIView.AutoresizingMask.flexibleHeight]
        
        addSubview(self.collectionView)
    }
    

    public func set(dataSource:UICollectionViewDataSource){
        self.collectionView.dataSource = dataSource
    }
    
    public func set(layout:UICollectionViewLayout){
        self.collectionView.collectionViewLayout = layout
    }
    
    public func set(scrollEnable:Bool){
      self.collectionView.isScrollEnabled = scrollEnable
    }
    
    public func reloadData(completion: @escaping ()->()){
        self.collectionView.reloadData {
            completion()
        }
    }
    
    public func contentSize() -> CGSize {
        return self.collectionView.contentSize
    }
}
