//
//  CategoriesCell.swift
//  BusinessPlatform
//
//  Created by Alexey Ivankov on 21/05/2019.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit

class FilterCategoryView : UITableViewCell, IFilterCategoryView, UICollectionViewDelegate{

    @IBOutlet var collectionView:AICollectionView!
    
    var delegate: IFilterCategoryDelegate?
    
    private var _dataSource: IFilterCategoryDataSource!
    private var _sizeCell:CGSize = CGSize(width: 100, height: 100)
    private var _minimumLineSpacing:CGFloat = 25
    
    static func build()-> FilterCategoryView{
       
        let v:FilterCategoryView = Bundle.loadView(fromNib: "FilterCategoryView",
                                                   withType: FilterCategoryView.self)
        return v
    }
    
    override func awakeFromNib() {
        self.collectionView.dataSource = _dataSource
        self.collectionView.delegate = self
        configureLayoutIfFlowLayout()
    }
    
    func set(dataSource:IFilterCategoryDataSource){
        _dataSource = dataSource
        self.collectionView.dataSource = _dataSource
    }
    
    func set(sizeCell: CGSize) {
        _sizeCell = sizeCell
        configureLayoutIfFlowLayout()
    }
    
    func set(minSpacing: CGFloat) {
        _minimumLineSpacing = minSpacing
        configureLayoutIfFlowLayout()
    }
    
    func reloadData(){
        self.collectionView.reloadData()
    }
    
    private func configureLayoutIfFlowLayout(){
        if let collectionViewFlowLayout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            collectionViewFlowLayout.estimatedItemSize = _sizeCell
            collectionViewFlowLayout.minimumLineSpacing = _minimumLineSpacing
            collectionViewFlowLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
            collectionViewFlowLayout.invalidateLayout()
            self.collectionView.layoutSubviews()
        }
    }
    
    //MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        let category = _dataSource.getCategory(indexPath: indexPath)
        assert(category != nil)
        self.delegate?.didSelect(category: category!)
    }
}

protocol ICategoryCollectionCell {
    func set(category:ICategory)
}

class CategoryCollectionCell : UICollectionViewCell, ICategoryCollectionCell {
    
    @IBOutlet var labelCategoryName:UILabel!
    
    private var category:ICategory!
    
    func set(category: ICategory) {
        self.category = category
        self.labelCategoryName.text = self.category.name
    }
}
