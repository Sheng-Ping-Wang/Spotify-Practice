//
//  RecenlyPlayed.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/23.
//

import Foundation

// MARK: - Welcome
struct RecentlyPlayed: Codable {
    let items: [RecentlyPlayedItem]?
    let next: String?
    let limit: Int?
    let href: String?
}

// MARK: - Item
struct RecentlyPlayedItem: Codable {
    let track: Track
    let playedAt: String?
}

// MARK: - Track
struct Track: Codable {
    let album: RecentlyPlayedAlbum
    let artists: [RecentlyPlayedArtist]
    let discNumber, durationMS: Int?
    let explicit: Bool
    let href: String
    let id: String
    let isLocal: Bool?
    let name: String
    let popularity: Int
    let previewURL: String?
    let trackNumber: Int?
    let type: TrackType
    let uri: String?
}

// MARK: - Album
struct RecentlyPlayedAlbum: Codable {
    let artists: [Artist]
    let href: String
    let id: String
    let images: [RecentlyPlayedImage]
    let name, releaseDate: String?
    let totalTracks: Int?
    let uri: String
}

// MARK: - Artist
struct RecentlyPlayedArtist: Codable {
    let href: String
    let id, name: String
    let uri: String
}

// MARK: - Image
struct RecentlyPlayedImage: Codable {
    let height: Int
    let url: String
    let width: Int
}

enum TrackType: String, Codable {
    case track = "track"
}

