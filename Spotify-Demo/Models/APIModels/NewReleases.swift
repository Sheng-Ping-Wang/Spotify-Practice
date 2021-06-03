//
//  NewReleases.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/23.
//

import Foundation

// MARK: - Welcome
struct NewReleases: Codable {
    let albums: NewReleasesAlbums
}

// MARK: - Albums
struct NewReleasesAlbums: Codable {
    let href: String
    let items: [NewReleasesItem]
    let limit: Int
    let next: String
    let offset: Int
    let total: Int
}

// MARK: - Item
struct NewReleasesItem: Codable {
    let artists: [NewReleasesArtist]
    let availableMarkets: [String]?
    let href: String
    let id: String
    let images: [NewReleasesImage]
    let name, releaseDate: String?
    let totalTracks: Int?
    let uri: String?
}


// MARK: - Artist
struct NewReleasesArtist: Codable {
    let href: String
    let id, name: String
    let uri: String
}

// MARK: - Image
struct NewReleasesImage: Codable {
    let height: Int
    let url: String
    let width: Int
}
