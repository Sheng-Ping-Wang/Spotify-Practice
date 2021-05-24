//
//  MyTabberViewController.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/19.
//

import UIKit

class MyTabbarViewController: UITabBarController {
    
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
        
        nav1.navigationBar.barTintColor = UIColor.defaultColor()
        nav2.navigationBar.barTintColor = UIColor.defaultColor()
        nav3.navigationBar.barTintColor = UIColor.defaultColor()
        nav4.navigationBar.barTintColor = UIColor.defaultColor()
        
        guard let font = UIFont(name: "Kefa", size: 40) else { return }
        nav1.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, .font: font]
        nav2.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, .font: font]
        nav3.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, .font: font]
        nav4.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, .font: font]
                
        self.tabBar.barTintColor = .clear
        self.tabBar.isTranslucent = true
        self.tabBar.tintColor = .white
        setViewControllers([nav1, nav2, nav3, nav4], animated: false)
        
    }
    


}
