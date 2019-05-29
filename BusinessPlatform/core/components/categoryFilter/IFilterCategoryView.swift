//
//  ICategoriesCell.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 22/05/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

public protocol IFilterCategoryView{
    
    var delegate:IFilterCategoryDelegate? { get }
    
    func set(design:IDesignFilterCategory)
    
    //Data source
    func set(dataSource:IFilterCategoryDataSource)
    func reloadData()
}

public protocol IFilterCategoryDelegate{
    func didSelect(category:ICategory)
}
