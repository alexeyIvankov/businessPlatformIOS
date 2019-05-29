//
//  DefaultDesignFilterCategory.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 29/05/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation

class DefaultDesignFilterCategory : IDesignFilterCategory{
    func sizeCells() -> CGSize? {
        return CGSize(width: 100, height: 100)
    }
    
    func minSpacingBetweenCells() -> CGFloat? {
        return 25
    }
}
