//
//  MainCollectionViewDataSource.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 21/05/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

class MainTableDataSource : NSObject, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
