//
//  AITableView.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 30/05/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

class AITableView : UITableView{
    
    private var reuseIdentifierNib:Set<String> = Set<String>()
    
    override func register(_ nib: UINib?, forCellReuseIdentifier identifier: String) {
        super.register(nib, forCellReuseIdentifier: identifier)
        self.reuseIdentifierNib.insert(identifier)
    }
    
    public func dequeueCellLoadNibIfNeed(type:UITableViewCell.Type,
                                         indexPath:IndexPath) -> UITableViewCell{
        
        if self.reuseIdentifierNib.contains(type.reuseIdCell()) == false{
            self.register(type.nibCell(), forCellReuseIdentifier: type.reuseIdCell())
        }
        
        let cell:UITableViewCell = self.dequeueReusableCell(withIdentifier: type.reuseIdCell(), for: indexPath)
        
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
