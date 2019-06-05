//
//  AICollectionView.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 23/05/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

class AICollectionView : UICollectionView{

    private var reuseIdentifierNib:Set<String> = Set<String>()
    
    override func register(_ nib: UINib?, forCellWithReuseIdentifier identifier: String) {
        super.register(nib, forCellWithReuseIdentifier: identifier)
        self.reuseIdentifierNib.insert(identifier)
    }
    
    public func dequeueCellLoadNibIfNeed(type:UICollectionViewCell.Type,
                                         indexPath:IndexPath) -> UICollectionViewCell{
        
        if self.reuseIdentifierNib.contains(type.reuseIdCell()) == false{
            self.register(type.nibCell(), forCellWithReuseIdentifier: type.reuseIdCell())
        }
        
        let cell:UICollectionViewCell = self.dequeueReusableCell(withReuseIdentifier: type.reuseIdCell(), for: indexPath)
        
        return cell
    }
    
    public func reloadData(completion:@escaping()->()){
    
        CATransaction.begin()
        self.reloadData()
        
        CATransaction.setCompletionBlock {
            completion()
        }
        CATransaction.commit()
    }
}
