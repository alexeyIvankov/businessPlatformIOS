//
//  IPostController.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 06/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

public protocol IPostControllerDelegate{
    func didSelect(post:IPost)
}

public protocol IPostController{
    
    init(layout:UICollectionViewLayout,
         cellType:UICollectionViewCell.Type)
    
    var delegate:IPostControllerDelegate? { get }
    
    func set(posts:[IPost])
    func reloadData(completion: @escaping ()->())
    
    func contentSize() -> CGSize
}
