//
//  PlayerViewController.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/25.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {

    //MARK: - Properties
    
    var playerView = PlayerView()
    var player: AVPlayer?
    var song: Item? {
        didSet{
            getSongInfo()
        }
    }
    var isPlaying: Bool = true
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = playerView
        playerView.pausePlayBtn.addTarget(self, action: #selector(pausePlay), for: .touchUpInside)
        playerView.slider.addTarget(self, action: #selector(songVolume), for: .valueChanged)
    }
    
    //MARK: - Functions
    
    @objc func pausePlay() {
        if isPlaying == true {
            isPlaying = false
            let image = UIImage(systemName: "play.circle", withConfiguration: playerView.config)
            playerView.pausePlayBtn.setImage(image, for: .normal)
            player?.pause()
        }else{
            isPlaying = true
            let image = UIImage(systemName: "pause.circle", withConfiguration: playerView.config)
            playerView.pausePlayBtn.setImage(image, for: .normal)
            player?.play()
        }
    }
    
    @objc func songVolume(sender: UISlider) {
        player?.volume = sender.value
    }
    
    func getSongInfo() {
            guard let url = URL(string: song?.album.images[0].url ?? "") else { return }
            playerView.myImageView.getImages(url: url)
            playerView.songLabel.text = song?.name
            playerView.singerLabel.text = song?.artists[0].name
            playSong()
    }
    
    func playSong() {
        guard let url = URL(string: song?.preview_url ?? "") else { return }
        player = AVPlayer(url: url)
        player?.play()
    }
    
    

}
