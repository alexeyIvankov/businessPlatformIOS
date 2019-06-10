//
//  ICollectionData.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 08/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

public protocol ICollectionDataDelegate{
    func didSelect(item:AnyObject)
}

public protocol ICollectionData where Self:UIViewController{
    
    init(layout:UICollectionViewLayout,
         cellType:UICollectionViewCell.Type)
    
    var delegate:ICollectionDataDelegate? { get set }
    
    func set<T>(models:[T])
    func set(enableScroll:Bool)
    
    func reloadData(completion: @escaping ()->())
    func clearData(completion: @escaping ()->())
    func contentSize() -> CGSize
}
