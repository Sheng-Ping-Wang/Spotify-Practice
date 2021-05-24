//
//  GetImages.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/22.
//

import UIKit

class GetImageView: UIImageView {
    
    static var cache = NSCache<AnyObject, UIImage>()
    var url: URL?
    
    func getImages(url: URL) {
        
        self.url = url
        
        if let cachedImage = GetImageView.cache.object(forKey: self.url as AnyObject) {
            self.image = cachedImage
//            print("You get image from cache")
        }else{
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data, error == nil else {
                    print("Error: \(String(describing: error))")
                    return
                }
                DispatchQueue.main.async {
                    if url == self.url {
                        let cachedImage = UIImage(data: data)
                        self.image = cachedImage
                        GetImageView.cache.setObject(cachedImage!, forKey: url as AnyObject)
//                        print("You get image from \(url)")
                    }
                }
            }.resume()
        }
        
        
        
        
//        APICaller.shared.creatRequest(with: URL(string: url), type: .GET) { songRequest in
//            let task = URLSession.shared.dataTask(with: songRequest) { (data, response, error) in
//                guard let data = data, error == nil else {
//                    completion(.failure(APICaller.APIError.failedToGetData))
//                    return
//                }
//                do{
//                    let decoder = JSONDecoder()
//                    let test = try decoder.decode(Top10Songs.self, from: data)
//                    completion(.success(test))
//                }catch{
//                    print(error)
//                    completion(.failure(error))
//                }
//            }
//            task.resume()
//        }
    }
    
}
