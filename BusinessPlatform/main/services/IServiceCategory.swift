//
//  IServiceCategory.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 22/05/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

protocol IServiceCategory {
    
    func loadAllCategories(categories:@escaping()->([ICategory]))
}
