//
//  CategoryViewController.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/28.
//

import UIKit

class CategoryViewController: UIViewController {

    //MARK: - Properties
    
    let categoryView = CategoryView()
    var categoryID: String? {
        didSet{
            getCategoryDetail()
        }
    }
    var category: CategoryDetail? {
        didSet{
            DispatchQueue.main.async {
                self.categoryView.categoryCollectionView.reloadData()
            }
        }
    }
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = categoryView
        categoryView.categoryCollectionView.delegate = self
        categoryView.categoryCollectionView.dataSource = self
    }
    
    //MARK: - Functions
    
    func getCategoryDetail() {
        APICaller.shared.getMyCategoryDetail(id: categoryID ?? "") { (result) in
            switch result {
            case .success(let category):
                self.category = category
            case .failure(let error):
                print(error)
            }
        }
    }
    

}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category?.playlists.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
        if let url = URL(string: category?.playlists.items[indexPath.row].images.first?.url ?? "") {
            cell.myImageView.getImages(url: url)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let playerVC = PlayerViewController()
        playerVC.playlistUrl = category?.playlists.items[indexPath.row].tracks?.href
        playerVC.isPlaylist = true
        navigationController?.pushViewController(playerVC, animated: true)
    }
    
    
}
