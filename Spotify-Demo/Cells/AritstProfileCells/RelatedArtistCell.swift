//
//  RelatedArtistTableViewCell.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/31.
//

import UIKit

class RelatedArtistCell: UICollectionViewCell {

    //MARK: - Properties
    
    static let identifier = "relatedArtistTableViewCell"
    
    //MARK: - IBOutlets
    
    var myImageView: GetImageView = {
        let iv = GetImageView()
        iv.layer.cornerRadius = 20
        iv.clipsToBounds = true
        return iv
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
    }
    
    //MARK: - Set Layouts
    
    func setLayouts() {
        myImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
}
