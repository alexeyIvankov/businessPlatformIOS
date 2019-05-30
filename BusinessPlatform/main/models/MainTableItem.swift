//
//  MainTableItem.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 30/05/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation

class MainTableItem : IMainTableItem{
    var type: MainTableItemType
    
    required init(type: MainTableItemType){
        self.type = type
    }
}
