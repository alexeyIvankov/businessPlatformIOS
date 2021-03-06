//
//  IAuthCake.swift
//  IMH_BI
//
//  Created by Alexey Ivankov on 27.08.2018.
//  Copyright © 2018 Industrial Metallurgical Holding. All rights reserved.
//

import Foundation

protocol IAuthCake : AnyObject{
 
    var authDirector:IAuthDirector { get }
    var authRouter:IAuthRouter { get }
}
