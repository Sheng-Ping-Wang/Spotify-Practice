//
//  CategoryView.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/28.
//

import UIKit

class CategoryView: UIView {

    //MARK: - IBOutlets
    
    var categoryCollectionView: UICollectionView = {
        let fullSize = UIScreen.main.bounds
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: fullSize.width/2 - 20, height: 150)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        cv.backgroundColor = .clear
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .defaultColor()
        setSubviews()
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Set Subviews
    
    func setSubviews() {
        self.addSubview(categoryCollectionView)
    }
    
    //MARK: - Set Layouts

    func setLayouts() {
        categoryCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.topMargin)
            make.bottom.equalTo(self.snp.bottomMargin)
            make.width.equalTo(self)
        }
    }
    
}
