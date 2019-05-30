//
//  LoginDirector.swift
//  IMH_BI
//
//  Created by Alexey Ivankov on 24.08.2018.
//  Copyright © 2018 Industrial Metallurgical Holding. All rights reserved.
//

import Foundation

class MainDirector : IMainDirector {
    
    func loadCategories(completion: @escaping (IFilterCategoryDataSource) -> ()) {
        
        var categories:[ICategory] = []
        
        for i in 1...20{
            categories.append(Category(name: "category \(i)"))
        }
        completion(FilterCategoriesDataSource(categories: categories))
    }
}
