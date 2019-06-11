//
//  NewsDirector.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 10/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation

class NewsDirector : INewsDirector {
    
    func loadNews(completion:@escaping ([INews])->()){
        
        var newsContainer:[INews] = []
        
        for i in 0...50{
            
            let news:INews = News(title: "news \(i)", body: "body \(i)")
            newsContainer.append(news)
        }
        
        completion(newsContainer)
    }
}
