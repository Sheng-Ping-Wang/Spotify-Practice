//
//  PlayerView.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/25.
//

import UIKit

class PlayerView: UIView {

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
        let image = UIImage(systemName: "pause.circle", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    lazy var previousBtn: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "chevron.left", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    lazy var nextBtn: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "chevron.right", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        setSubvies()
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Set Subviews
    
    func setSubvies() {
        self.addSubview(myImageView)
        self.addSubview(songLabel)
        self.addSubview(singerLabel)
        self.addSubview(slider)
        self.addSubview(pausePlayBtn)
        self.addSubview(previousBtn)
        self.addSubview(nextBtn)
    }
    
    //MARK: - Set Layouts
    
    func setLayouts() {
        myImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(+20)
            make.right.equalTo(self).offset(-20)
            make.top.equalTo(self).offset(+100)
            make.height.equalTo(self.snp.width).multipliedBy(0.8)
//            make.width.height.equalTo(self.snp.width).multipliedBy(0.8)
        }
        
        songLabel.snp.makeConstraints { (make) in
            make.top.equalTo(myImageView.snp.bottom).offset(+10)
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
            make.top.equalTo(slider.snp.bottom).offset(+20)
            make.centerX.equalTo(self)
            make.width.height.equalTo(50)
        }
        
        previousBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(pausePlayBtn)
            make.right.equalTo(pausePlayBtn.snp.left).offset(-50)
            make.width.height.equalTo(50)
        }
        
        nextBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(pausePlayBtn)
            make.left.equalTo(pausePlayBtn.snp.right).offset(+50)
            make.width.height.equalTo(50)
        }
        
        
    }
}
