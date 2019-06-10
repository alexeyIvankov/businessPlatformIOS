//
//  PostsViewerInCategory.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 08/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation

class PostViewerInCategory : UIViewController, IPostsViewerInCategory, ICollectionDataDelegate{
    
    var configurator: IPostViewerConfigurator!
    
    private var categoriesCollection:ICollectionData!
    private var postsCollection:ICollectionData!

    private var stackView:UIStackView!
    private var scrollView:UIScrollView!
    
    private var categories:[ICategory]!
    
    required init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard self.configurator != nil else {
            fatalError("set configurator please!")
        }
    }
    
    func configure(configurator:IPostViewerConfigurator){
        self.configurator = configurator
        self.build()
        self.configureUI()
    }
    
    func present(view: UIView) {
        self.view.frame = view.bounds
        self.view.addSubview(view)
    }
    
    private func build(){
        
        guard self.configurator != nil else {
            fatalError("set configurator please!")
        }
        
        self.scrollView = UIScrollView(frame: UIScreen.main.bounds)
        self.stackView = UIStackView(frame: UIScreen.main.bounds)
    
        self.categoriesCollection = CategoriesCollection(layout: self.configurator.postsViewerLayouts(postsViewer: self).layoutCategory, cellType: self.configurator.postsViewerTypeCells(postsViewer: self).categoryCell)
        
        self.postsCollection = PostCollection(layout: self.configurator.postsViewerLayouts(postsViewer: self).layoutPost, cellType: self.configurator.postsViewerTypeCells(postsViewer: self).postCell)
        
        self.categoriesCollection.delegate = self
        self.postsCollection.delegate = self
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
        
        self.categoriesCollection.view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth]
        
        self.scrollView.frame = self.view.bounds
        self.view.addSubview(self.scrollView)
        
        self.stackView.frame = self.scrollView.bounds
        self.scrollView.addSubview(self.stackView)
    
        
        self.categoriesCollection.view.frame = self.stackView.bounds
        self.categoriesCollection.view.frame.height = 150
        self.stackView.addSubview(self.categoriesCollection.view)
        
        self.postsCollection.view.frame = self.stackView.bounds
        self.postsCollection.view.frame.origin.y = self.categoriesCollection.view.frame.origin.y + self.categoriesCollection.view.frame.height  + 20
        
        self.scrollView.contentSize.height = 0
        self.postsCollection.view.frame.size.height = 0
        
        self.stackView.addSubview(self.postsCollection.view)
    }
    
    func set(categories:[ICategory]){
        self.categories = categories
        self.categoriesCollection.set(models: self.categories)
    }
    
    func reloadCategories(completion:@escaping ()->()){
        self.categoriesCollection.reloadData {
            completion()
        }
    }
    
    func reloadPosts(completion:@escaping ()->()){
        self.postsCollection.reloadData {
            completion()
        }
    }
    
    func reloadAll(completion:@escaping ()->()){
        self.categoriesCollection.reloadData { [weak self] in
            self?.postsCollection.reloadData {
                completion()
            }
        }
    }

    private func showPosts(category:ICategory){
        
        self.postsCollection.set(models: category.posts)
        self.postsCollection.reloadData {
            self.scrollView.contentSize.height = self.postsCollection.contentSize().height + 200
            self.postsCollection.view.frame.size.height = self.postsCollection.contentSize().height + 200
        }
    }
    
    //MARK: - ICollectionDataDelegate
    func didSelect(item: AnyObject) {
        
        if let category:ICategory = item as? ICategory{
            if category.posts.count > 0{
                self.showPosts(category: category)
            }
        }
    }

}
