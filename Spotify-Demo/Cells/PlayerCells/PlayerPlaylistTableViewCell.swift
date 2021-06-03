//
//  PlayerPlaylistTableViewCell.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/26.
//

import UIKit

class PlayerPlaylistTableViewCell: UITableViewCell {

    //MARK: - Properties
    
    static let identifier = "playerPlaylistTableViewCell"
    
    //MARK: - IBOutlets
    
    let myImageView: GetImageView = {
        let iv = GetImageView()
        iv.layer.cornerRadius = 10
        iv.clipsToBounds = true
        return iv
    }()
    
    let songLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Arial Bold", size: 20)
        label.textAlignment = .left
        return label
    }()
    
    let singerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.textAlignment = .left
        return label
    }()
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        setSubviews()
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Set Subviews
    
    func setSubviews() {
        contentView.addSubview(myImageView)
        contentView.addSubview(songLabel)
        contentView.addSubview(singerLabel)
    }
    
    //MARK: - Set Layouts

    func setLayouts() {
        myImageView.snp.makeConstraints { (make) in
            make.left.top.equalTo(self).offset(+8)
            make.bottom.equalTo(self).offset(-8)
            make.width.equalTo(72)
        }
        
        songLabel.snp.makeConstraints { (make) in
            make.left.equalTo(myImageView.snp.right).offset(+8)
            make.right.equalTo(self).offset(-8)
            make.bottom.equalTo(myImageView.snp.centerY).offset(-1)
            make.height.equalTo(30)
        }
        
        singerLabel.snp.makeConstraints { (make) in
            make.left.equalTo(songLabel)
            make.right.equalTo(songLabel)
            make.top.equalTo(myImageView.snp.centerY).offset(+1)
            make.height.equalTo(songLabel)
        }
    }

}
