//
//  ArtistProfileCell.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/31.
//

import UIKit

class ArtistProfileCell: UICollectionViewCell {

    //MARK: - Properties
    
    static let identifier = "artistProfileCell"
    
    //MARK: - IBOutlets
    
    let myImageView: GetImageView = {
        let iv = GetImageView()
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont(name: "Kefa", size: 20)
        return label
    }()
    
    let genreLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont(name: "Kefa", size: 20)
        return label
    }()
    
    let followersLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont(name: "Kefa", size: 20)
        return label
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
        contentView.addSubview(myImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(genreLabel)
        contentView.addSubview(followersLabel)
    }
    
    //MARK: - Set Layouts

    func setLayouts() {
        myImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(+20)
            make.width.height.equalTo(self.snp.width).multipliedBy(0.8)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.left.width.equalTo(myImageView)
            make.top.equalTo(myImageView.snp.bottom).offset(+8)
            make.height.equalTo(30)
        }
        
        genreLabel.snp.makeConstraints { (make) in
            make.left.width.height.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(+8)
        }
        
        followersLabel.snp.makeConstraints { (make) in
            make.left.width.height.equalTo(genreLabel)
            make.top.equalTo(genreLabel.snp.bottom).offset(+8)
        }
        
    }
    
}


