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
                    let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    print(result)
                }catch{
                    completion(.failure(error))
                }
            }
            task.resume()
        }
        
    }
    
    
    //MARK: Search Song API
    func searchSong(completion: @escaping (Result<SearchSongs, Error>) -> Void) {
        creatRequest(with: URL(string: Constants.baseAPIURL + "/search?q=dance%20monkey&type=track"), type: .GET) { songRequest in
            let task = URLSession.shared.dataTask(with: songRequest) { (data, response, error) in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do{
                    let decoder = JSONDecoder()
                    let song = try decoder.decode(SearchSongs.self, from: data)
                    completion(.success(song))
//                    let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
//                    print("let's seeeeeeeee\(result)")
                }catch{
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    //MARK: Get Category API
    
//    func getCategories(completion: @escaping (Result<Brouse, Error>) -> Void) {
//        creatRequest(with: URL(string: Constants.baseAPIURL + "/browse/categories"), type: .GET) { songRequest in
//            let task = URLSession.shared.dataTask(with: songRequest) { (data, response, error) in
//                guard let data = data, error == nil else {
//                    completion(.failure(APIError.failedToGetData))
//                    return
//                }
//                do{
//                    let decoder = JSONDecoder()
//                    let test = try decoder.decode(Brouse.self, from: data)
//                    completion(.success(test))
////                    let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
////                    print("let's seeeeeeeee\(result)")
//                }catch{
//                    completion(.failure(error))
//                }
//            }
//            task.resume()
//        }
//    }
    
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
    
    func getArtistsList(completion: @escaping (Result<ArtistsList, Error>) -> Void) {
        
        creatRequest(with: URL(string: Constants.baseAPIURL + "/artists/6eUKZXaKkcviH0Ku9w2n3V/related-artists"), type: .GET) { Request in
            let task = URLSession.shared.dataTask(with: Request) { (data, response, error) in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do{
                    let decoder = JSONDecoder()
                    let list = try decoder.decode(ArtistsList.self, from: data)
//                    print(test)
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
