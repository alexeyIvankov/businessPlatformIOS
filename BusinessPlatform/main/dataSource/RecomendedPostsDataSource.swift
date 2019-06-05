//
//  RecomendedPostsDataSource.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 31/05/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation

class RecomendedPostsDataSource : NSObject, IRecomendedPostsDataSource{

    private var posts:[IPost]
    
    required init(posts:[IPost]){
        self.posts = posts
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let post:IPost = self.posts[indexPath.row]
        let cell:IRecomendedPostCell = (collectionView as! AICollectionView).dequeueCellLoadNibIfNeed(type: RecomendedPostCell.self, indexPath: indexPath) as! IRecomendedPostCell
        cell.set(post: post)
        
        return cell
    }
}
