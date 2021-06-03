//
//  CategoryDetail.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/28.
//

import Foundation

// MARK: - Welcome
struct CategoryDetail: Codable {
    let playlists: CategoryPlaylists
}

// MARK: - Playlists
struct CategoryPlaylists: Codable {
    let href: String?
    let items: [CategoryDetailItem]
    let limit: Int?
    let next: String?
    let offset: Int?
    let total: Int?
}

// MARK: - Item
struct CategoryDetailItem: Codable {
    let collaborative: Bool
    let itemDescription: String?
    let href: String
    let id: String
    let images: [Image]
    let name: String
    let snapshotID: String?
    let tracks: CategoryDetailTracks?
    let uri: String?
}

// MARK: - Tracks
struct CategoryDetailTracks: Codable {
    let href: String
    let total: Int
}
