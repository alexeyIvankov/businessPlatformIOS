//
//  CatalogController+Design.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 10/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

extension CatalogController{
    
    func applyDesign(){
        self.collectionViewPosts.collectionViewLayout = self.buildPostCollectionLayout()
        self.collectionViewCategories.collectionViewLayout = self.buildCategoryCollectionLayout()
    }
    
    func buildCategoryCollectionLayout() -> UICollectionViewLayout{
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = CGSize(width: 100, height: 100)
        
        return layout
    }
    
    func buildPostCollectionLayout() -> UICollectionViewLayout{
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = CGSize(width: 100, height: 100)
        
        return layout
    }
}
