//
//  ShowCasePostsView.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 24/05/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

class ShowCasePostsView : UITableViewCell, IShowCasePostsView, UICollectionViewDelegate{
    
    @IBOutlet var collectionView:AICollectionView!
    
    var delegate: IShowCasePostsViewDelegate?
    
    private var _dataSource: IShowCasePostsDataSource!
    private var _sizeCell:CGSize = CGSize(width: 100, height: 100)
    private var _minimumLineSpacing:CGFloat = 25
    
    static func build()-> ShowCasePostsView{
        
        let v:ShowCasePostsView = Bundle.loadView(fromNib: "ShowCasePostsView",
                                                   withType: ShowCasePostsView.self)
        return v
    }
    
    override func awakeFromNib() {
        self.collectionView.delegate = self
        configureLayoutIfFlowLayout()
    }
    
    func set(dataSource:IShowCasePostsDataSource){
        _dataSource = dataSource
        self.collectionView.dataSource = _dataSource
    }
    
    func set(sizeCell: CGSize) {
        _sizeCell = sizeCell
        configureLayoutIfFlowLayout()
    }
    
    func set(minSpacing: CGFloat) {
        _minimumLineSpacing = minSpacing
        configureLayoutIfFlowLayout()
    }
    
    func reloadData(){
        self.collectionView.reloadData()
    }
    
    private func configureLayoutIfFlowLayout(){
        if let collectionViewFlowLayout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            collectionViewFlowLayout.estimatedItemSize = _sizeCell
            collectionViewFlowLayout.minimumLineSpacing = _minimumLineSpacing
            collectionViewFlowLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
            collectionViewFlowLayout.invalidateLayout()
            self.collectionView.layoutSubviews()
        }
    }
    
    //MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        let post = _dataSource.getPost(indexPath: indexPath)
        assert(post != nil)
        self.delegate?.didSelect(post: post!)
    }
}

protocol IPostCollectionCell {
    func set(post:IPost)
}

class PostCollectionCell : UICollectionViewCell, IPostCollectionCell {
    
    @IBOutlet var labelPostName:UILabel!
    
    private var post:IPost!
    
    func set(post: IPost) {
        self.post = post
        self.labelPostName.text = self.post.name
    }
}
