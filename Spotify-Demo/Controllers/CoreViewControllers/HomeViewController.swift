//
//  ViewController.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/19.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: - Properties
    
    let homeView = HomeView()
    
    var homeSections: [HomeSections] = [.catrgories, .artists, .somethingElse]
    
    var musicCategory: RankPlaylist? {
        didSet{
            DispatchQueue.main.async {
                self.homeView.homeTableView.reloadData()
            }
        }
    }
    
    var relatedArtists: ArtistsList?
    
    
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = homeView
        homeView.homeTableView.delegate = self
        homeView.homeTableView.dataSource = self
        
        getRankAPI()
        
    }
    
    //MARK: - Functions
    
    func getRankAPI() {
        APICaller.shared.getRankAPI{ result in
            switch result {
            case .success(let category):
                self.musicCategory = category
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        APICaller.shared.getArtistsList { result in
            switch result {
            case .success(let list):
                self.relatedArtists = list
            case .failure(let error):
                print(error.localizedDescription)
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

        switch homeSections[indexPath.section] {
        case .catrgories:
            if let categories = self.musicCategory?.playlists.items.map({$0.images[0].url}) {
            cell.testArray = categories
            }
            return cell
            
        case .artists:
            if let playlist = self.relatedArtists?.artists.map({$0.images[0].url}){
                cell.testArray = playlist
            }
            return cell
            
        case .somethingElse:
            break
        }
        
        

        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch homeSections[section] {
        case .catrgories:
            return "Categories"
        case .artists:
            return "Artists"
        case .somethingElse:
            return "Something else"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}


enum HomeSections {
    case catrgories, artists, somethingElse
}
