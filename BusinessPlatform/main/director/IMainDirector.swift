//
//  ILoginDirector.swift
//  IMH_BI
//
//  Created by Alexey Ivankov on 24.08.2018.
//  Copyright © 2018 Industrial Metallurgical Holding. All rights reserved.
//

import Foundation

enum MainTableItemType{
    case recommendedPosts
    case categories
    
    func string() -> String {
        
        if self == .recommendedPosts{
            return "recommendedPosts"
        }
        else if self == .categories{
            return "categories"
        }
        fatalError()
    }
}

protocol IMainDirector : AnyObject {
    
    func buildMainTableDataSource(completion:@escaping(IMainTableDataSource)->())
}
