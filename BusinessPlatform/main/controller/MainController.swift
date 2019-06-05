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
    @IBOutlet var tableView:UITableView!
    
    //MARK: DataSources
    private var dataSourceMainTable:IMainTableDataSource!
    

    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Главный"
        self.cake.router.setOwnwer(ownwer: self)
        self.applyDesign()
        
        
        self.prepareDataMainTable(completion: {  [weak self] in
            self?.tableView.reloadData()
        })

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    //MARK: - data source
    private func prepareDataMainTable(completion:@escaping ()->()){
        
        self.cake.director.buildMainTableDataSource { [weak self](dataSource) in
            self?.dataSourceMainTable = dataSource
            self?.tableView.dataSource = dataSource
            self?.tableView.delegate = dataSource
            completion()
        }
    }
    
  
    
//    //MARK:- IFilterCategoryDelegate
//    func didSelect(category: ICategory) {
//        print(category.name)
//    }
}

