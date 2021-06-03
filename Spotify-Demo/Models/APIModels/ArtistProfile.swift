//
//  ArtistProfile.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/6/1.
//

import Foundation

// MARK: - Welcome
struct ArtistProfile: Codable {
    let followers: Followers
    let genres: [String]
    let href: String
    let id: String
    let images: [Image]
    let name: String
    let popularity: Int
    let type, uri: String
}
