//
//  PlayerView.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/25.
//

import UIKit

class PlayerView: UIView {

    //MARK: - IBOutlets
    
    let playerTableView: UITableView = {
        let tv = UITableView()
        tv.register(PlayerTableViewCell.self, forCellReuseIdentifier: PlayerTableViewCell.identifier)
        tv.register(PlayerPlaylistTableViewCell.self, forCellReuseIdentifier: PlayerPlaylistTableViewCell.identifier)
        tv.separatorStyle = .none
        tv.backgroundColor = .black
        return tv
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
        
        self.addSubview(playerTableView)
    }
    
    //MARK: - Set Layouts
    
    func setLayouts() {
        playerTableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        
    }
}
