//
//  APICaller.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/19.
//

import Foundation

class APICaller {
    static let shared = APICaller()
    
    init() {}
    
    struct Constants {
        static let baseAPIURL = "https://api.spotify.com/v1"
    }
    
    enum APIError: Error {
        case failedToGetData
    }
    
    enum HTTPMethod: String {
        case GET, POST
    }
    
    //MARK: Creat URL Request
    func creatRequest(with url: URL?, type: HTTPMethod, completion: @escaping (URLRequest) -> Void) {
        AuthManager.shared.withValidToken { token in
            guard let apiURL = url else { return }
            var request = URLRequest(url: apiURL)
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            request.httpMethod = type.rawValue
            request.timeoutInterval = 30
            completion(request)
        }
    }
    
    //MARK: Get User Profile
    func getCurrentUserProfile(completion: @escaping (Result<UserProfile, Error>) -> Void) {
        creatRequest(with: URL(string: Constants.baseAPIURL + "/me"), type: .GET) { baseRequest in
            let task = URLSession.shared.dataTask(with: baseRequest) { (data, response, error) in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do{
                    let decoder = JSONDecoder()
                    let profile = try decoder.decode(UserProfile.self, from: data)
                    completion(.success(profile))
                }catch{
                    completion(.failure(error))
                }
            }
            task.resume()
        }
        
    }
    
    
    //MARK: Search Song API
    func searchSong(text: String, completion: @escaping (Result<SearchResult, Error>) -> Void) {
        creatRequest(with: URL(string: Constants.baseAPIURL + "/search?q=\(text)&type=track%2Cartist"), type: .GET) { songRequest in
            let task = URLSession.shared.dataTask(with: songRequest) { (data, response, error) in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do{
                    let decoder = JSONDecoder()
                    let song = try decoder.decode(SearchResult.self, from: data)
                    completion(.success(song))
                }catch{
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    //MARK: Get Category API
    
    func getCategories(completion: @escaping (Result<Brouse, Error>) -> Void) {
        creatRequest(with: URL(string: Constants.baseAPIURL + "/browse/categories?country=TW"), type: .GET) { songRequest in
            let task = URLSession.shared.dataTask(with: songRequest) { (data, response, error) in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do{
                    let decoder = JSONDecoder()
                    let test = try decoder.decode(Brouse.self, from: data)
                    completion(.success(test))
                }catch{
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    func getRankAPI(completion: @escaping (Result<RankPlaylist, Error>) -> Void) {
        
        creatRequest(with: URL(string: Constants.baseAPIURL + "/browse/featured-playlists?country=TW"), type: .GET) { songRequest in
            let task = URLSession.shared.dataTask(with: songRequest) { (data, response, error) in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do{
                    let decoder = JSONDecoder()
                    let songs = try decoder.decode(RankPlaylist.self, from: data)
//                    print(test)
                    completion(.success(songs))
                }catch{
                    print(error)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    func getArtistsList(id: String, completion: @escaping (Result<ArtistsList, Error>) -> Void) {
        
        creatRequest(with: URL(string: Constants.baseAPIURL + "/artists/\(id)/related-artists"), type: .GET) { ArtistsListRequest in
            let task = URLSession.shared.dataTask(with: ArtistsListRequest) { (data, response, error) in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do{
                    let decoder = JSONDecoder()
                    let list = try decoder.decode(ArtistsList.self, from: data)
                    completion(.success(list))
                }catch{
                    print(error)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    func getRecentlyPlayed(completion: @escaping (Result<RecentlyPlayed, Error>) -> Void) {
        
        creatRequest(with: URL(string: Constants.baseAPIURL + "/me/player/recently-played"), type: .GET) { Request in
            let task = URLSession.shared.dataTask(with: Request) { (data, response, error) in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do{
                    let decoder = JSONDecoder()
                    let list = try decoder.decode(RecentlyPlayed.self, from: data)
                    completion(.success(list))
                }catch{
                    print(error)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    func getNewReleases(completion: @escaping (Result<NewReleases, Error>) -> Void) {
        
        creatRequest(with: URL(string: Constants.baseAPIURL + "/browse/new-releases?country=TW"), type: .GET) { Request in
            let task = URLSession.shared.dataTask(with: Request) { (data, response, error) in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do{
                    let decoder = JSONDecoder()
                    let list = try decoder.decode(NewReleases.self, from: data)
                    completion(.success(list))
                }catch{
                    print(error)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    func getCurrentlylyFollowing(completion: @escaping (Result<CurrentlyFollowing, Error>) -> Void) {
        
        creatRequest(with: URL(string: Constants.baseAPIURL + "/me/following?type=artist"), type: .GET) { Request in
            let task = URLSession.shared.dataTask(with: Request) { (data, response, error) in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do{
                    let decoder = JSONDecoder()
                    let list = try decoder.decode(CurrentlyFollowing.self, from: data)
                    completion(.success(list))
                }catch{
                    print(error)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    func getCurrentUserPlaylist(completion: @escaping (Result<Library, Error>) -> Void) {
        
        creatRequest(with: URL(string: Constants.baseAPIURL + "/me/playlists"), type: .GET) { Request in
            let task = URLSession.shared.dataTask(with: Request) { (data, response, error) in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do{
                    let decoder = JSONDecoder()
                    let list = try decoder.decode(Library.self, from: data)
                    completion(.success(list))
                }catch{
                    print(error)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    func getArtistTopTracks(id: String, completion: @escaping (Result<ArtistTopTracks, Error>) -> Void) {
        
        creatRequest(with: URL(string: Constants.baseAPIURL + "/artists/\(id)/top-tracks?market=TW"), type: .GET) { Request in
            let task = URLSession.shared.dataTask(with: Request) { (data, response, error) in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do{
                    let decoder = JSONDecoder()
                    let list = try decoder.decode(ArtistTopTracks.self, from: data)
                    completion(.success(list))
                }catch{
                    print(error)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    func getMyPlaylist(url: String, completion: @escaping (Result<MyPlaylist, Error>) -> Void) {
        
        creatRequest(with: URL(string: url), type: .GET) { Request in
            let task = URLSession.shared.dataTask(with: Request) { (data, response, error) in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do{
                    let decoder = JSONDecoder()
                    let list = try decoder.decode(MyPlaylist.self, from: data)
                    completion(.success(list))
                }catch{
                    print(error)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
}
