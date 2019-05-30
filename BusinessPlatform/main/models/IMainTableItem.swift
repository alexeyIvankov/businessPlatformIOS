//
//  IMainTableItem.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 30/05/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation

public enum MainTableItemType{
    case recommendedPosts
}

public protocol IMainTableItem{
    var type:MainTableItemType { get }
}




