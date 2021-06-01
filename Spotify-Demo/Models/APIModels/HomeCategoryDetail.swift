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
//    let externalUrls: ExternalUrls
//    let followers: Followers
    let href: String
    let id: String
    let images: [Image]
    let name: String
//    let owner: Owner
    let primaryColor: String?
    let welcomePublic: Bool?
    let snapshotID: String?
    let tracks: HomeCategoryDetailTracks
    let type, uri: String?
//
//    enum CodingKeys: String, CodingKey {
//        case collaborative
//        case welcomeDescription = "description"
//        case externalUrls = "external_urls"
//        case followers, href, id, images, name, owner
//        case primaryColor = "primary_color"
//        case welcomePublic = "public"
//        case snapshotID = "snapshot_id"
//        case tracks, type, uri
//    }
}

// MARK: - ExternalUrls
//struct ExternalUrls: Codable {
//    let spotify: String
//}

// MARK: - Followers
//struct Followers: Codable {
//    let href: JSONNull?
//    let total: Int
//}

// MARK: - Image
//struct Image: Codable {
//    let height: Int?
//    let url: String
//    let width: Int?
//}

// MARK: - Owner
struct HomeCategoryDetailOwner: Codable {
//    let displayName: String?
//    let externalUrls: ExternalUrls
//    let href: String
//    let id: String
//    let type: OwnerType
//    let uri: String
    let name: String?
//
//    enum CodingKeys: String, CodingKey {
//        case displayName = "display_name"
//        case externalUrls = "external_urls"
//        case href, id, type, uri, name
//    }
}

//enum OwnerType: String, Codable {
//    case artist = "artist"
//    case user = "user"
//}

// MARK: - Tracks
struct HomeCategoryDetailTracks: Codable {
    let href: String
    let items: [HomeCategoryDetailItem]
    let limit: Int
//    let next: JSONNull?
    let offset: Int
//    let previous: JSONNull?
    let total: Int
}

// MARK: - Item
struct HomeCategoryDetailItem: Codable {
    let addedAt: Date?
//    let addedBy: Owner
    let isLocal: Bool?
//    let primaryColor: JSONNull?
    let track: HomeCategoryDetailTrack
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

// MARK: - Track
struct HomeCategoryDetailTrack: Codable {
    let album: HomeCategoryDetailAlbum
//    let artists: [Owner]
    let availableMarkets: [String]?
    let discNumber, durationMS: Int?
    let episode, explicit: Bool?
//    let externalIDS: ExternalIDS
//    let externalUrls: ExternalUrls
    let href: String?
    let id: String
    let isLocal: Bool?
    let name: String
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
struct HomeCategoryDetailAlbum: Codable {
//    let albumType: AlbumTypeEnum
    let artists: [HomeCategoryDetailOwner]
    let availableMarkets: [String]?
//    let externalUrls: ExternalUrls
    let href: String?
    let id: String?
    let images: [Image]
    let name, releaseDate: String?
//    let releaseDatePrecision: ReleaseDatePrecision
    let totalTracks: Int?
//    let type: AlbumTypeEnum
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

//enum AlbumTypeEnum: String, Codable {
//    case album = "album"
//    case compilation = "compilation"
//    case single = "single"
//}

//enum ReleaseDatePrecision: String, Codable {
//    case day = "day"
//    case year = "year"
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
