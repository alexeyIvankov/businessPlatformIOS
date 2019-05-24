//
//  IBusinessCategoriesDataSource.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 24/05/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation

public protocol IFilterCategoryDataSource : UICollectionViewDataSource {
    
    func getCategory(indexPath:IndexPath) -> ICategory?
}
