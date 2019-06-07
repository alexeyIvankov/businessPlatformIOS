//
//  Categories.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 22/05/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation

class Category : ICategory {
    var name: String
    var posts:[IPost] = []
    
    required init(name:String, posts:[IPost] = []){
        self.name = name
        self.posts = posts
    }
}
