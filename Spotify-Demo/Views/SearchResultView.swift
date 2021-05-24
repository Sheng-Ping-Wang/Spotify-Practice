//
//  SearchResultView.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/24.
//

import UIKit

class SearchResultView: UIView {

    //MARK: - IBOutlets
    
        let searchButton: UIButton = {
            let button = UIButton(type: .system)
            button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
            return button
        }()
    
        lazy var searchTextField: UITextField = {
            let tf = UITextField()
            tf.layer.cornerRadius = 10
            tf.placeholder = "Search..."
            tf.backgroundColor = .white
            tf.rightView = searchButton
            tf.rightViewMode = .always
            tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
            tf.leftViewMode = .always
            return tf
        }()
    
    let resultTableView: UITableView = {
        let tv = UITableView()
        tv.register(SearchResultTableViewCell.self, forCellReuseIdentifier: SearchResultTableViewCell.identifier)
        tv.backgroundColor = .clear
        return tv
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        setSubViews()
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Set Subviews
    
    func setSubViews() {
        self.addSubview(searchTextField)
        self.addSubview(resultTableView)
    }
    
    //MARK: - Set Layouts

    func setLayouts() {
        searchTextField.snp.makeConstraints { (make) in
//            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(15)
            make.left.equalTo(self).offset(+8)
            make.right.equalTo(self).offset(-8)
            make.height.equalTo(40)
        }
        
        resultTableView.snp.makeConstraints { (make) in
            make.top.equalTo(searchTextField.snp.bottom).offset(+8)
            make.bottom.equalTo(self.snp.bottomMargin)
            make.width.centerX.equalTo(self)
        }
    }
}
