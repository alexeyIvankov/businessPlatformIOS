//
//  LoginDirector.swift
//  IMH_BI
//
//  Created by Alexey Ivankov on 24.08.2018.
//  Copyright © 2018 Industrial Metallurgical Holding. All rights reserved.
//

import Foundation

class MainDirector : IMainDirector {
        
    func loadData(completion:@escaping([ICategory])->()){
        
        var categories:[ICategory] = []
        
        for i in 1...20{
            
            let category = Category(name: "category \(i)")
            
            var posts:[IPost] = []
            
            for j in 1...20{
                posts.append(Post(name: "category \(i) post \(j)"))
            }
            
            category.posts = posts
            categories.append(category)
        }
        
        completion(categories)
    }
    
}
