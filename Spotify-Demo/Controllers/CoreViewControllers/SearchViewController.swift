//
//  SearchViewController.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/19.
//

import UIKit

class SearchViewController: UIViewController {

    //MARK: - Properties
    
    let searchView = SearchView()
    var brouseCatrgories: Brouse? {
        didSet{
            DispatchQueue.main.async {
                self.searchView.searchCollectionview.reloadData()
            }
        }
    }
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = searchView
        searchView.searchCollectionview.delegate = self
        searchView.searchCollectionview.dataSource = self
        getCategories()
        
//        searchSongs()
//        searchView.searchButton.addTarget(self, action: #selector(search), for: .touchUpInside)
    }
    
    //MARK: - Functions
    
    @objc func search() {
        
        let vc = SearchResultController()
        present(vc, animated: true, completion: nil)
    }
    
        
        
    
    
    func getCategories() {
        APICaller.shared.getCategories { result in
            switch result {
            case .success(let categories):
                self.brouseCatrgories = categories
            case .failure(let error):
                print(error)
            }
        }
    }
    


}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return brouseCatrgories?.categories.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell()}
        
        guard let categories = brouseCatrgories?.categories.items.map({$0}) else { return UICollectionViewCell() }
        
        if let url = URL(string: categories[indexPath.row].icons[0].url) {
            cell.myImageView.getImages(url: url)
            cell.myLabel.text = categories[indexPath.row].name
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SearchCollectionReusableHeader.identifier, for: indexPath) as? SearchCollectionReusableHeader else { return UICollectionReusableView() }
        header.searchButton.addTarget(self, action: #selector(search), for: .touchUpInside)
        header.configure()
        return header
    }
    
    
    
}
