//
//  LoginController.swift
//  IMH_BI
//
//  Created by Alexey Ivankov on 24.08.2018.
//  Copyright © 2018 Industrial Metallurgical Holding. All rights reserved.
//

import Foundation
import UIKit
import WebKit
import KeyboardHandler

class MainController : UIViewController{
    
    //MARK: Dependence
    var cake:IMainCake = Depednence.tryInject()!
    
    //MARK: Outlets
    @IBOutlet var viewPostsViewer:UIView!
  
//    //MARK: Outlets
//    @IBOutlet var viewCategories:UIView!
//    @IBOutlet var viewPosts:UIView!
//    @IBOutlet var stackView:UIStackView!
//    @IBOutlet var heightViewPostsConstraint:NSLayoutConstraint!
//
//    //MARK: Controllers
//    private var categoriesController:ICollectionData!
//    private var postsController:ICollectionData!
    
    private var postsViewer:IPostsViewerInCategory!
    

    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Главный"
        self.cake.router.setOwnwer(ownwer: self)
        self.applyDesign()
        
        var posts:[IPost] = []
        
        for i in 1...20{
            posts.append(Post(name: "post \(i)"))
        }
        
        var categories:[ICategory] = []
        
        for i in 1...20{
            categories.append(Category(name: "category \(i)"))
        }
        
        self.postsViewer = PostViewerInCategory(typeCellCategory: CategoriesCell.self, typeCellPost: RecomendedPostCell.self)
        self.postsViewer.view.frame = self.viewPostsViewer.bounds
        self.viewPostsViewer.addSubview(self.postsViewer.view)
        self.viewPostsViewer.createConstraintsResize(view: self.postsViewer.view)
        
        self.postsViewer.set(categories: categories)
        self.postsViewer.reloadData {
            
        }
        
//        let l = UICollectionViewFlowLayout()
//        l.scrollDirection = .horizontal
//        l.estimatedItemSize = CGSize(width: 100, height: 100)
//       // l.minimumInteritemSpacing = 30
//
//        self.categoriesController = CategoriesCollection(layout: l, cellType: CategoriesCell.self)
//        self.categoriesController.set(models: categories)
//        self.categoriesController.view.frame = self.viewCategories.bounds
//        self.viewCategories.addSubview(self.categoriesController.view)
//        //self.categoriesController.set(enableScroll: false)
//        self.categoriesController.reloadData {
//
//        }
//
//        let l2 = UICollectionViewFlowLayout()
//        l2.scrollDirection = .vertical
//        l2.estimatedItemSize = CGSize(width: 200, height: 300)
//        l2.minimumInteritemSpacing = 10
//
//        self.postsController = PostCollection(layout: l2, cellType: RecomendedPostCell.self)
//        self.postsController.set(models: posts)
//        self.postsController.view.frame = self.viewPosts.bounds
//        self.viewPosts.addSubview(self.postsController.view)
//        self.postsController.set(enableScroll: false)
//        self.postsController.reloadData {
//            self.heightViewPostsConstraint.constant = self.postsController.contentSize().height
//
//        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    

}

