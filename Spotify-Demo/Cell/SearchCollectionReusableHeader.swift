//
//  SearchCollectionReusableView.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/24.
//

import UIKit

class SearchCollectionReusableHeader: UICollectionReusableView {
    
    
    //MARK: - Properties
    
    static let identifier = "searchCollectionReusableHeader"
    
    //MARK: - IBOutlets
    
    public let searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("Please enter artist or song", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.contentHorizontalAlignment = .left
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .black
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.backgroundColor = .white
        return button
    }()
    

    
    //MARK: - Init
    
    public func configure() {
        addSubview(searchButton)
        setLayouts()
    }
    
    //MARK: - Set Layouts
    
    func setLayouts() {
        searchButton.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(+8)
            make.right.equalTo(self).offset(-8)
            make.centerY.equalTo(self)
            make.height.equalTo(self).offset(-20)
        }
    }
    
}
