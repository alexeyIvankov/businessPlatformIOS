//
//  LoginDirector.swift
//  IMH_BI
//
//  Created by Alexey Ivankov on 24.08.2018.
//  Copyright © 2018 Industrial Metallurgical Holding. All rights reserved.
//

import Foundation

class MainDirector : IMainDirector {
    
      func buildMainTableDataSource(completion:@escaping(IMainTableDataSource)->())
      {
        
        var posts:[IPost] = []
        
        for i in 1...20{
            posts.append(Post(name: "post \(i)"))
        }
    
        var categories:[ICategory] = []
        
        for i in 1...20{
            categories.append(Category(name: "category \(i)"))
        }
        
        completion( MainTableDataSource(items:
            [MainTableItemType.categories, MainTableItemType.recommendedPosts],
                                        recommendedPostsDataSource: RecomendedPostsDataSource(posts: posts),
                                        categoriesDataSource: CategoriesDataSource(categories:categories)))
    }
}
