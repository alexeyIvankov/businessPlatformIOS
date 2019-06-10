//
//  NewsCake.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 10/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation

class NewsCake : INewsCake{
    
    var director:INewsDirector
    var router:INewsRouter
    
    required init(director:INewsDirector, router:INewsRouter) {
        self.director = director
        self.router = router
    }
}
