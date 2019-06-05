//
//  RecomendedPostCell.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 31/05/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation

class RecomendedPostCell : UICollectionViewCell, IRecomendedPostCell{
 
    @IBOutlet var labelPostName:UILabel!
    
    private var post:IPost!
    
    func set(post:IPost){
        self.post = post
        self.labelPostName.text = self.post.name
    }
    
}
