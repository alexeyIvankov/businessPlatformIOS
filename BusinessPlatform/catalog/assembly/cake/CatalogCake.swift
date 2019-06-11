//
//  CatalogCake.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 10/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation

class CatalogCake : ICatalogCake{
    
    var director:ICatalogDirector
    var router:ICatalogRouter
    
    required init(director:ICatalogDirector, router:ICatalogRouter) {
        self.director = director
        self.router = router
    }
}
