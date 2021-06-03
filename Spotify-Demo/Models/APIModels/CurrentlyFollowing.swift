//
//  CurrentlyFollowing.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/23.
//

import Foundation

// MARK: - Welcome
struct CurrentlyFollowing: Codable {
    let artists: CurrentlyFollowingArtists
}

// MARK: - Artists
struct CurrentlyFollowingArtists: Codable {
    let items: [CurrentlyFollowingItem]
    let total: Int
    let limit: Int
    let href: String
}

// MARK: - Item
struct CurrentlyFollowingItem: Codable {
    let genres: [String]
    let href: String
    let id: String
    let images: [CurrentlyFollowingImage]
    let name: String
    let popularity: Int
    let type, uri: String
}

// MARK: - Followers
struct CurrentlyFollowingFollowers: Codable {
    let total: Int
}

// MARK: - Image
struct CurrentlyFollowingImage: Codable {
    let height: Int
    let url: String
    let width: Int
}

