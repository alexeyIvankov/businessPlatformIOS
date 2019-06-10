//
//  CategoriesController.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 07/06/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

class CategoriesCollection : UIViewController, ICategoriesCollection, UICollectionViewDataSource, UICollectionViewDelegate{
    var delegate: ICollectionDataDelegate?
    
    
    private var collectionView:AICollectionView!{
        get{
            return self.view as? AICollectionView
        }
    }
    private var layout:UICollectionViewLayout!
    private var cellType:UICollectionViewCell.Type!
    private var isEnableScroll:Bool = true
    private var categories:[ICategory] = []
    
    
    required init(layout:UICollectionViewLayout,
                  cellType:UICollectionViewCell.Type){
        super.init(nibName: nil, bundle: nil)
        self.layout = layout
        self.cellType = cellType
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = self.buildAndConfigCollectionView()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    private func buildAndConfigCollectionView()-> AICollectionView{
        
        let collectionView = AICollectionView(frame:CGRect.zero, collectionViewLayout: self.layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = true

        collectionView.autoresizingMask = [UIView.AutoresizingMask.flexibleRightMargin,
                                                UIView.AutoresizingMask.flexibleLeftMargin,
                                                UIView.AutoresizingMask.flexibleTopMargin,
                                                UIView.AutoresizingMask.flexibleBottomMargin,
                                                UIView.AutoresizingMask.flexibleWidth,
                                                UIView.AutoresizingMask.flexibleHeight]
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isScrollEnabled = self.isEnableScroll
        
        return collectionView
    }
    
    //MARK: - IPostController
    
    func set<T>(models: [T]) {
        self.categories = models as! [ICategory]
    }

    
    public func reloadData(completion: @escaping ()->()){
        self.collectionView.reloadData {
            completion()
        }
    }
    
    func clearData(completion: @escaping () -> ()) {
        
        self.categories.removeAll()
        self.collectionView.reloadData {
            completion()
        }
    }
    
    func set(enableScroll:Bool){
        self.isEnableScroll = enableScroll
    }
    
    func contentSize() -> CGSize{
        return self.collectionView.contentSize
    }
    
    //MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let category:ICategory = self.categories[indexPath.row]
        let cell:ICategoryCell = (collectionView as! AICollectionView).dequeueCellLoadNibIfNeed(type: self.cellType, indexPath: indexPath) as! ICategoryCell
        cell.set(category:category)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category:ICategory = self.categories[indexPath.row]
        self.delegate?.didSelect(item: category as AnyObject)
    }
}
