//
//  IPostsViewerFilteringByCategory.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 08/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

public protocol IPostsViewerInCategory where Self:UIViewController{
    
    init(typeCellCategory:UICollectionViewCell.Type,
         typeCellPost:UICollectionViewCell.Type)
    
    func set(categories:[ICategory])
    func reloadData(completion:@escaping ()->())
}
