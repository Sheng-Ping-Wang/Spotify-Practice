//
//  ArtistProfileReusableViewHeader.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/6/1.
//

import UIKit

class ArtistProfileReusableViewHeader: UICollectionReusableView {
    
    //MARK: - Properties
    
    static let identifier = "artistProfileReusableViewHeader"
    
    //MARK: - IBOutlets
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "The Artists You May like"
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont(name: "Kefa", size: 20)
        return label
    }()
    
    //MARK: - Init
    
    func configure() {
        addSubview(titleLabel)
        setLayouts()
    }
    
    //MARK: - Set Layouts
    
    func setLayouts() {
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(+20)
            make.right.equalTo(self).offset(-20)
            make.centerY.height.equalTo(self)
        }
    }
}
