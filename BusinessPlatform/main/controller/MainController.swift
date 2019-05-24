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

class MainController : UIViewController, IFilterCategoryDelegate{
  
    //MARK: Outlets
    @IBOutlet var tableView:UITableView!
    
    lazy var filterCategoryView = { () -> FilterCategoryView in
        let v = FilterCategoryView.build()
        v.delegate = self
        return v
    }()
    
    //MARK: Dependence
    var cake:IMainCake = Depednence.tryInject()!
    
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Главный"
        self.cake.router.setOwnwer(ownwer: self)
        self.cake.design.apply(vc: self)
        
        self.configureTableViewAndComponents()
        self.loadAndConfigureCategories()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    //MARK: - config ui components
    private func configureTableViewAndComponents(){
        self.tableView.tableHeaderView = self.filterCategoryView
        self.tableView.estimatedRowHeight = UIScreen.main.bounds.size.height
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
    //MARK: - data source
    func loadAndConfigureCategories(){
        
        self.cake.director.serviceCategory.loadAllCategories { (categoriesDataSource) in
            self.filterCategoryView.set(dataSource: categoriesDataSource)
            self.filterCategoryView.set(sizeCell: CGSize(width: 100, height: 100))
            self.filterCategoryView.reloadData()
        }
    }
    
    //MARK:- IFilterCategoryDelegate
    func didSelect(category: ICategory) {
        print(category.name)
    }
}

