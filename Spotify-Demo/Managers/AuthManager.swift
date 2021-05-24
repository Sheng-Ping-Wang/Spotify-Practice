//
//  AuthManager.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/19.
//

import Foundation

final class AuthManager {
    static let shared = AuthManager()
    
    var refreshingToken = false
    
    struct Constants {
        static let clientID = "b7378db594c84b0189a19110a4c856f3"
        static let clientSecret = "2170f345796f4890882867480d9822b3"
        static let tokenAPIUrl = "https://accounts.spotify.com/api/token"
        static let redirectURI = "https://mark-wang.medium.com/"
        static let scope = "user-read-private%20playlist-modify-public%20playlist-read-private%20playlist-modify-private%20user-follow-read%20user-library-modify%20user-library-read%20user-read-currently-playing%20user-read-playback-state%20user-read-recently-played%20user-follow-modify%20user-read-email"
    }
    
    init() {}
    
    var signInURL: URL? {
        let base = "https://accounts.spotify.com/authorize"
        let string = "\(base)?response_type=code&client_id=\(Constants.clientID)&scope=\(Constants.scope)&redirect_uri=\(Constants.redirectURI)&show_dialog=TRUE"
        return URL(string: string)
    }
    
    var isSignedIn: Bool {
        return accessToken != nil
    }
    
    var accessToken: String? {
        return UserDefaults.standard.string(forKey: "access_token")
    }
    
    var refreshToken: String? {
        return UserDefaults.standard.string(forKey: "refresh_token")
    }
    
    var tokenExpirationDate: Date? {
        return UserDefaults.standard.object(forKey: "expirationData") as? Date
    }
    
    var shouldRefreshToken: Bool {
        guard let expirationData = tokenExpirationDate else { return false }
        let currentDate = Date()
        let fiveMinute: TimeInterval = 300
        return currentDate.addingTimeInterval(fiveMinute) >= expirationData
    }
    
    public func exchangeCodeForToken(code: String, completion: @escaping ((Bool) -> Void)) {
        //get token
        
        guard let url = URL(string: Constants.tokenAPIUrl) else { return }
        
        var component = URLComponents()
        component.queryItems = [
            URLQueryItem(name: "grant_type", value: "authorization_code"),
            URLQueryItem(name: "code", value: code),
            URLQueryItem(name: "redirect_uri", value: "https://mark-wang.medium.com/")
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = component.query?.data(using: .utf8)
        
        let basicToken = Constants.clientID+":"+Constants.clientSecret
        let data = basicToken.data(using: .utf8)
        guard let base64String = data?.base64EncodedString() else {
            print("Failure to get base64")
            completion(false)
            return
        }
        
        request.setValue("Basic \(base64String)", forHTTPHeaderField: "Authorization")
        
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                completion(false)
                return
            }
            do{
                let decoder = JSONDecoder()
                let result = try decoder.decode(AuthResponse.self, from: data)
                self?.cacheToken(result: result)
                completion(true)
            }catch{
                print("Error: \(error.localizedDescription)")
                completion(false)
            }
        }
        task.resume()
        
        
    }
    
    var onRefreshBlocks = [((String) -> Void)]()
    
    
    //Supplies valid token to be used with APICaller
    public func withValidToken(completion: @escaping (String) -> Void) {
        guard !refreshingToken else {
            //append the completion
            onRefreshBlocks.append(completion)
            return
        }
        
        if shouldRefreshToken {
            //refresh
            refreshIfNeeded { success in
                if let token = self.accessToken, success {
                    completion(token)
                }
            }
        }else if let token = self.accessToken {
            completion(token)
        }
    }
    
    public func refreshIfNeeded(completion: @escaping (Bool) -> Void) {
        guard !refreshingToken else { return }
        
        guard shouldRefreshToken else {
            completion(true)
            return
        }
        
        guard let refreshToken = self.refreshToken else { return }
            
        //refresh token
        
        guard let url = URL(string: Constants.tokenAPIUrl) else { return }
        
        refreshingToken = true
        
        var component = URLComponents()
        component.queryItems = [
            URLQueryItem(name: "grant_type", value: "refresh_token"),
            URLQueryItem(name: "refresh_token", value: refreshToken),
            URLQueryItem(name: "redirect_uri", value: "https://mark-wang.medium.com/")
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = component.query?.data(using: .utf8)
        
        let basicToken = Constants.clientID+":"+Constants.clientSecret
        let data = basicToken.data(using: .utf8)
        guard let base64String = data?.base64EncodedString() else {
            print("Failure to get base64")
            completion(false)
            return
        }
        
        request.setValue("Basic \(base64String)", forHTTPHeaderField: "Authorization")
        
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            self?.refreshingToken = false
            guard let data = data, error == nil else {
                completion(false)
                return
            }
            do{
                let decoder = JSONDecoder()
                let result = try decoder.decode(AuthResponse.self, from: data)
//                print("Successfully refreshed")
                self?.onRefreshBlocks.forEach({ $0(result.access_token) })
                self?.onRefreshBlocks.removeAll()
                self?.cacheToken(result: result)
                completion(true)
            }catch{
                print("Error: \(error.localizedDescription)")
                completion(false)
            }
        }
        task.resume()
    }
    
    func cacheToken(result: AuthResponse) {
        UserDefaults.standard.setValue(result.access_token, forKey: "access_token")
        print("accessTokenHere: \(result.access_token)")
        if let refresh_token = result.refresh_token {
            UserDefaults.standard.setValue(refresh_token, forKey: "refresh_token")
        }
        UserDefaults.standard.setValue(Date().addingTimeInterval(TimeInterval(result.expires_in)), forKey: "expirationData")
    }
    
}
