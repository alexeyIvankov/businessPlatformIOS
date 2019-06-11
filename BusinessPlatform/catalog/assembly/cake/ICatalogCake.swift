//
//  ICatalogCake.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 10/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

public protocol ICatalogCake : AnyObject{
    
    var director:ICatalogDirector { get }
    var router:ICatalogRouter { get }
}
