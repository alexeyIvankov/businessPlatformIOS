//
//  RootController+Design.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 10/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

extension RootController{
    
    func applyDesign(){
        self.configureTabBar()
    }
    
    private func configureTabBar(){
        
        for (_,vc) in self.viewControllers!.enumerated(){
            if let navigationVC:UINavigationController = vc as? UINavigationController{
                for (_,currentVC) in navigationVC.viewControllers.enumerated(){
                    
                    if currentVC is MoreController{
                        currentVC.title = "Еще"
                        //                        currentVC.tabBarItem.image =  UIImage(named: "people_icon_deselect")?.withRenderingMode(.alwaysOriginal)
                        //                        currentVC.tabBarItem.selectedImage = UIImage(named: "people_icon_select")?.withRenderingMode(.alwaysOriginal)
                    }
                    else if currentVC is MainController{
                        currentVC.title = "Главный"
                    }
                    else if currentVC is NewsController{
                        currentVC.title = "Новости"
                    }
                    else if currentVC is CatalogController{
                        currentVC.title = "Каталог"
                    }
                }
            }
        }
    }
}
