//
//  BussinessCategoriesDataSource.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 24/05/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation

class FilterCategoriesDataSource : NSObject, IFilterCategoryDataSource{
 
    private var categories: [ICategory] = []
    
    required init(categories: [ICategory]) {
        super.init()
        self.categories = categories
    }
    
    func getCategory(indexPath: IndexPath) -> ICategory? {
        
        guard indexPath.row < self.categories.count else {
            return nil
        }
        return self.categories[indexPath.row]
    }
    
    
    //MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return self.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let category:ICategory = self.categories[indexPath.row]
        let cell:ICategoryCollectionCell = (collectionView as! AICollectionView).dequeueCellLoadNibIfNeed(type: CategoryCollectionCell.self, indexPath: indexPath) as! ICategoryCollectionCell
        
        
        cell.set(category: category)
        
        return cell as! UICollectionViewCell
    }
}