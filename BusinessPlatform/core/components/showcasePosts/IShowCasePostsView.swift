//
//  IPostViewer.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 24/05/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation

protocol IShowCasePostsView {
    
    var delegate:IShowCasePostsViewDelegate? { get }
    
    //UI settings
    func set(design:IDesignShowCasePosts)
    
    //Data source
    func set(dataSource:IShowCasePostsDataSource)
    func reloadData()
}

public protocol IShowCasePostsViewDelegate{
    func didSelect(post:IPost)
}
