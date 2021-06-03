//
//  ProfileView.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/20.
//

import UIKit

class ProfileView: UIView {

    //MARK: - IBOutlets
    
    let profileImageView: GetImageView = {
        let imageView = GetImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 60
        return imageView
    }()
    
    let followersNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Arial Bold", size: 20)
        return label
    }()
    
    let followersLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Kefa", size: 20)
        label.text = "Followers"
        return label
    }()
    
    lazy var myStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [followersNumberLabel, followersLabel])
        sv.axis = .vertical
        sv.distribution = .equalSpacing
        return sv
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "Arial Bold", size: 20)
        return label
    }()
    
    let countryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "Arial Bold", size: 20)
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "Arial Bold", size: 20)
        return label
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.defaultColor()
        setSubviews()
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Set Subviews
    
    func setSubviews() {
        self.addSubview(profileImageView)
        self.addSubview(myStackView)
        self.addSubview(userNameLabel)
        self.addSubview(countryLabel)
        self.addSubview(emailLabel)
    }
    
    //MARK: - Set Layouts

    func setLayouts() {
        profileImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.topMargin).offset(+20)
            make.left.equalTo(self).offset(+8)
            make.width.height.equalTo(120)
        }
        
        followersNumberLabel.snp.makeConstraints { (make) in
            make.centerX.top.width.equalTo(myStackView)
            make.height.equalTo(myStackView.snp.height).dividedBy(2)
        }
        
        followersLabel.snp.makeConstraints { (make) in
            make.centerX.width.equalTo(myStackView)
            make.top.equalTo(followersNumberLabel.snp.bottom)
            make.height.equalTo(myStackView.snp.height).dividedBy(2)
        }
        
        myStackView.snp.makeConstraints { (make) in
            make.left.equalTo(profileImageView.snp.right).offset(+10)
            make.right.equalTo(self.snp.right).offset(-10)
            make.centerY.equalTo(profileImageView)
//            make.width.equalTo(200)
            make.height.equalTo(80)
        }
        
        userNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(profileImageView)
            make.top.equalTo(profileImageView.snp.bottom).offset(+80)
            make.width.equalTo(self)
            make.height.equalTo(30)
        }
        
        countryLabel.snp.makeConstraints { (make) in
            make.left.equalTo(profileImageView)
            make.top.equalTo(userNameLabel.snp.bottom).offset(+20)
            make.width.equalTo(self)
            make.height.equalTo(30)
        }
        
        emailLabel.snp.makeConstraints { (make) in
            make.left.equalTo(profileImageView)
            make.top.equalTo(countryLabel.snp.bottom).offset(+20)
            make.width.equalTo(self)
            make.height.equalTo(30)
        }
        
    }
    
}
