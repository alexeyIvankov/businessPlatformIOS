//
//  RecomendedPostCell.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 31/05/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation

class CatalogCategoriesCell : UICollectionViewCell, ICatalogCategoriesCell{
 
    @IBOutlet var labelCategoryName:UILabel!
    
    private var category:ICategory!
    
    func set(category:ICategory){
        self.category = category
        //self.labelCategoryName.text = self.category.name
    }
    
}
