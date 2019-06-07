//
//  ICategoryCell.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 07/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

public protocol ICategoryCell where Self:UICollectionViewCell{
    func set(category:ICategory)
}
