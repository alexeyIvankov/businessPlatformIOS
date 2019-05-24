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
    
    //UI settings
    func set(sizeCell:CGSize) //default 100x100
    func set(minSpacing:CGFloat) //default 25
    
    //Data source
    func set(dataSource:IFilterCategoryDataSource)
    func reloadData()
}
