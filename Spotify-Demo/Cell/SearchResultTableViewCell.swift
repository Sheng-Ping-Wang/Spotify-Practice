//
//  SearchResultTableViewCell.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/24.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {

    //MARK: - Properties
    
    static let identifier = "searchResultTableViewCell"
    
    //MARK: - IBOutlets
    
    let myImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .orange
        iv.layer.cornerRadius = 10
        return iv
    }()
    
    let songLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.backgroundColor = .brown
        return label
    }()
    
    let singerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.backgroundColor = .brown
        return label
    }()
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
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
            make.width.equalTo(100)
        }
        
        songLabel.snp.makeConstraints { (make) in
            make.left.equalTo(myImageView.snp.right).offset(+8)
            make.bottom.equalTo(myImageView.snp.centerY).offset(-1)
            make.height.equalTo(30)
            make.width.equalTo(250)
        }
        
        singerLabel.snp.makeConstraints { (make) in
            make.left.equalTo(songLabel)
            make.top.equalTo(myImageView.snp.centerY).offset(+1)
            make.height.width.equalTo(songLabel)
        }
    }
}
