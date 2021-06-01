//
//  PlayerTableViewCell.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/26.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    static let identifier = "playerTableViewCell"
    var pausePlayBtnDidTap: (() -> Void)?
    var sliderDidTouch: (() -> Void)?
    
    //MARK: - IBOutlets
    
    let myImageView: GetImageView = {
        let iv = GetImageView()
        return iv
    }()
    
    let songLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Arial Bold", size: 25)
        label.textColor = .white
        return label
    }()
    
    let singerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .lightGray
        return label
    }()
    
    let slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.value = 0.5
        return slider
    }()
    
    let config = UIImage.SymbolConfiguration(pointSize: 35, weight: .medium, scale: .default)
    
    lazy var pausePlayBtn: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "pause.fill", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        button.tintColor = .black
        return button
    }()
    
//    lazy var previousBtn: UIButton = {
//        let button = UIButton()
//        let image = UIImage(systemName: "chevron.left", withConfiguration: config)
//        button.setImage(image, for: .normal)
//        button.tintColor = .white
//        return button
//    }()
//
//    lazy var nextBtn: UIButton = {
//        let button = UIButton()
//        let image = UIImage(systemName: "chevron.right", withConfiguration: config)
//        button.setImage(image, for: .normal)
//        button.tintColor = .white
//        return button
//    }()
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        setSubvies()
        setLayouts()
        pausePlayBtn.addTarget(self, action: #selector(pausePlay), for: .touchUpInside)
        slider.addTarget(self, action: #selector(songVolume), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func pausePlay() {
        pausePlayBtnDidTap?()
    }
    
    @objc func songVolume() {
        sliderDidTouch?()
    }
    
    
    //MARK: - Set Subviews
    
    func setSubvies() {
        contentView.addSubview(myImageView)
        contentView.addSubview(songLabel)
        contentView.addSubview(singerLabel)
        contentView.addSubview(slider)
        contentView.addSubview(pausePlayBtn)
//        contentView.addSubview(previousBtn)
//        contentView.addSubview(nextBtn)
    }
    
    //MARK: - Set Layouts
    
    func setLayouts() {
        myImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(+20)
            make.right.equalTo(self).offset(-20)
            make.top.equalTo(self).offset(+50)
            make.height.equalTo(self.snp.width).multipliedBy(0.8)
        }
        
        songLabel.snp.makeConstraints { (make) in
            make.top.equalTo(myImageView.snp.bottom).offset(+50)
            make.left.equalTo(myImageView)
            make.right.equalTo(myImageView)
            make.height.equalTo(30)
        }
        
        singerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(songLabel.snp.bottom).offset(+10)
            make.left.equalTo(myImageView)
            make.right.equalTo(myImageView)
            make.height.equalTo(songLabel)
        }
        
        slider.snp.makeConstraints { (make) in
            make.top.equalTo(singerLabel.snp.bottom).offset(+20)
            make.centerX.equalTo(self)
            make.width.equalTo(singerLabel)
            make.height.equalTo(30)
        }
        
        pausePlayBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(myImageView.snp.bottom)
            make.right.equalTo(myImageView)
            make.width.height.equalTo(60)
        }
        
//        previousBtn.snp.makeConstraints { (make) in
//            make.centerY.equalTo(pausePlayBtn)
//            make.right.equalTo(pausePlayBtn.snp.left).offset(-50)
//            make.width.height.equalTo(50)
//        }
//
//        nextBtn.snp.makeConstraints { (make) in
//            make.centerY.equalTo(pausePlayBtn)
//            make.left.equalTo(pausePlayBtn.snp.right).offset(+50)
//            make.width.height.equalTo(50)
//        }
        
        
    }

}
