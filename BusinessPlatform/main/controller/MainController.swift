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
   
    //MARK: Dependence
    var cake:IMainCake = Dependence.tryInject()!
    
    //MARK: Outlets
    @IBOutlet var viewPostsViewer:UIView!
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Главный"
        self.cake.router.setOwnwer(ownwer: self)
        self.applyDesign()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
//    private func configurePostViewer(){
//
//        self.cake.director.postsViewer.configure(configurator: self)
//        self.cake.director.postsViewer.view.frame = self.viewPostsViewer.bounds
//        self.viewPostsViewer.addSubview(self.cake.director.postsViewer.view)
//    }
//
//    private func loadData(){
//
//        self.cake.director.loadData { [weak self](categories) in
//            self?.cake.director.postsViewer.set(categories: categories)
//            self?.cake.director.postsViewer.reloadAll {
//
//            }
//        }
//    }
    
}

