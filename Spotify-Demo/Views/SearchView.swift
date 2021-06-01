//
//  SearchView.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/20.
//

import UIKit

class SearchView: UIView {

    //MARK: - IBOutlets
    
    var searchCollectionView: UICollectionView = {
        let fullSize = UIScreen.main.bounds
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: fullSize.width/2 - 20, height: 150)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
//        layout.minimumLineSpacing = 15
        layout.headerReferenceSize = CGSize(width: fullSize.width, height: 60)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
        cv.register(SearchCollectionReusableHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SearchCollectionReusableHeader.identifier)
        cv.backgroundColor = .clear
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.defaultColor()
        setSubviews()
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Add Subviews
    
    func setSubviews() {
        self.addSubview(searchCollectionView)
    }
    
    //MARK: - Set Layouts

    func setLayouts() {
        searchCollectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        
        
    }
    
}
