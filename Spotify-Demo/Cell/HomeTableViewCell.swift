//
//  HomeTableViewCell.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/20.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    //MARK: - Properties
    
    static let identifier = "homeTableViewCell"
    let homeView = HomeView()
    var homeSections: [HomeSections] = [.catrgories, .artists, .somethingElse]
    
    var musicCategory: RankPlaylist? {
        didSet{
//            print(musicCategory)
            DispatchQueue.main.async {
                self.myCollectionview.reloadData()
            }
        }
    }
    
    var testArray: [String] = []  {
        didSet{
//            print(relatedArtists)
            DispatchQueue.main.async {
                self.myCollectionview.reloadData()
            }
        }
    }
    
    var relatedArtists: ArtistsList? {
        didSet{
//            print(relatedArtists)
            DispatchQueue.main.async {
                self.myCollectionview.reloadData()
            }
        }
    }
    
    //MARK: - IBOutlets
    
    var myCollectionview: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 150)
        layout.minimumInteritemSpacing = 3
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        cv.backgroundColor = .purple
        
        return cv
    }()
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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


extension HomeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return testArray.count
//        switch homeSections[section] {
//        case .catrgories:
//            return musicCategory?.playlists.items.count ?? 0
//        case .artists:
//            return relatedArtists?.artists.count ?? 0
//        case .somethingElse:
//            return 0
//        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
        
        if let url = URL(string: testArray[indexPath.row]) {
            cell.myImageView.getImages(url: url)
            return cell
        }
//        switch homeSections[indexPath.section] {
//        case .catrgories:
//            if let url = URL(string: musicCategory?.playlists.items[indexPath.row].images.first?.url ?? "") {
//                cell.myImageView.getImages(url: url)
//                return cell
//            }
//        case .artists:
//            if let url = URL(string: relatedArtists?.artists[indexPath.row].images.first?.url ?? "") {
//                cell.myImageView.getImages(url: url)
//            }
//                return cell
//        case .somethingElse:
//            break
//        }
        
        return cell
    }
    
    
}
