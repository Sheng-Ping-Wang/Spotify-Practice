//
//  Songs.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/20.
//

import Foundation

// MARK: - Songs
struct SearchResult: Codable {
    let tracks: Tracks
}

// MARK: - Tracks
struct Tracks: Codable {
    let href: String
    let items: [Item]
    let limit: Int
    let next: String?
    let offset: Int?
    let previous: JSONNull?
    let total: Int?
}

// MARK: - Item
struct Item: Codable {
    var album: Album?
    var artists: [Artist]
    let discNumber, durationMS: Int?
    let explicit: Bool
    let externalIDS: ExternalIDS?
    let href: String?
    let id: String?
    let isLocal: Bool?
    var name: String
    let popularity: Int?
    let preview_url: String?
    let trackNumber: Int?
    let type: ItemType?
    let uri: String?
    
    
}

// MARK: - Album
struct Album: Codable {
    var artists: [Artist]
    let href: String
    let id: String
    var images: [Image]
    let name, releaseDate: String?
    let releaseDatePrecision: ReleaseDatePrecision?
    let totalTracks: Int?
    let uri: String?
}



// MARK: - Artist
struct Artist: Codable {
    let href: String
    var id, name: String
    let type: ArtistType
    let uri: String
}


enum ArtistType: String, Codable {
    case artist = "artist"
}

// MARK: - Image
struct Image: Codable {
    let height: Int?
    var url: String
    let width: Int?
}

enum ReleaseDatePrecision: String, Codable {
    case day = "day"
}

// MARK: - ExternalIDS
struct ExternalIDS: Codable {
    let isrc: String
}

enum ItemType: String, Codable {
    case track = "track"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
