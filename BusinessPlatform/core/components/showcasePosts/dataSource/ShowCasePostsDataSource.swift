//
//  ShowCasePostsDataSource.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 29/05/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

class ShowCasePostsDataSource : NSObject, IShowCasePostsDataSource{

    private var posts: [IPost] = []
    
    required init(posts: [IPost]) {
        super.init()
        self.posts = posts
    }
    
    func getPost(indexPath: IndexPath) -> IPost? {
        guard indexPath.row < self.posts.count else {
            return nil
        }
        
        return self.posts[indexPath.row]
    }
    
    
    //MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return self.posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let post:IPost = self.posts[indexPath.row]
        let cell:IPostCollectionCell = (collectionView as! AICollectionView).dequeueCellLoadNibIfNeed(type: CategoryCollectionCell.self, indexPath: indexPath) as! IPostCollectionCell
        
        cell.set(post: post)
        
        return cell as! UICollectionViewCell
    }
    
}
