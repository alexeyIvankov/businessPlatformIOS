//
//  MainCollectionViewDataSource.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 21/05/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

class MainTableDataSource : NSObject, IMainTableDataSource{
    
    private let items:[MainTableItemType]
    private let recommendedPostsDataSource:IRecomendedPostsDataSource
    private let categoriesDataSource:ICategoriesDataSource
    
    private var casheHeightsCells:[String:CGSize] = [:]
    
    
    required init(items:[MainTableItemType],
                  recommendedPostsDataSource:IRecomendedPostsDataSource, categoriesDataSource:ICategoriesDataSource){
        self.items = items
        self.recommendedPostsDataSource = recommendedPostsDataSource
        self.categoriesDataSource = categoriesDataSource
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item:MainTableItemType = self.items[indexPath.row]
        
        if item == .recommendedPosts{
        
            let cell:IRecomendedPostsContainerCell = (tableView as! AITableView).dequeueCellLoadNibIfNeed(type: RecomendedPostsContainerCell.self, indexPath: indexPath) as! IRecomendedPostsContainerCell
            
            cell.set(dataSource: self.recommendedPostsDataSource)
            cell.reloadData(completion: {
                
              self.casheHeightsCells[item.string()] = cell.contentSize()
                
                tableView.beginUpdates()
                tableView.endUpdates()
            })
            
        
            return cell
        }
        else if item == .categories{
            
            let cell:ICategoriesContainerCell = (tableView as! AITableView).dequeueCellLoadNibIfNeed(type: CategoriesContainerCell .self, indexPath: indexPath) as! ICategoriesContainerCell
            
            cell.set(dataSource: self.categoriesDataSource)
            cell.reloadData(completion: {
                
                self.casheHeightsCells[item.string()] = cell.contentSize()
                
                tableView.beginUpdates()
                tableView.endUpdates()
            })
            
            return cell
            
        }
        assert(false)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let item:MainTableItemType = self.items[indexPath.row]
        let size = self.casheHeightsCells[item.string()]
        
        if size != nil{
            return size!.height
        }
        else {
            return 0
        }
    }
}
