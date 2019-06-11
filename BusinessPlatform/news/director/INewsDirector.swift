//
//  INewsDirector.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 10/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

public protocol INewsDirector{
    
    func loadNews(completion:@escaping ([INews])->())
}
