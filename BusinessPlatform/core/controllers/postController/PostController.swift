//
//  PostController.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 06/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

class PostController : UIViewController,IPostController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    var delegate: IPostControllerDelegate?
    
    private var collectionView:AICollectionView!
    private var layout:UICollectionViewLayout!
    private var cellType:UICollectionViewCell.Type!
    private var posts:[IPost] = []
    
    
    required init(layout:UICollectionViewLayout,
         cellType:UICollectionViewCell.Type){
        super.init(nibName: nil, bundle: nil)
        self.layout = layout
        self.cellType = cellType
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.collectionView = self.buildAndConfigCollectionView()
        self.view = self.collectionView
    }
    
    private func buildAndConfigCollectionView()-> AICollectionView{
        
        let collectionView = AICollectionView(frame:UIScreen.main.bounds, collectionViewLayout: self.layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = true
        
        collectionView.autoresizingMask = [UIView.AutoresizingMask.flexibleRightMargin,
                                                UIView.AutoresizingMask.flexibleLeftMargin,
                                                UIView.AutoresizingMask.flexibleTopMargin,
                                                UIView.AutoresizingMask.flexibleBottomMargin,
                                                UIView.AutoresizingMask.flexibleWidth,
                                                UIView.AutoresizingMask.flexibleHeight]
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }
    
    //MARK: - IPostController
    
    func set(posts: [IPost]) {
        self.posts = posts
    }

    
    public func reloadData(completion: @escaping ()->()){
        self.collectionView.reloadData {
            completion()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let post:IPost = self.posts[indexPath.row]
        let cell:IPostCell = (collectionView as! AICollectionView).dequeueCellLoadNibIfNeed(type: self.cellType, indexPath: indexPath) as! IPostCell
        cell.set(post: post)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let post:IPost = self.posts[indexPath.row]
        self.delegate?.didSelect(post: post)
    }
}

