//
//  NewCell.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 11/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation

class NewsCell : UITableViewCell,  INewsCell{
    
    //MARK: Outlets
    @IBOutlet var labelNewsTitle:UILabel!
    @IBOutlet var labelNewsBody:UILabel!
    
    
    private var news:INews!
    
    func set(news:INews){
        self.news = news
        self.labelNewsTitle.text = self.news.title
        self.labelNewsBody.text = self.news.body
    }
}
