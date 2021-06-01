//
//  ArtistProfile.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/31.
//

import UIKit

class ArtistProfileView: UIView {

    //MARK: - IBOutlets
    
    var myCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = .zero
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20)
        layout.minimumInteritemSpacing = 5
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(ArtistProfileCell.self, forCellWithReuseIdentifier: ArtistProfileCell.identifier)
        cv.register(RelatedArtistCell.self, forCellWithReuseIdentifier: RelatedArtistCell.identifier)
        cv.register(ArtistProfileReusableViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ArtistProfileReusableViewHeader.identifier)
        
        return cv
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Set Subviews
    
    func setSubviews() {
        self.addSubview(myCollectionView)
    }
    
    //MARK: - Set Layouts
    
    func setLayouts() {
        myCollectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
    
}
