//
//  IRecomendedPostCell.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 31/05/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

public protocol IRecomendedPostCell : IPostCell where Self:UICollectionViewCell{
    func set(post:IPost)
}
