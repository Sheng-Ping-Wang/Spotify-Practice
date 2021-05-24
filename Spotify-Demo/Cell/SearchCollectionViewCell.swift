//
//  SearchCollectionViewCell.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/24.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    static let identifier = "searchCollectionViewCell"
    
    //MARK: - IBOutlets
    
    let myLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var myImageView: GetImageView = {
        let iv = GetImageView()
        iv.layer.cornerRadius = 10
        iv.clipsToBounds = true
        iv.backgroundColor = .clear
        iv.addSubview(myLabel)
        return iv
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubViews()
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Set Subviews
    
    func setSubViews() {
        contentView.addSubview(myImageView)
    }
    
    //MARK: - Set Layouts
    
    func setLayouts() {
        myImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(contentView)
        }
        
        myLabel.snp.makeConstraints { (make) in
            make.centerX.width.equalTo(myImageView)
            make.height.equalTo(30)
            make.bottom.equalTo(myImageView).offset(-8)
        }
        
    }
    
}
