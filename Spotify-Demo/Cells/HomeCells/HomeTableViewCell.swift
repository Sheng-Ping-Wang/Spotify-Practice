//
//  HomeTableViewCell.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/20.
//

import UIKit

protocol SendIndexPathDelegate: AnyObject {
    func sendIndexPath(href: String)
}

class HomeTableViewCell: UITableViewCell {

    //MARK: - Properties
    
    static let identifier = "homeTableViewCell"
    let homeView = HomeView()
    var isCircle: Bool = false
    weak var delegate: SendIndexPathDelegate?
    var getPictures: [String] = []  {
        didSet{
            DispatchQueue.main.async {
                self.myCollectionview.reloadData()
            }
        }
    }
    var imageUrlAndhref: ImageUrlAndhref? {
        didSet{
            DispatchQueue.main.async {
                self.myCollectionview.reloadData()
            }
        }
    }
    
    //MARK: - IBOutlets
    
    var myCollectionview: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.minimumInteritemSpacing = 3
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        
        return cv
    }()
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        setSubviews()
        setLayouts()
        myCollectionview.delegate = self
        myCollectionview.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    //MARK: - Set Subviews
    
    func setSubviews() {
        contentView.addSubview(myCollectionview)
    }
    
    //MARK: - Set Layouts
    
    func setLayouts() {
        myCollectionview.snp.makeConstraints { (make) in
            make.edges.equalTo(contentView)
        }
    }

}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension HomeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imageUrlAndhref?.imageUrl.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
        
        guard let url = URL(string: imageUrlAndhref?.imageUrl[indexPath.row] ?? "") else { return UICollectionViewCell() }
            cell.myImageView.getImages(url: url)
        if isCircle == true {
            cell.myImageView.layer.cornerRadius = cell.myImageView.frame.width/2
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.sendIndexPath(href: imageUrlAndhref?.href[indexPath.row] ?? "")
    }
    
}
