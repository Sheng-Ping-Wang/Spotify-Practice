//
//  Brouse.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/21.
//

import Foundation

// MARK: - Welcome
struct Brouse: Codable {
    let categories: Categories
}

// MARK: - Categories
struct Categories: Codable {
    let href: String
    let items: [BrouseItem]
    let limit: Int
    let next: String
    let offset: Int
    let total: Int
}

// MARK: - Item
struct BrouseItem: Codable {
    let href: String
    let icons: [BrouseIcon]
    let id, name: String
}

// MARK: - Icon
struct BrouseIcon: Codable {
    let height: Int?
    let url: String
    let width: Int?
}
