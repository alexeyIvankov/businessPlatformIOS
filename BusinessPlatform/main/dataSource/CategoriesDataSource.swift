//
//  BussinessCategoriesDataSource.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 24/05/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation

class CategoriesDataSource : NSObject, ICategoriesDataSource{
 
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
        let cell:ICategoriesCell = (collectionView as! AICollectionView).dequeueCellLoadNibIfNeed(type: CategoriesCell.self, indexPath: indexPath) as! ICategoriesCell
        
        cell.set(category: category)
        
        return cell
    }
    
//    //MARK: - UICollectionViewDelegate
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
//        let category = dataSource.getCategory(indexPath: indexPath)
//        assert(category != nil)
//        self.delegate?.didSelect(category: category!)
//    }
}
