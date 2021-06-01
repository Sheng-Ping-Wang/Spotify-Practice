//
//  ArtistProfileViewController.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/31.
//

import UIKit

class ArtistProfileViewController: UIViewController {

    //MARK: - Properties
    
    let artistView = ArtistProfileView()
    var mySections: [MySection] = [.profile, .relatedArtists]
    var artistProfile: ArtistProfile? {
        didSet{
            getRelatedArtist()
            artistView.myCollectionView.reloadData()
        }
    }
    var relatedArtists: ArtistsList? {
        didSet{
            DispatchQueue.main.async {
                self.artistView.myCollectionView.reloadData()
            }
        }
    }
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = artistView
        artistView.myCollectionView.delegate = self
        artistView.myCollectionView.dataSource = self
        
    }
    
    //MARK: - Functions
    
    func getRelatedArtist() {
        APICaller.shared.getArtistsList(id: artistProfile?.id ?? "") { (result) in
            switch result {
            case .success(let lists):
                self.relatedArtists = lists
            case .failure(let error):
                print(error)
            }
        }
    }

}

extension ArtistProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return mySections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch mySections[section] {
        case .profile:
            return 1
        case .relatedArtists:
            return relatedArtists?.artists.count ?? 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch mySections[indexPath.section] {
        case .profile:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArtistProfileCell.identifier, for: indexPath) as? ArtistProfileCell else { return UICollectionViewCell()}
            if let url = URL(string: artistProfile?.images.first?.url ?? ""), let name = artistProfile?.name, let genre = artistProfile?.type, let followers = artistProfile?.followers.total {
                cell.myImageView.getImages(url: url)
                cell.nameLabel.text = "Name: \(name)"
                cell.genreLabel.text = "Genre: \(genre)"
                cell.followersLabel.text = "Followers: \(followers)"
                
                
            }
            return cell
        case .relatedArtists:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RelatedArtistCell.identifier, for: indexPath) as? RelatedArtistCell else { return UICollectionViewCell()}
            if let url = URL(string: relatedArtists?.artists[indexPath.row].images.first?.url ?? "") {
                cell.myImageView.getImages(url: url)
            }
            
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch mySections[indexPath.section] {
        case .profile:
            break
        case .relatedArtists:
//            print(relatedArtists?.artists[indexPath.row].id)
            APICaller.shared.getArtistProfile(url: relatedArtists?.artists[indexPath.row].href ?? "") { (result) in
                switch result {
                case .success(let artist):
                    DispatchQueue.main.async {
                        let artistProfileVC = ArtistProfileViewController()
                        artistProfileVC.artistProfile = artist
                        self.navigationController?.pushViewController(artistProfileVC, animated: true)
                    }
                case .failure(let error):
                    print(error)
                }
            }

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        
        switch mySections[indexPath.section] {
        case .profile:
            return CGSize(width: width - 50, height: width + 10)
        case .relatedArtists:
            return CGSize(width: width/2 - 30, height: width/2 - 30)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ArtistProfileReusableViewHeader.identifier, for: indexPath) as? ArtistProfileReusableViewHeader else { return UICollectionReusableView() }
            header.configure()
            return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch mySections[section] {
        case .profile:
            return CGSize(width: 0, height: 0)
        case .relatedArtists:
            return CGSize(width: view.frame.width, height: 40)
        }
    }
    
    
}

enum MySection {
    case profile, relatedArtists
}


