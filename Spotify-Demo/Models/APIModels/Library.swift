//
//  LibraryPlaylist.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/26.
//

import Foundation

// MARK: - Welcome
struct Library: Codable {
    let href: String
    let items: [LibraryItem]?
    let limit: Int
    let offset: Int
    let total: Int
}

// MARK: - Item
struct LibraryItem: Codable {
    let collaborative: Bool
    let itemDescription: String?
    let href: String
    let id: String
    let images: [LibraryImage]?
    let name: String
    let itemPublic: Bool?
    let snapshotID: String?
    let tracks: LibraryTracks?
    let type, uri: String?
}

// MARK: - Image
struct LibraryImage: Codable {
    let height: Int?
    let url: String
    let width: Int?
}

// MARK: - Tracks
struct LibraryTracks: Codable {
    let href: String
    let total: Int
}
