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
            playSong(url: song?.preview_url ?? "")
        }
    }
    var topTracks: ArtistTopTracks? {
        didSet{
            DispatchQueue.main.async {
                self.playerView.playerTableView.reloadData()
            }
        }
    }
    
    var playlistUrl: String? {
        didSet{
            gerMyPlaylist()
        }
    }
    var isPlaying: Bool = true {
        didSet{
            self.playerView.playerTableView.reloadData()
        }
    }
    var isPlaylist: Bool = true
    var myPlaylist: MyPlaylist? {
        didSet{
            DispatchQueue.main.async {
                self.playerView.playerTableView.reloadData()
            }
        }
    }
    
    
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
    
    @objc func pausePlay() {
        if isPlaying == true {
            isPlaying = false
            player?.pause()
        }else{
            isPlaying = true
            player?.play()
        }
    }

    //顯示在UI上的資料
    func getSongInfo(imageView: GetImageView, songLabel: UILabel, artistLabel: UILabel) {
        guard let url = URL(string: song?.album.images.first?.url ?? "") else { return }
            imageView.getImages(url: url)
            songLabel.text = song?.name
        artistLabel.text = song?.artists.first?.name
            
    }

    func playSong(url: String) {
        
        guard let url = URL(string: url) else { return }
        player = AVPlayer(url: url)
        player?.volume = 0.5
        player?.play()
    }
    
    func getArtistTopTracks() {
        APICaller.shared.getArtistTopTracks(id: song?.artists.first?.id ?? "") { (result) in
            switch result {
            case .success(let tracks):
                self.topTracks = tracks
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func gerMyPlaylist() {
        APICaller.shared.getMyPlaylist(url: playlistUrl ?? "") { (result) in
            switch result {
            case .success(let playlist):
                self.myPlaylist = playlist
                self.song = playlist.items?.first?.track
            case .failure(let error):
                print(error)
            }
        }
    }
    
//    func getTest() {
//        APICaller.shared.getTest(url: playlistUrl ?? "") { (result) in
//            switch result {
//            case .success(let test):
//
//            }
//        }
//    }
    
    func isAudioAvailable(item: Item?) {
        if item?.preview_url == nil {
            let alert = UIAlertController(title: "Oops", message: "The audition is not available.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            player?.pause()
            isPlaying = false
            present(alert, animated: true, completion: nil)
        }else{
            self.song = item
            isPlaying = true
        }
    }

}


//MARK: - UITableViewDelegate, UITableViewDataSource
extension PlayerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return mySection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch mySection[section] {
        case .player:
            return 1
        case .playlist:
            if isPlaylist == true {
                return myPlaylist?.items?.count ?? 0
            }else{
                return topTracks?.tracks.count ?? 0
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch mySection[indexPath.section] {
        
        case .player:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PlayerTableViewCell.identifier, for: indexPath) as? PlayerTableViewCell else { return UITableViewCell() }
            cell.pausePlayBtnDidTap = {
                self.pausePlay()
            }
            cell.sliderDidTouch = {
                self.player?.volume = cell.slider.value
            }
            getSongInfo(imageView: cell.myImageView, songLabel: cell.songLabel, artistLabel: cell.singerLabel)
            
            if isPlaying == true {
                let image = UIImage(systemName: "pause.circle", withConfiguration: cell.config)
                cell.pausePlayBtn.setImage(image, for: .normal)
            }else{
                let image = UIImage(systemName: "play.circle", withConfiguration: cell.config)
                cell.pausePlayBtn.setImage(image, for: .normal)
            }
            return cell
            
        case .playlist:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PlayerPlaylistTableViewCell.identifier, for: indexPath) as? PlayerPlaylistTableViewCell else { return UITableViewCell() }
            
            if isPlaylist == true {
                if let playlist = myPlaylist?.items?[indexPath.row] {
                    if let url = URL(string: playlist.track?.album.images.first?.url ?? "" ) {
                        cell.myImageView.getImages(url: url)
                        cell.songLabel.text = playlist.track?.name
                        if let singer = playlist.track?.album.artists.first?.name {
                            cell.singerLabel.text = singer
                        }
                    }
                }
            }else{
                if let track = topTracks?.tracks[indexPath.row] {
                    if let url = URL(string: track.album.images.first?.url ?? "") {
                        cell.myImageView.getImages(url: url)
                        cell.songLabel.text = track.name
                        cell.singerLabel.text = track.artists.first?.name
                    }
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
        
        if isPlaylist == true {
            isAudioAvailable(item: myPlaylist?.items?[indexPath.row].track)
        }else{
            isAudioAvailable(item: topTracks?.tracks[indexPath.row])
        }
    }
    

    
    
    
}

enum PlayerSection {
    case player, playlist
}

