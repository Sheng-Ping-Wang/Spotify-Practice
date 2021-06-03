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
    
    var newReleases: NewReleases? {
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
    
    var recentlyPlayed: RecentlyPlayed? {
        didSet{
            DispatchQueue.main.async {
                self.homeView.homeTableView.reloadData()
            }
        }
    }
    
    
    
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
    
    func getNewReleasesDetail(url: String) {
        APICaller.shared.getNewReleasesDetail(url: url) { (ref) in
            switch ref {
            case .success(let releases):
                DispatchQueue.main.async {
                    let vc = PlayerViewController()
                    vc.song = PlaySongInfo(
                    imageUrl: releases.images[0].url,
                    song: releases.name,
                    singer: releases.artists[0].name,
                    previewUrl: releases.tracks?.items[0].preview_url ?? "",
                    songID: releases.tracks?.items[0].artists.first?.id)
                    vc.isPlaylist = false
                    self.present(vc, animated: true, completion: nil)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getHomeCategoryDetail(url: String) {
        APICaller.shared.getHomeCategoryDetail(url: url) { (result) in
            switch result {
            case .success(let category):
                DispatchQueue.main.async {
                    let vc = PlayerViewController()
                    vc.song = PlaySongInfo(imageUrl: category.tracks.items.first?.track.album.images.first?.url ?? "",
                        song: category.tracks.items.first?.track.name ?? "",
                        singer: category.tracks.items.first?.track.album.artists.first?.name ?? "",
                        previewUrl: category.tracks.items.first?.track.preview_url ?? "",
                        songID: category.tracks.items.first?.track.id)
                    vc.playlistUrl = category.href + "/tracks"
                    vc.isPlaylist = true
                    self.present(vc, animated: true, completion: nil)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getRecentlyPlayedDetail(url: String) {
        APICaller.shared.getRecentlyPlayedDetail(url: url) { (result) in
            switch result {
            case .success(let track):
                DispatchQueue.main.async {
                    let vc = PlayerViewController()
                    vc.song = PlaySongInfo(imageUrl: track.album?.images.first?.url ?? "", song: track.name, singer: track.artists.first?.name ?? "", previewUrl: track.preview_url ?? "", songID: track.artists.first?.id)
                    vc.isPlaylist = false
                    self.present(vc, animated: true, completion: nil)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getArtistProfile(url: String) {
        APICaller.shared.getArtistProfile(url: url) { (result) in
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

//MARK: - UITableViewDelegate, UITableViewDataSource

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
            }
            return cell
        
        case .followSingers:
            if let currentlyFollowing = self.currentlyFollowing?.artists.items.map({$0.images[0].url}), let currentlyFollowingHref = self.currentlyFollowing?.artists.items.map({$0.href}) {
                imageUrlAndhref.imageUrl = currentlyFollowing
                imageUrlAndhref.href = currentlyFollowingHref
                cell.imageUrlAndhref = self.imageUrlAndhref
                cell.isCircle = true
            }
            return cell
            
        case .catrgories:
            if let categories = self.musicCategory?.playlists.items.map({$0.images[0].url}), let categoriesHref = self.musicCategory?.playlists.items.map({$0.href}) {
                imageUrlAndhref.imageUrl = categories
                imageUrlAndhref.href = categoriesHref
                cell.imageUrlAndhref = self.imageUrlAndhref
            }
            return cell
            
        case .artists:
            if let playlist = self.relatedArtists?.artists.map({$0.images[0].url}), let playlistHref = self.relatedArtists?.artists.map({$0.href}) {
                imageUrlAndhref.imageUrl = playlist
                imageUrlAndhref.href = playlistHref
                cell.imageUrlAndhref = self.imageUrlAndhref
            }
            return cell
            
        case .recentlyPlayed:
            if let recentlyPlayed = self.recentlyPlayed?.items?.map({$0.track.album.images[0].url}), let recentlyPlayedHref = self.recentlyPlayed?.items?.map({$0.track.href}) {
                imageUrlAndhref.imageUrl = recentlyPlayed
                imageUrlAndhref.href = recentlyPlayedHref
                cell.imageUrlAndhref = self.imageUrlAndhref
            }
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
        return 50
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

//點擊首頁圖片後傳送資料到下一頁及跳頁
extension HomeViewController: SendIndexPathDelegate {
    func sendIndexPath(href: String) {
        
        if href.contains("albums") {
            getNewReleasesDetail(url: href)
        }else if href.contains("artists") {
            getArtistProfile(url: href)
        }else if href.contains("playlists") {
            getHomeCategoryDetail(url: href)
        }else{
            getRecentlyPlayedDetail(url: href)
        }
    }
    
}


