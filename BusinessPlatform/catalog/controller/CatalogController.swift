//
//  CatalogController.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 10/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

class CatalogController : UIViewController{
    
    //MARK: - Dependence
    var cake:ICatalogCake = Dependence.tryInject()!
    
    //MARK: - Outlets
    @IBOutlet var collectionViewCategories:AICollectionView!
    @IBOutlet var collectionViewPosts:AICollectionView!
    
    @IBOutlet var heightCollectionPostsConstraint:NSLayoutConstraint!
    
    private var dataSourceCategories:CategoriesDataSource!
    private var dataSourcePosts:PostsDataSource!
    
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Каталог"
        
        self.applyDesign()
        
        self.prepareCategoriesDataSource {
            self.collectionViewCategories.dataSource = self.dataSourceCategories
            self.collectionViewCategories.reloadData {
                
            }
        }
        
        self.preparePostsDataSource {
            self.collectionViewPosts.dataSource = self.dataSourcePosts
            self.collectionViewPosts.reloadData {
                self.updateHeightCollectionPostsAnimation()
            }
        }
    }
    
    private func prepareCategoriesDataSource(completion:@escaping()->()){
        self.cake.director.loadCategories { [weak self](categories) in
            self?.dataSourceCategories = CategoriesDataSource(categories: categories)
            completion()
        }
    }
    
    private func preparePostsDataSource(completion:@escaping()->()){
        self.cake.director.loadPosts { [weak self](posts) in
            self?.dataSourcePosts = PostsDataSource(posts: posts)
            completion()
        }
    }
    
    private func updateHeightCollectionPostsAnimation(){
        UIView.animate(withDuration: 0.5) {
            self.heightCollectionPostsConstraint.constant = self.collectionViewPosts.contentSize.height
            self.view.layoutIfNeeded()
        }
    }
}

final private class CategoriesDataSource : NSObject, UICollectionViewDataSource{
    
    private var categories:[ICategory]
    
    required init(categories:[ICategory]) {
        self.categories = categories
    }
    
    //MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let category:ICategory = self.categories[indexPath.row]
        let cell:ICatalogCategoriesCell = (collectionView as! AICollectionView).dequeueCellLoadNibIfNeed(type: CatalogCategoriesCell.self, indexPath: indexPath) as! ICatalogCategoriesCell
        cell.set(category:category)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let category:ICategory = self.categories[indexPath.row]
        //self.delegate?.didSelect(item: category as AnyObject)
    }
}

final private class PostsDataSource : NSObject, UICollectionViewDataSource{
    
    private var posts:[IPost]
    
    required init(posts:[IPost]) {
        self.posts = posts
    }
    
    //MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let post:IPost = self.posts[indexPath.row]
        let cell:ICatalogPostCell = (collectionView as! AICollectionView).dequeueCellLoadNibIfNeed(type: CatalogPostCell.self, indexPath: indexPath) as! ICatalogPostCell
        cell.set(post: post)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // let post:IPost = self.posts[indexPath.row]
        //self.delegate?.didSelect(item: post as AnyObject)
    }
}
