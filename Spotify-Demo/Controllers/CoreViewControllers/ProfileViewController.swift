//
//  ProfileViewController.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/20.
//

import UIKit

class ProfileViewController: UIViewController {

    //MARK: - Properties
    
    let profileView = ProfileView()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = profileView
        
        APICaller.shared.getCurrentUserProfile { (result) in
            switch result {
            case .success(let model):
                break
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //MARK: - Functions
    
    
    
}
