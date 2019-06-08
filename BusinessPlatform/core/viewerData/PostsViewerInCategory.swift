//
//  PostsViewerInCategory.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 08/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation

class PostViewerInCategory : UIViewController, IPostsViewerInCategory{
    
    private var categoriesCollection:ICollectionData!
    private var postsCollection:ICollectionData!

    private var stackView:UIStackView!
    private var scrollView:UIScrollView!
    
    private var heightCategoriesConstraint:NSLayoutConstraint!
    private var heightPostsConstraint:NSLayoutConstraint!
    
    private var categories:[ICategory]!
    
    required init(typeCellCategory:UICollectionViewCell.Type,
         typeCellPost:UICollectionViewCell.Type){
         super.init(nibName: nil, bundle: nil)

        self.scrollView = UIScrollView(frame: UIScreen.main.bounds)
        self.stackView = UIStackView(frame: UIScreen.main.bounds)
        self.categoriesCollection = CategoriesCollection(layout: self.buildCategoriesLayout(), cellType: typeCellCategory)
        self.postsCollection = PostCollection(layout: self.buildPostsLayout(), cellType: typeCellPost)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle
    override func loadView() {
        self.view = self.scrollView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }
    
    private func configureUI(){
        
        self.scrollView.backgroundColor = UIColor.red
        self.postsCollection.view.backgroundColor = UIColor.blue
        self.categoriesCollection.view.backgroundColor = UIColor.gray
        
        self.scrollView.translatesAutoresizingMaskIntoConstraints = true
        self.stackView.translatesAutoresizingMaskIntoConstraints = true
        self.postsCollection.view.translatesAutoresizingMaskIntoConstraints = true
        self.categoriesCollection.view.translatesAutoresizingMaskIntoConstraints = true
        
        self.scrollView.autoresizingMask = [
            UIView.AutoresizingMask.flexibleWidth,
            UIView.AutoresizingMask.flexibleHeight]
        
        self.stackView.autoresizingMask = [
            UIView.AutoresizingMask.flexibleWidth,
            UIView.AutoresizingMask.flexibleHeight]
        
        self.categoriesCollection.view.autoresizingMask = [UIView.AutoresizingMask.flexibleRightMargin,
                                                           UIView.AutoresizingMask.flexibleLeftMargin,
                                                           UIView.AutoresizingMask.flexibleTopMargin,
                                                           UIView.AutoresizingMask.flexibleBottomMargin,
                                                           UIView.AutoresizingMask.flexibleWidth,
                                                           UIView.AutoresizingMask.flexibleHeight]
        
        
        self.stackView.frame = self.scrollView.bounds
        self.scrollView.addSubview(self.stackView)
    
        
        self.categoriesCollection.view.frame = self.stackView.bounds
        self.categoriesCollection.view.frame.height = 150
        self.stackView.addSubview(self.categoriesCollection.view)
        
        self.postsCollection.view.frame = self.stackView.bounds
        self.postsCollection.view.frame.origin.y = self.categoriesCollection.view.frame.origin.y + self.categoriesCollection.view.frame.height  + 20
        
        self.scrollView.contentSize.height = 5000
        self.postsCollection.view.frame.size.height = 5000
        
        self.stackView.addSubview(self.postsCollection.view)
    }
    
    
    private func buildCategoriesLayout() -> UICollectionViewFlowLayout{
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = CGSize(width: 100, height: 100)
        // l.minimumInteritemSpacing = 30
        return layout
    }
    
    private func buildPostsLayout() -> UICollectionViewFlowLayout{
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = CGSize(width: 100, height: 100)
        // l.minimumInteritemSpacing = 30
        return layout
    }
    
    func set(categories:[ICategory]){
        self.categories = categories
        self.categoriesCollection.set(models: self.categories)
    }

    func reloadData(completion:@escaping ()->()){
        self.categoriesCollection.reloadData {
            completion()
        }
    }

}
