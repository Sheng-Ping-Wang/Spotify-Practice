//
//  ArtistProfile.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/6/1.
//

import Foundation

// MARK: - Welcome
struct ArtistProfile: Codable {
//    let externalUrls: ExternalUrls
    let followers: Followers
    let genres: [String]
    let href: String
    let id: String
    let images: [Image]
    let name: String
    let popularity: Int
    let type, uri: String

//    enum CodingKeys: String, CodingKey {
//        case externalUrls = "external_urls"
//        case followers, genres, href, id, images, name, popularity, type, uri
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
//    let height: Int
//    let url: String
//    let width: Int
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
//
