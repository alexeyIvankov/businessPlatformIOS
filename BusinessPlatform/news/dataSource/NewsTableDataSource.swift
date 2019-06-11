//
//  NewsTableDataSource.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 11/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation

class NewsTableDataSource : NSObject, INewsTableDataSource{

    private var news:[INews]
    
    required init(news:[INews]){
        self.news = news
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let new:INews = self.news[indexPath.row]
        let cell:INewsCell = (tableView as! AITableView).dequeueCellLoadNibIfNeed(type: NewsCell.self, indexPath: indexPath) as! INewsCell
        cell.set(news: new)
        
        return cell
    }
}
