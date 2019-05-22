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
    
    //MARK: Dependence
    var cake:IMainCake = Depednence.tryInject()!
    
    //MARK:
   
    

    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Главный"
        self.cake.router.setOwnwer(ownwer: self)
        self.cake.design.apply(vc: self)
        self.configureTableViewAndComponents()
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    //MARK: - config ui components
    private func configureTableViewAndComponents(){
        self.tableView.tableHeaderView = FilterCategoryView.build()
        
//        self.tableView.estimatedRowHeight = UIScreen.main.bounds.size.height
//        self.tableView.rowHeight = UITableView.automaticDimension
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
    }
    
    //MARK: - data source
    private func createDataSource() -> [UITableViewCell]{
        
        let accountCell = Bundle.main.loadNibNamed("AccountMoreCell", owner: nil, options: nil)?.first as! AccountMoreCell
         let emailCell = Bundle.main.loadNibNamed("EmailMoreCell", owner: nil, options: nil)?.first as! EmailMoreCell
         let locationCell = Bundle.main.loadNibNamed("LocationMoreCell", owner: nil, options: nil)?.first as! LocationMoreCell
         let privacyPhoneCell = Bundle.main.loadNibNamed("PrivacyPhoneMoreCell", owner: nil, options: nil)?.first as! PrivacyPhoneMoreCell
         let subdivisionCell = Bundle.main.loadNibNamed("SubdivisionMoreCell", owner: nil, options: nil)?.first as! SubdivisionMoreCell
         let workPhoneCell = Bundle.main.loadNibNamed("WorkPhoneMoreCell", owner: nil, options: nil)?.first as! WorkPhoneMoreCell
        
        return [accountCell,subdivisionCell, workPhoneCell,privacyPhoneCell,  emailCell, locationCell, ]
    }
}

