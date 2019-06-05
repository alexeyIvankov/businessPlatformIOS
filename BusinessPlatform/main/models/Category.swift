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
    
    required init(name:String){
        self.name = name
    }
}
