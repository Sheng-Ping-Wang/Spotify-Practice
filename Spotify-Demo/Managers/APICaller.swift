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
    
    enum HTTPMethod: String {
        case GET, POST
    }
    
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
    
}
