//
//  CategoriesContainerCell.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 03/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

class CategoriesContainerCell : UITableViewCell, ICategoriesContainerCell{
    
    @IBOutlet var collectionPatterView:CollectionPatternView!
    private var dataSource:ICategoriesDataSource!
    
    override func awakeFromNib() {
        //self.applyDesign()
        
          //collectionView.isScrollEnabled = false
        
        var l = UICollectionViewFlowLayout()
        l.scrollDirection = .horizontal
        l.estimatedItemSize = CGSize(width: 150, height: 150)
        l.minimumInteritemSpacing = 30
        self.collectionPatterView.set(layout: l)
    }
    
    func set(dataSource: ICategoriesDataSource) {
        self.dataSource = dataSource
        self.collectionPatterView.set(dataSource: self.dataSource)
    }
    
    func reloadData(completion: @escaping()->()){
        self.collectionPatterView.reloadData(completion: completion)
    }
    
    func contentSize() -> CGSize{
        return CGSize(width: UIScreen.main.bounds.width, height: 200)
    }
}
