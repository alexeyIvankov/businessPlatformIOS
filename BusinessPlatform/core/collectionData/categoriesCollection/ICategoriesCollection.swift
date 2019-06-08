//
//  ICategoriesController.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 07/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

public protocol ICategoriesCollectionDelegate{
    func didSelect(category:ICategory)
}

public protocol ICategoriesCollection : ICollectionData{
        
    var delegate:ICategoriesCollectionDelegate? { get }
}
