//
//  IShowCasePostsDataSource.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 24/05/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

public protocol IShowCasePostsDataSource : UICollectionViewDataSource{
    
    func getPost(indexPath:IndexPath) -> IPost?
}
