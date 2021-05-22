//
//  GetImages.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/22.
//

import UIKit

class GetImageView: UIImageView {
    
    var url: URL?
    
    func getImages(url: URL) {
        
        self.url = url
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
            }else if let data = data {
                DispatchQueue.main.async {
                    // 判斷式
                    if url == self.url {
                        let cachedImage = UIImage(data: data)
                        self.image = cachedImage
                    }else{
//                        print("1234")
                    }
                }
            }
        }.resume()
        
        
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
