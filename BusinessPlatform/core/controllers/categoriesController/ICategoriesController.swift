//
//  ICategoriesController.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 07/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

public protocol ICategoriesControllerDelegate{
    func didSelect(category:ICategory)
}

public protocol ICategoriesController{
    
    init(layout:UICollectionViewLayout,
         cellType:UICollectionViewCell.Type)
    
    var delegate:ICategoriesControllerDelegate? { get }
    
    func set(categories:[ICategory])
    func reloadData(completion: @escaping ()->())
}
