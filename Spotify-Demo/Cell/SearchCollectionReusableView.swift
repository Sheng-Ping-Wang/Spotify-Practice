//
//  SearchCollectionReusableView.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/24.
//

import UIKit

class SearchCollectionReusableHeader: UICollectionReusableView {
    
    
    //MARK: - Properties
    
    static let identifier = "searchCollectionReusableHeader"
    
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
        tf.placeholder = "Artist, Songs, or Podcasts"
        tf.backgroundColor = .white
        tf.rightView = searchButton
        tf.rightViewMode = .always
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        tf.leftViewMode = .always
        return tf
    }()
    
    //MARK: - Init
    
    public func configure() {
        addSubview(searchTextField)
        setLayouts()
    }
    
    //MARK: - Set Layouts
    
    func setLayouts() {
        searchTextField.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(+8)
            make.right.equalTo(self).offset(-8)
            make.centerY.equalTo(self)
            make.height.equalTo(self).offset(-20)
        }
    }
    
}
