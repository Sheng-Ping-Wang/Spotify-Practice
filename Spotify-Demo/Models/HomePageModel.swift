//
//  HomePageModel.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/24.
//

import Foundation

struct HomePageModel {
    
    var musicCategory: RankPlaylist
    var relatedArtists: ArtistsList
    var newReleases: NewReleases
    var recentlyPlayed: RecentlyPlayed
    var currentlyFollowing: CurrentlyFollowing
    
}

struct ImageUrlAndhref {
    var imageUrl: [String]
    var href: [String]
}

struct Test: Codable {
    let artists: [Artist]
    let images: [Image]
    let tracks: Tracks
}
