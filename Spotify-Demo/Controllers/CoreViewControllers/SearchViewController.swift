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
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = searchView

//        searchSongs()
    }
    
    //MARK: - Functions
    
    func searchSongs() {
        APICaller.shared.searchSong { result in
            switch result {
            case .success(let song):
                print("zzzzzzz\(song)")
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    


}
