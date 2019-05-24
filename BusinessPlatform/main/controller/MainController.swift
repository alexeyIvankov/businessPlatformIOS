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
   
    //MARK: Outlets
    @IBOutlet var tableView:UITableView!
    
    lazy var filterCategoryView = FilterCategoryView.build()
    
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
        
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
    }
    
    //MARK: - data source
    func loadAndConfigureCategories(){
        
        self.cake.director.serviceCategory.loadAllCategories { (categoriesDataSource) in
            self.filterCategoryView.set(dataSource: categoriesDataSource)
            self.filterCategoryView.set(sizeCell: CGSize(width: 100, height: 100))
            self.filterCategoryView.reloadData()
        }
    }
}

