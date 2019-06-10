//
//  CatalogController.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 10/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

class CatalogController : UIViewController{
    
    //MARK: - Dependence
    var cake:ICatalogCake = Dependence.tryInject()!
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Каталог"
    }
}
