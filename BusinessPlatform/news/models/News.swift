//
//  News.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 10/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation

class News : INews {
    
    var title:String
    var body:String
    
    required init(title:String, body:String){
        self.title = title
        self.body = body
    }
}
