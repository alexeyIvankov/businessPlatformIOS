//
//  Post.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 24/05/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation

class Post : IPost {
    
    var name:String
    
    required init(name:String){
        self.name = name
    }
}
