//
//  LibraryView.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/20.
//

import UIKit

class LibraryView: UIView {

    //MARK: - IBOutlets
    
    let libraryTableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .insetGrouped)
        tv.register(LibraryTableViewCell.self, forCellReuseIdentifier: LibraryTableViewCell.identifier)
        tv.backgroundColor = .clear
        tv.separatorStyle = .none
        return tv
    }()
    
    lazy var customHeaderView: UIView = {
        let view = UIView()
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = CGRect(x: 0, y: 0, width: 0, height: 3)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 2
        shapeLayer.strokeColor = UIColor.darkGray.cgColor
        
        let path = UIBezierPath()
        let fullSizeWidth = libraryTableView.frame.width
        
        path.move(to: .init(x: -20, y: 30))
        path.addQuadCurve(to: CGPoint(x: 0, y: 5), controlPoint: CGPoint(x: -5, y: 3))
        path.addLine(to: CGPoint(x: fullSizeWidth - 40, y: 5))
        path.addQuadCurve(to: CGPoint(x: fullSizeWidth - 20, y: 30), controlPoint: CGPoint(x: fullSizeWidth - 35, y: 3))
        shapeLayer.path = path.cgPath
        
        view.layer.addSublayer(shapeLayer)
        return view
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
        self.addSubview(libraryTableView)
    }
    
    //MARK: - Set Layouts

    func setLayouts() {
        libraryTableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
}
