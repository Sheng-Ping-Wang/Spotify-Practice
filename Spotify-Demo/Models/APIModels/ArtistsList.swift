//
//  Playlists.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/21.
//

import Foundation

// MARK: - Welcome
struct ArtistsList: Codable {
    let artists: [RelatedArtist]
}

// MARK: - Artist
struct RelatedArtist: Codable {
    let genres: [String]
    let href: String
    let id: String
    let images: [RelatedArtistImage]
    let name: String
    let popularity: Int
    let type: TypeEnum
    let uri: String

}
// MARK: - Image
struct RelatedArtistImage: Codable {
    let height: Int
    let url: String
    let width: Int
}

enum TypeEnum: String, Codable {
    case artist = "artist"
}

