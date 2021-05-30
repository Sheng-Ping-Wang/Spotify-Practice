//
//  ViewController.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/19.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: - Properties
    
    var imageUrlAndhref = ImageUrlAndhref(imageUrl: [], href: [])
    
    let homeView = HomeView()
    
    var homeSections: [HomeSections] = [.newReleases, .followSingers, .catrgories, .artists, .recentlyPlayed]
    
    var musicCategory: RankPlaylist? {
        didSet{
            DispatchQueue.main.async {
                self.homeView.homeTableView.reloadData()
            }
        }
    }

    var relatedArtists: ArtistsList? {
        didSet{
            DispatchQueue.main.async {
                self.homeView.homeTableView.reloadData()
            }
        }
    }
    
    var newReleases: NewReleases? {
        didSet{
            DispatchQueue.main.async {
                self.homeView.homeTableView.reloadData()
            }
        }
    }
    
    var recentlyPlayed: RecentlyPlayed? {
        didSet{
            DispatchQueue.main.async {
                self.homeView.homeTableView.reloadData()
            }
        }
    }
    
    var currentlyFollowing: CurrentlyFollowing? {
        didSet{
            DispatchQueue.main.async {
                self.homeView.homeTableView.reloadData()
            }
        }
    }
    
    var myIndexPath: Int?
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = homeView
        homeView.homeTableView.delegate = self
        homeView.homeTableView.dataSource = self
        getHomeAPI()
    }
    
    //MARK: - Functions
    
    func getHomeAPI() {
        getRankAPI()
        getRecentlyPlayed()
        getNewReleases()
        getCurrentlyFollowing()
    }
    
    func getRankAPI() {
        APICaller.shared.getRankAPI{ result in
            switch result {
            case .success(let category):
                self.musicCategory = category
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getRelatedArtist(relatedArtistID: String) {
        APICaller.shared.getArtistsList(id: relatedArtistID) { result in
            switch result {
            case .success(let list):
                self.relatedArtists = list
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getRecentlyPlayed() {
        APICaller.shared.getRecentlyPlayed { result in
            switch result {
            case .success(let list):
                self.recentlyPlayed = list
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getNewReleases() {
        APICaller.shared.getNewReleases { result in
            switch result {
            case .success(let list):
                self.newReleases = list
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getCurrentlyFollowing() {
        APICaller.shared.getCurrentlylyFollowing { result in
            switch result {
            case .success(let list):
                self.currentlyFollowing = list
                self.getRelatedArtist(relatedArtistID: list.artists.items[0].id)
            case .failure(let error):
                print(error)
            }
        }
    }

    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return homeSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        cell.delegate = self
        switch homeSections[indexPath.section] {
        case .newReleases:
            if let newReleases = self.newReleases?.albums.items.map({$0.images[0].url}), let newReleasesHref = self.newReleases?.albums.items.map({$0.href}) {
                imageUrlAndhref.imageUrl = newReleases
                imageUrlAndhref.href = newReleasesHref
                cell.imageUrlAndhref = self.imageUrlAndhref
//            cell.getPictures = newReleases
            }
//            cell.newReleases = self.newReleases
            return cell
        
        case .followSingers:
            if let currentlyFollowing = self.currentlyFollowing?.artists.items.map({$0.images[0].url}), let currentlyFollowingHref = self.currentlyFollowing?.artists.items.map({$0.href}) {
                imageUrlAndhref.imageUrl = currentlyFollowing
                imageUrlAndhref.href = currentlyFollowingHref
                cell.imageUrlAndhref = self.imageUrlAndhref
//                cell.getPictures = currentlyFollowing
                cell.isCircle = true
            }
//            cell.currentlyFollowing = self.currentlyFollowing
            return cell
            
        case .catrgories:
            if let categories = self.musicCategory?.playlists.items.map({$0.images[0].url}), let categoriesHref = self.musicCategory?.playlists.items.map({$0.href}) {
                imageUrlAndhref.imageUrl = categories
                imageUrlAndhref.href = categoriesHref
                cell.imageUrlAndhref = self.imageUrlAndhref
//            cell.getPictures = categories
            }
//            cell.musicCategory = self.musicCategory
            return cell
            
        case .artists:
            if let playlist = self.relatedArtists?.artists.map({$0.images[0].url}), let playlistHref = self.relatedArtists?.artists.map({$0.href}) {
                imageUrlAndhref.imageUrl = playlist
                imageUrlAndhref.href = playlistHref
                cell.imageUrlAndhref = self.imageUrlAndhref
//                cell.getPictures = playlist
            }
//            cell.relatedArtists = self.relatedArtists
            return cell
            
        case .recentlyPlayed:
            if let recentlyPlayed = self.recentlyPlayed?.items?.map({$0.track.album.images[0].url}), let recentlyPlayedHref = self.recentlyPlayed?.items?.map({$0.track.href}) {
                imageUrlAndhref.imageUrl = recentlyPlayed
                imageUrlAndhref.href = recentlyPlayedHref
                cell.imageUrlAndhref = self.imageUrlAndhref
//                cell.getPictures = recentlyPlayed
            }
//            cell .recentlyPlayed = self.recentlyPlayed
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let label = UILabel()
        label.font = UIFont(name: "Kefa", size: 20)
        label.textColor = .white
        label.text = HomeSections.allCases[section].string
        return label
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
}


enum HomeSections: CaseIterable {
    case newReleases,followSingers, catrgories, artists, recentlyPlayed
    
    var string: String {
        switch self {
        case .newReleases:
            return "New Releases"
        case .followSingers:
            return "Currently Following"
        case .catrgories:
            return "Categories"
        case .artists:
            return "Artists You May Like"
        case .recentlyPlayed:
            return "Recently Played"
        }
    }
}


extension HomeViewController: SendIndexPathDelegate {
    func sendIndexPath(href: String) {
        print(href)
        let playerVC = PlayerViewController()
        playerVC.playlistUrl = href
        present(playerVC, animated: true, completion: nil)
    }
    
    
}


