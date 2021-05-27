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
    var mySection: [PlayerSection] = [.player, .playlist]
    var player: AVPlayer?
    var song: Item? {
        didSet{
            getArtistTopTracks()
        }
    }
    var topTracks: ArtistTopTracks? {
        didSet{
            DispatchQueue.main.async {
                self.playerView.playerTableView.reloadData()
            }
        }
    }
    var isPlaying: Bool = true
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = playerView
        playerView.playerTableView.delegate = self
        playerView.playerTableView.dataSource = self

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        player?.pause()
    }
    
    //MARK: - Functions
    
    @objc func pausePlay(button: UIButton, config: UIImage.SymbolConfiguration) {
        if isPlaying == true {
            isPlaying = false
            let image = UIImage(systemName: "play.circle", withConfiguration: config)
            button.setImage(image, for: .normal)
            player?.pause()
        }else{
            isPlaying = true
            let image = UIImage(systemName: "pause.circle", withConfiguration: config)
            button.setImage(image, for: .normal)
            player?.play()
        }
    }

    func getSongInfo(imageView: GetImageView, songLabel: UILabel, artistLabel: UILabel) {
            guard let url = URL(string: song?.album.images[0].url ?? "") else { return }
            imageView.getImages(url: url)
            songLabel.text = song?.name
            artistLabel.text = song?.artists[0].name
            playSong()
    }

    func playSong() {
        guard let url = URL(string: song?.preview_url ?? "") else { return }
        player = AVPlayer(url: url)
        player?.volume = 0.2
        player?.play()
    }
    
    func getArtistTopTracks() {
        APICaller.shared.getArtistTopTracks(id: song?.artists[0].id ?? "") { (result) in
            switch result {
            case .success(let tracks):
                self.topTracks = tracks
            case .failure(let error):
                print(error)
            }
        }
    }

}

extension PlayerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return mySection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch mySection[section] {
        case .player:
            return 1
        case .playlist:
            return topTracks?.tracks.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch mySection[indexPath.section] {
        case .player:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PlayerTableViewCell.identifier, for: indexPath) as? PlayerTableViewCell else { return UITableViewCell() }
            cell.pausePlayBtnDidTap = {
                self.pausePlay(button: cell.pausePlayBtn, config: cell.config)
            }
            
            cell.sliderDidTouch = {
                self.player?.volume = cell.slider.value
            }
            
            getSongInfo(imageView: cell.myImageView, songLabel: cell.songLabel, artistLabel: cell.singerLabel)
            
            return cell
        case .playlist:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PlayerPlaylistTableViewCell.identifier, for: indexPath) as? PlayerPlaylistTableViewCell else { return UITableViewCell() }
            if let track = topTracks?.tracks[indexPath.row] {
                if let url = URL(string: track.album.images[0].url ?? "" ) {
                    cell.myImageView.getImages(url: url)
                    cell.songLabel.text = track.name
                    cell.singerLabel.text = "\(track.artists[0].name)"
                }

            }
            
                        
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch mySection[indexPath.section] {
        case .player:
            return view.frame.height * 0.7
        case .playlist:
            return 80
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.song = topTracks?.tracks[indexPath.row]
        player?.play()
    }
    
    
}

enum PlayerSection {
    case player, playlist
}
