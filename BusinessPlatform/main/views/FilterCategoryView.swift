//
//  CategoriesCell.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 21/05/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

class FilterCategoryView : UITableViewCell, IFilterCategoryView, UICollectionViewDataSource{
    
    @IBOutlet var collectionView:UICollectionView!
    
    private var categories: [ICategory] = []
    
    static func build()-> FilterCategoryView{
       
        let v:FilterCategoryView = Bundle.loadView(fromNib: "FilterCategoryView", withType: FilterCategoryView.self)
        
        return v
    }
    
    func set(categories: [ICategory]) {
        self.categories = categories
    }
    
    func reloadData(){
        self.collectionView.reloadData()
    }
    
    //MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let category:ICategory = self.categories[indexPath.row]
        let cell:ICategoryCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath) as! ICategoryCollectionCell
        
        cell.set(category: category)
        
        return cell as! UICollectionViewCell
    }
    
    
}
