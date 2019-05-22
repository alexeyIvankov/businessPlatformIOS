//
//  TableView+Deque.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 22/05/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

extension UITableView{
    
    func dequeueCellLoadNibIfNeed(reuseId:String, indexPath:IndexPath) ->UITableViewCell {
        
        let cell:UITableViewCell = self.dequeueReusableCell(withIdentifier: reuseId, for: indexPath)
        
        return cell
    }
    
    func dequeueCellLoadNibIfNeed(type:UITableViewCell.Type, indexPath:IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.dequeueReusableCell(withIdentifier: type.reuseIdCell(), for: indexPath)
        
        return cell
    }
}
