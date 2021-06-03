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
