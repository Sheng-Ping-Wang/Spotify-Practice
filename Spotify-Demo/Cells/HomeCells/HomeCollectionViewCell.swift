//
//  HomeCollectionViewCell.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/21.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    
    //MARK: - Properties
    
    static let identifier = "HomeCollectionViewCell"
    
    //MARK: - IBOutlets
    
    var myImageView: GetImageView = {
        var image = GetImageView()
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        return image
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.myImageView.image = nil
    }
    
    //MARK: - Set Subviews
    
    func setSubviews() {
        contentView.addSubview(myImageView)
    }
    
    //MARK: - Set Layouts
    
    func setLayouts() {
        myImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
    
}
