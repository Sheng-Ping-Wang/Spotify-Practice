//
//  LibraryTableViewCell.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/26.
//

import UIKit

class LibraryTableViewCell: UITableViewCell {

    //MARK: - Properties
    
    static let identifier = "libraryTableViewCell"
    
    //MARK: - IBOutlets
    
    let myImageView: GetImageView = {
        let iv = GetImageView()
        iv.layer.cornerRadius = 10
        iv.clipsToBounds = true
        return iv
    }()
    
    let playListNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "Kefa", size: 20)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.textAlignment = .left
        label.font = UIFont(name: "Kefa", size: 20)
        label.text = "Playlist"
        return label
    }()
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        setSubviews()
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Set Subviews
    
    func setSubviews() {
        contentView.addSubview(myImageView)
        contentView.addSubview(playListNameLabel)
        contentView.addSubview(descriptionLabel)
    }
    
    //MARK: - Set Layouts
    
    func setLayouts() {
        myImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(+3)
            make.bottom.equalTo(self).offset(-3)
            make.left.equalTo(self).offset(+10)
            make.height.equalTo(myImageView.snp.width)
        }
        
        playListNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(myImageView.snp.right).offset(+5)
            make.bottom.equalTo(myImageView.snp.centerY).offset(-3)
            make.right.equalTo(self).offset(-5)
            make.height.equalTo(30)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.left.equalTo(myImageView.snp.right).offset(+5)
            make.top.equalTo(myImageView.snp.centerY).offset(+3)
            make.right.equalTo(self).offset(-5)
            make.height.equalTo(30)
        }
        
    }

}
