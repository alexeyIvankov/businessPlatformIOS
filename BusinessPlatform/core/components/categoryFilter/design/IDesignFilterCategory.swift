//
//  IDesignFilterCategory.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 29/05/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation

public protocol IDesignFilterCategory{
    
    func sizeCells() -> CGSize?
    func minSpacingBetweenCells() -> CGFloat?
}
