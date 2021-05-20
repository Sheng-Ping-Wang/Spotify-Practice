//
//  MyTabberViewController.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/19.
//

import UIKit

class MyTabberViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeVC = HomeViewController()
        let searchVC = SearchViewController()
        let libraryVC = LibraryViewController()
        let profileVC = ProfileViewController()
        
        homeVC.navigationItem.largeTitleDisplayMode = .always
        searchVC.navigationItem.largeTitleDisplayMode = .always
        libraryVC.navigationItem.largeTitleDisplayMode = .always
        profileVC.navigationItem.largeTitleDisplayMode = .always
        
        homeVC.title = "Brouse"
        searchVC.title = "Search"
        libraryVC.title = "Library"
        profileVC.title = "Profile"
        
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        libraryVC.tabBarItem.image = UIImage(systemName: "music.note.list")
        profileVC.tabBarItem.image = UIImage(systemName: "person")
        
        let nav1 = UINavigationController(rootViewController: homeVC)
        let nav2 = UINavigationController(rootViewController: searchVC)
        let nav3 = UINavigationController(rootViewController: libraryVC)
        let nav4 = UINavigationController(rootViewController: profileVC)
        
        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        nav3.navigationBar.prefersLargeTitles = true
        nav4.navigationBar.prefersLargeTitles = true
        
        
        
        setViewControllers([nav1, nav2, nav3, nav4], animated: false)
        
    }
    


}
