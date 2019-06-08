//
//  IPostCell.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 06/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

public protocol IPostCell where Self:UICollectionViewCell{
    func set(post:IPost)
}
