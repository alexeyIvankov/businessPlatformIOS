//
//  CatalogDirector.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 10/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation

class CatalogDirector : ICatalogDirector{
    
    func loadCategories(completion:@escaping ([ICategory])->()){
        
        var categories:[ICategory] = []
        
        for i in 1...20{
            let category = Category(name: "category \(i)")
            categories.append(category)
        }
        completion(categories)
    }
    
    func loadPosts(completion:@escaping ([IPost])->()){
        
        var posts:[IPost] = []
        
        for i in 1...200{
            let post = Post(name: "post \(i)")
            posts.append(post)
        }
        completion(posts)
    }
}
