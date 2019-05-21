//
//  LoginCake.swift
//  IMH_BI
//
//  Created by Alexey Ivankov on 24.08.2018.
//  Copyright © 2018 Industrial Metallurgical Holding. All rights reserved.
//

import Foundation

class MainCake : IMainCake {
    
    var router: IMainRouter
    var director: IMainDirector
    var design:IMainDesign
    
    required init(router:IMainRouter,
                  director:IMainDirector,
                  design:IMainDesign){
        
        self.router = router
        self.director = director
        self.design = design
    }
}
