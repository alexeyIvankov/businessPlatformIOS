//
//  IPostsViewerFilteringByCategory.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 08/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

public protocol IPostViewerConfigurator{
        
    func postsViewerTypeCells(postsViewer:IPostsViewerInCategory) -> (categoryCell:UICollectionViewCell.Type, postCell:UICollectionViewCell.Type)
    
    func postsViewerLayouts(postsViewer:IPostsViewerInCategory) -> (layoutCategory:UICollectionViewLayout, layoutPost:UICollectionViewLayout)
}

public protocol IPostsViewerInCategory where Self:UIViewController{
    
    func configure(configurator:IPostViewerConfigurator)
    func present(view:UIView)
    
    func set(categories:[ICategory])
    
    func reloadCategories(completion:@escaping ()->())
    func reloadPosts(completion:@escaping ()->())
    func reloadAll(completion:@escaping ()->())
}
