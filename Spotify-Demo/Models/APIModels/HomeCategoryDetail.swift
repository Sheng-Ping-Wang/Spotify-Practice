//
//  HomeCategoryDetail.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/31.
//

import Foundation

// MARK: - Welcome
struct HomeCategoryDetail: Codable {
    let collaborative: Bool
    let welcomeDescription: String?
    let href: String
    let id: String
    let images: [Image]
    let name: String
    let primaryColor: String?
    let welcomePublic: Bool?
    let snapshotID: String?
    let tracks: HomeCategoryDetailTracks
    let type, uri: String?
}

// MARK: - Owner
struct HomeCategoryDetailOwner: Codable {
    let name: String?
}

// MARK: - Tracks
struct HomeCategoryDetailTracks: Codable {
    let href: String
    let items: [HomeCategoryDetailItem]
    let limit: Int
    let offset: Int
    let total: Int
}

// MARK: - Item
struct HomeCategoryDetailItem: Codable {
    let addedAt: Date?
    let isLocal: Bool?
    let track: HomeCategoryDetailTrack?
}

// MARK: - Track
struct HomeCategoryDetailTrack: Codable {
    let album: HomeCategoryDetailAlbum
    let availableMarkets: [String]?
    let discNumber, durationMS: Int?
    let episode, explicit: Bool?
    let href: String?
    let id: String
    let isLocal: Bool?
    let name: String
    let popularity: Int?
    let preview_url: String?
    let track: Bool?
    let trackNumber: Int?
    let uri: String?
}

// MARK: - Album
struct HomeCategoryDetailAlbum: Codable {
    let artists: [HomeCategoryDetailOwner]
    let availableMarkets: [String]?
    let href: String?
    let id: String?
    let images: [Image]
    let name, releaseDate: String?
    let totalTracks: Int?
    let uri: String?

}
