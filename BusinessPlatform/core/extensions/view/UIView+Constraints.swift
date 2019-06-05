//
//  UIView+Constraints.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 03/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    
    func addConstraintsResize(subview:UIView){
     
        let topConstraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: subview, attribute: .top, multiplier: 1, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: subview, attribute: .bottom, multiplier: 1, constant: 0)
        let leadingConstraint = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: subview, attribute: .leading, multiplier: 1, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: subview, attribute: .trailing, multiplier: 1, constant: 0)
        

        self.addConstraint(topConstraint)
        self.addConstraint(bottomConstraint)
        self.addConstraint(leadingConstraint)
        self.addConstraint(trailingConstraint)
    }
}
