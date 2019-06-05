//
//  ICategoriesContainerCell.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 03/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

public protocol ICategoriesContainerCell where Self:UITableViewCell {
    
    func set(dataSource:ICategoriesDataSource)
    func reloadData(completion: @escaping()->())
    
    func contentSize() -> CGSize
}
