//
//  LibraryViewController.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/19.
//

import UIKit

class LibraryViewController: UIViewController {

    //MARK: - Properties
    
    let libraryView = LibraryView()
    var userPlaylist: Library? {
        didSet{
            DispatchQueue.main.async {
                self.libraryView.libraryTableView.reloadData()
            }
        }
    }
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = libraryView
        libraryView.libraryTableView.delegate = self
        libraryView.libraryTableView.dataSource = self
        getUserPlaylist()
    }
    
    //MARK: - Functions
    
    func getUserPlaylist() {
        APICaller.shared.getCurrentUserPlaylist { result in
            switch result {
            case .success(let list):
                self.userPlaylist = list
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension LibraryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userPlaylist?.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LibraryTableViewCell.identifier, for: indexPath) as? LibraryTableViewCell else { return UITableViewCell()}
        
        let playlist = userPlaylist?.items?[indexPath.row]
        if let url = URL(string: playlist?.images?.first?.url ?? "") {
            cell.myImageView.getImages(url: url)
            cell.playListNameLabel.text = playlist?.name
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let playerVC = PlayerViewController()
        playerVC.playlistUrl = userPlaylist?.items?[indexPath.row].tracks?.href
        playerVC.isPlaylist = true
        present(playerVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return libraryView.customHeaderView
    }
    
}