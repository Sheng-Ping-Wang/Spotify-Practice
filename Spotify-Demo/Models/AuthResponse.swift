//
//  AuthResponse.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/20.
//

import Foundation

struct AuthResponse: Codable {
    let access_token: String
    let expires_in: Int
    let refresh_token: String?
    let scope: String
    let token_type: String
}
