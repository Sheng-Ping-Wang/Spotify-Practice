//
//  HomeView.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/20.
//

import UIKit

class HomeView: UIView {

    //MARK: - IBOutlets
    
    let homeTableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .insetGrouped)
        tv.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        tv.backgroundColor = .clear
        return tv
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
    
    //MARK: - Add Subviews
    
    func setSubviews() {
        self.addSubview(homeTableView)
    }
    
    //MARK: - Set Layouts

    func setLayouts() {
        homeTableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.topMargin)
            make.bottom.equalTo(self.snp.bottomMargin)
            make.centerX.width.equalTo(self)
        }
        
    }
    
}
