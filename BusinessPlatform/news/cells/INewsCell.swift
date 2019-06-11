//
//  INewCell.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 11/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

public protocol INewsCell where Self:UITableViewCell {
    
    func set(news:INews)
}
