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
    var userProfile: UserProfile?
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = profileView
        getProfile()
        
    }
    
    //MARK: - Functions
    
    func getProfile() {
        APICaller.shared.getCurrentUserProfile { (result) in
            switch result {
            case .success(let profile):
                self.userProfile = profile
                DispatchQueue.main.async {
                    self.setProfile()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func setProfile() {
        guard let url = URL(string: userProfile?.images[0].url ?? "") else { return }
        if let userProfile = userProfile {
            profileView.profileImageView.getImages(url: url)
            profileView.followersNumberLabel.text = "\(userProfile.followers.total)"
            profileView.userNameLabel.text = "Name: " + userProfile.displayName
            profileView.countryLabel.text = "Country: " + userProfile.country
            profileView.emailLabel.text = "Email: " + userProfile.email
        }
        
    }
    
}
