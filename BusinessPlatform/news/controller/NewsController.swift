//
//  NewsController.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 10/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

class NewsController : UIViewController{

    //MARK:- Dependence
    var cake:INewsCake = Dependence.tryInject()!
    
    //MARK:- Outlets
    @IBOutlet var tableViewNews:AITableView!
    
    private var dataSourceNews:INewsTableDataSource!
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Новости"
        self.prepareAndShowData()
    }
    
    private func prepareAndShowData(){
        
        self.cake.director.loadNews { [weak self](news) in
            
            self?.dataSourceNews = NewsTableDataSource(news: news)
            self?.tableViewNews.dataSource = self?.dataSourceNews
            
            self?.tableViewNews.reloadData {
                
            }
        }
    }
    
    private func configureTableView(){
        self.tableViewNews.estimatedRowHeight = UIScreen.main.bounds.size.height
        self.tableViewNews.rowHeight = UITableView.automaticDimension
    }
    
}
