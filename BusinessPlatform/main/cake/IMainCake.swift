//
//  ILoginCake.swift
//  IMH_BI
//
//  Created by Alexey Ivankov on 24.08.2018.
//  Copyright © 2018 Industrial Metallurgical Holding. All rights reserved.
//

import Foundation

protocol IMainCake : AnyObject {
    
    var router:IMainRouter { get }
    var director:IMainDirector { get }
}
