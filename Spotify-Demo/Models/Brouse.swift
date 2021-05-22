//
//  Brouse.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/21.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

//import Foundation
//
//// MARK: - Welcome
//struct Brouse: Codable {
//    let categories: Categories
//}
//
//// MARK: - Categories
//struct Categories: Codable {
//    let href: String
//    let items: [BrouseItem]
//    let limit: Int
//    let next: String
//    let offset: Int
////    let previous: JSONNull?
//    let total: Int
//}
//
//// MARK: - Item
//struct BrouseItem: Codable {
//    let href: String
//    let icons: [Icon]
//    let id, name: String
//}
//
//// MARK: - Icon
//struct Icon: Codable {
//    let height: Int?
//    let url: String
//    let width: Int?
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
