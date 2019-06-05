//
//  RecomendedPostsTableCell.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 30/05/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

class RecomendedPostsContainerCell : UITableViewCell, IRecomendedPostsContainerCell{
 
    @IBOutlet var collectionPatterView:CollectionPatternView!
    private var dataSource:IRecomendedPostsDataSource!
    
    override func awakeFromNib() {
        self.applyDesign()
    }
    
    func set(dataSource: IRecomendedPostsDataSource) {
        self.dataSource = dataSource
        self.collectionPatterView.set(dataSource: self.dataSource)
    }
    
    func reloadData(completion: @escaping()->()){
        self.collectionPatterView.reloadData(completion: completion)
    }
    
    func contentSize() -> CGSize{
        return self.collectionPatterView.contentSize()
    }
    
}
