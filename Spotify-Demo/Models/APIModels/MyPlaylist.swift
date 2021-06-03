//
//  Playlist.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/27.
//

import Foundation

// MARK: - Welcome
struct MyPlaylist: Codable {
    let href: String
    let items: [MyPlaylistItem]?
    let limit: Int?
    let offset: Int?
    let total: Int?
}

// MARK: - Item
struct MyPlaylistItem: Codable {
    let addedAt: Date?
    let addedBy: AddedBy?
    let isLocal: Bool?
    let track: Item?
}

// MARK: - AddedBy
struct AddedBy: Codable {
    let href: String
    let id: String
    let uri: String
    let name: String?
}

// MARK: - Track
struct MyPlaylistTrack: Codable {
    let album: MyPlaylistAlbum?
    let availableMarkets: [String]?
    let discNumber, durationMS: Int?
    let episode, explicit: Bool?
    let href: String
    let id: String?
    let isLocal: Bool?
    let name: String?
    let popularity: Int?
    let preview_url: String?
    let track: Bool?
    let trackNumber: Int?
    let uri: String?
}

// MARK: - Album
struct MyPlaylistAlbum: Codable {
    let albumType: AlbumTypeEnum?
    let artists: [AddedBy]
    let availableMarkets: [String]?
    let externalUrls: ExternalUrls?
    let href: String?
    let id: String?
    let images: [MyPlaylistImage]?
    let name, releaseDate: String?
    let totalTracks: Int?
    let type: AlbumTypeEnum?
    let uri: String?
}

enum AlbumTypeEnum: String, Codable {
    case album = "album"
    case compilation = "compilation"
    case single = "single"
}

// MARK: - Image
struct MyPlaylistImage: Codable {
    let height: Int
    let url: String
    let width: Int
}

