//
//  Playlist.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/27.
//

import Foundation

// MARK: - Welcome
struct MyPlaylist: Codable {
    let href: String
    let items: [MyPlaylistItem]
    let limit: Int
//    let next: JSONNull?
    let offset: Int
//    let previous: JSONNull?
    let total: Int
}

// MARK: - Item
struct MyPlaylistItem: Codable {
    let addedAt: Date?
    let addedBy: AddedBy?
    let isLocal: Bool?
//    let primaryColor: JSONNull?
    let track: Item?
//    let videoThumbnail: VideoThumbnail

//    enum CodingKeys: String, CodingKey {
//        case addedAt = "added_at"
//        case addedBy = "added_by"
//        case isLocal = "is_local"
//        case primaryColor = "primary_color"
//        case track
//        case videoThumbnail = "video_thumbnail"
//    }
}

// MARK: - AddedBy
struct AddedBy: Codable {
//    let externalUrls: ExternalUrls
    let href: String
    let id: String
//    let type: AddedByType
    let uri: String
    let name: String?

//    enum CodingKeys: String, CodingKey {
//        case externalUrls = "external_urls"
//        case href, id, type, uri, name
//    }
//}

// MARK: - ExternalUrls
//struct ExternalUrls: Codable {
//    let spotify: String
//}

//enum AddedByType: String, Codable {
//    case artist = "artist"
//    case user = "user"
}

// MARK: - Track
struct MyPlaylistTrack: Codable {
    let album: MyPlaylistAlbum?
//    let artists: [AddedBy]
    let availableMarkets: [String]?
    let discNumber, durationMS: Int?
    let episode, explicit: Bool?
//    let externalIDS: ExternalIDS
//    let externalUrls: ExternalUrls
    let href: String
    let id: String?
    let isLocal: Bool?
    let name: String?
    let popularity: Int?
    let preview_url: String?
    let track: Bool?
    let trackNumber: Int?
//    let type: TrackType
    let uri: String?

//    enum CodingKeys: String, CodingKey {
//        case album, artists
//        case availableMarkets = "available_markets"
//        case discNumber = "disc_number"
//        case durationMS = "duration_ms"
//        case episode, explicit
//        case externalIDS = "external_ids"
//        case externalUrls = "external_urls"
//        case href, id
//        case isLocal = "is_local"
//        case name, popularity
//        case previewURL = "preview_url"
//        case track
//        case trackNumber = "track_number"
//        case type, uri
//    }
}

// MARK: - Album
struct MyPlaylistAlbum: Codable {
    let albumType: AlbumTypeEnum?
    let artists: [AddedBy]
    let availableMarkets: [String]?
    let externalUrls: ExternalUrls?
    let href: String?
    let id: String?
    let images: [MyPlaylistImage]?
    let name, releaseDate: String?
//    let releaseDatePrecision: ReleaseDatePrecision
    let totalTracks: Int?
    let type: AlbumTypeEnum?
    let uri: String?

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

enum AlbumTypeEnum: String, Codable {
    case album = "album"
    case compilation = "compilation"
    case single = "single"
}

// MARK: - Image
struct MyPlaylistImage: Codable {
    let height: Int
    let url: String
    let width: Int
}

//enum ReleaseDatePrecision: String, Codable {
//    case day = "day"
//}

// MARK: - ExternalIDS
//struct ExternalIDS: Codable {
//    let isrc: String
//}
//
//enum TrackType: String, Codable {
//    case track = "track"
//}

// MARK: - VideoThumbnail
//struct VideoThumbnail: Codable {
//    let url: JSONNull?
//}

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

