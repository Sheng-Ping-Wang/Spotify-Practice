//
//  PlayList.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/21.
//

import Foundation

// MARK: - Welcome
struct RankPlaylist: Codable {
    let message: String
    let playlists: Playlists
}

// MARK: - Playlists
struct Playlists: Codable {
    let href: String
    let items: [PlaylistItem]
    let limit: Int
    let offset: Int
    let total: Int
}

// MARK: - Item
struct PlaylistItem: Codable {
    let collaborative: Bool
    let itemDescription: String?
    let href: String
    let id: String
    let images: [PlaylistImage]
    let name: String
    let snapshotID: String?
    let tracks: PlaylistTracks?
    let type: PlaylistItemType
    let uri: String
}

// MARK: - Image
struct PlaylistImage: Codable {
    let url: String
}

// MARK: - Tracks
struct PlaylistTracks: Codable {
    let href: String
    let total: Int
}

enum PlaylistItemType: String, Codable {
    case playlist = "playlist"
}
