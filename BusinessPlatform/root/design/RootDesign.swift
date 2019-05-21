//
//  RootDesign.swift
//  imh_corp_ios
//
//  Created by Alexey Ivankov on 27/11/2018.
//  Copyright © 2018 Industrial Metallurgical Holding. All rights reserved.
//

import Foundation
import UIKit

class RootDesign : IRootDesign{
    
    private var rootVC:RootController!
    
    required init(appDesign: IAppDesign) {
        
    }
    
    func apply<T>(vc: T) where T : UIViewController {
        
        guard let rootVC = vc as? RootController else {
            return
        }
        self.rootVC = rootVC
        self.configureTabBar()
    }
    
    private func configureTabBar(){
        
        for (_,vc) in self.rootVC!.viewControllers!.enumerated(){
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
                }
            }
        }
    }
}
