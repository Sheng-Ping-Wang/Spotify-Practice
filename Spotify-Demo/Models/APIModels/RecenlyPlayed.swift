//
//  RecenlyPlayed.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/23.
//

import Foundation

// MARK: - Welcome
struct RecentlyPlayed: Codable {
    let items: [RecentlyPlayedItem]?
    let next: String?
//    let cursors: Cursors
    let limit: Int?
    let href: String?
}

// MARK: - Cursors
struct Cursors: Codable {
    let after, before: String
}

// MARK: - Item
struct RecentlyPlayedItem: Codable {
    let track: Track
    let playedAt: String?
//    let context: JSONNull?

//    enum CodingKeys: String, CodingKey {
//        case track
//        case playedAt = "played_at"
//        case context
//    }
}

// MARK: - Track
struct Track: Codable {
    let album: RecentlyPlayedAlbum
    let artists: [RecentlyPlayedArtist]
//    let availableMarkets: [String]
    let discNumber, durationMS: Int?
    let explicit: Bool
//    let externalIDS: ExternalIDS
//    let externalUrls: ExternalUrls
    let href: String
    let id: String
    let isLocal: Bool?
    let name: String
    let popularity: Int
    let previewURL: String?
    let trackNumber: Int?
    let type: TrackType
    let uri: String?

//    enum CodingKeys: String, CodingKey {
//        case album, artists
//        case availableMarkets = "available_markets"
//        case discNumber = "disc_number"
//        case durationMS = "duration_ms"
//        case explicit
//        case externalIDS = "external_ids"
//        case externalUrls = "external_urls"
//        case href, id
//        case isLocal = "is_local"
//        case name, popularity
//        case previewURL = "preview_url"
//        case trackNumber = "track_number"
//        case type, uri
//    }
}

// MARK: - Album
struct RecentlyPlayedAlbum: Codable {
//    let albumType: AlbumTypeEnum?
    let artists: [Artist]
//    let availableMarkets: [String]
//    let externalUrls: ExternalUrls
    let href: String
    let id: String
    let images: [RecentlyPlayedImage]
    let name, releaseDate: String?
//    let releaseDatePrecision: ReleaseDatePrecision
    let totalTracks: Int?
//    let type: AlbumTypeEnum
    let uri: String

//    enum CodingKeys: String, CodingKey {
//        case albumType = "album_type"
//        case artists
//        case availableMarkets = "available_markets"
//        case externalUrls = "external_urls"
//        case href, id, images, name
//        case releaseDate = "release_date"
//        case releaseDatePrecision = "release_date_precision"
//        case totalTracks = "total_tracks"
//        case type, uri
//    }
}

//enum AlbumTypeEnum: String, Codable {
//    case album = "album"
//    case single = "single"
//}

// MARK: - Artist
struct RecentlyPlayedArtist: Codable {
//    let externalUrls: ExternalUrls
    let href: String
    let id, name: String
//    let type: ArtistType
    let uri: String

//    enum CodingKeys: String, CodingKey {
//        case externalUrls = "external_urls"
//        case href, id, name, type, uri
//    }
}

// MARK: - ExternalUrls
//struct ExternalUrls: Codable {
//    let spotify: String
//}

//enum ArtistType: String, Codable {
//    case artist = "artist"
//}

// MARK: - Image
struct RecentlyPlayedImage: Codable {
    let height: Int
    let url: String
    let width: Int
}

//enum ReleaseDatePrecision: String, Codable {
//    case day = "day"
//    case year = "year"
//}

// MARK: - ExternalIDS
//struct ExternalIDS: Codable {
//    let isrc: String
//}

enum TrackType: String, Codable {
    case track = "track"
}

// MARK: - Encode/decode helpers

//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}

