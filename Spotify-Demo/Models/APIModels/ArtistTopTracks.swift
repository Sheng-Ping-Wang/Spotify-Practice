//
//  ArtistTopTracks.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/27.
//

import Foundation

// MARK: - Welcome
struct ArtistTopTracks: Codable {
    let tracks: [Item]
}

// MARK: - Track
//struct TopTrack: Codable {
//    let album: TopAlbum
//    let artists: [TopArtist]
//    let discNumber, durationMS: Int?
//    let explicit: Bool?
//    let externalIDS: ExternalIDS
//    let externalUrls: ExternalUrls
//    let href: String?
//    let id: String
//    let isLocal, isPlayable: Bool?
//    let name: String
//    let popularity: Int
//    let previewURL: String?
//    let trackNumber: Int?
//    let type: TrackType
//    let uri: String?

//    enum CodingKeys: String, CodingKey {
//        case album, artists
//        case discNumber = "disc_number"
//        case durationMS = "duration_ms"
//        case explicit
//        case externalIDS = "external_ids"
//        case externalUrls = "external_urls"
//        case href, id
//        case isLocal = "is_local"
//        case isPlayable = "is_playable"
//        case name, popularity
//        case previewURL = "preview_url"
//        case trackNumber = "track_number"
//        case type, uri
//    }
//}

// MARK: - Album
//struct TopAlbum: Codable {
//    let albumType: AlbumType?
//    let artists: [TopArtist]
//    let externalUrls: ExternalUrls
//    let href: String
//    let id: String
//    let images: [TopImage]
//    let name, releaseDate: String?
//    let releaseDatePrecision: ReleaseDatePrecision
//    let totalTracks: Int?
//    let type: AlbumTypeEnum
//    let uri: String?

//    enum CodingKeys: String, CodingKey {
//        case albumType = "album_type"
//        case artists
//        case externalUrls = "external_urls"
//        case href, id, images, name
//        case releaseDate = "release_date"
//        case releaseDatePrecision = "release_date_precision"
//        case totalTracks = "total_tracks"
//        case type, uri
//    }
//}

//enum AlbumType: String, Codable {
//    case single = "single"
//}

// MARK: - Artist
//struct TopArtist: Codable {
//    let externalUrls: ExternalUrls
//    let href: String
//    let id: TopID
//    let name: String
//    let type: ArtistType
//    let uri: URI

//    enum CodingKeys: String, CodingKey {
//        case externalUrls = "external_urls"
//        case href, id, name, type, uri
//    }
//}

// MARK: - ExternalUrls
//struct ExternalUrls: Codable {
//    let spotify: String
//}

//enum TopID: String, Codable {
//    case the2NjfBq1NflQcKSEIDooVjY = "2NjfBq1NflQcKSeiDooVjY"
//}
//
//enum TopName: String, Codable {
//    case tonesAndI = "Tones And I"
//}

//enum ArtistType: String, Codable {
//    case artist = "artist"
//}

//enum URI: String, Codable {
//    case spotifyArtist2NjfBq1NflQcKSEIDooVjY = "spotify:artist:2NjfBq1NflQcKSeiDooVjY"
//}

// MARK: - Image
//struct TopImage: Codable {
//    let height: Int
//    let url: String
//    let width: Int
//}

//enum ReleaseDatePrecision: String, Codable {
//    case day = "day"
//}

//enum AlbumTypeEnum: String, Codable {
//    case album = "album"
//}

// MARK: - ExternalIDS
//struct ExternalIDS: Codable {
//    let isrc: String
//}
//
//enum TrackType: String, Codable {
//    case track = "track"
//}

