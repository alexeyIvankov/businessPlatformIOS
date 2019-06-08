//
//  IPostController.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 06/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

public protocol IPostCollectionDelegate{
    func didSelect(post:IPost)
}

public protocol IPostCollection : ICollectionData{
 
    var delegate:IPostCollectionDelegate? { get }
}
