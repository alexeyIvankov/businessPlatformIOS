//
//  ServiceCategory.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 22/05/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation

class ServiceCategory : IServiceCategory{
    
    func loadMainCategories(completion: @escaping (IFilterCategoryDataSource) -> ()) {
     
        var categories:[ICategory] = []
        
        for i in 1...20{
            categories.append(Category(name: "category \(i)"))
        }
        completion(FilterCategoriesDataSource(categories: categories))
    }
}
