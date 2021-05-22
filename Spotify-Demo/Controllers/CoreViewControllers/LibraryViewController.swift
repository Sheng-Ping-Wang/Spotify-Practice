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
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = libraryView
    }
    
    //MARK: - Functions
    

}
