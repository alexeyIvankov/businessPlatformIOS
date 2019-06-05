//
//  IRecomendedPostsTableCell.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 30/05/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

public protocol IRecomendedPostsContainerCell where Self:UITableViewCell {
 
    func set(dataSource:IRecomendedPostsDataSource)
    func reloadData(completion: @escaping()->())
    
    func contentSize() -> CGSize
}
