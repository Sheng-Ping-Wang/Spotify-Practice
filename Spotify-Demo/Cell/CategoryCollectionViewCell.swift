//
//  CategoryCollectionViewCell.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/28.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    static let identifier = "categoryCollectionViewCell"
    
    //MARK: - IBOutlets
    
    lazy var myImageView: GetImageView = {
        let iv = GetImageView()
        iv.layer.cornerRadius = 10
        iv.clipsToBounds = true
        iv.backgroundColor = .clear
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myImageView.image = nil
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
        
    }
    
}
