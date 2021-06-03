//
//  NewReleasesDetail.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/30.
//

import Foundation

// MARK: - Welcome
struct NewReleasesDetail: Codable {
    let albumType: String?
    let artists: [Artist]
    let availableMarkets: [String]?
    let href: String
    let id: String
    let images: [Image]
    let label, name: String
    let popularity: Int?
    let releaseDate, releaseDatePrecision: String?
    let totalTracks: Int?
    let tracks: Tracks?
    let type, uri: String?
}

