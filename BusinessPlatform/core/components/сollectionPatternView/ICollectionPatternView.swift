//
//  ICollectionPatternView.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 05/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

protocol ICollectionPatternView where Self:UIView{
    func set(dataSource:UICollectionViewDataSource)
    func set(layout:UICollectionViewLayout)
    func set(scrollEnable:Bool)
    
    func reloadData(completion: @escaping ()->())
    
    func contentSize() -> CGSize
}
