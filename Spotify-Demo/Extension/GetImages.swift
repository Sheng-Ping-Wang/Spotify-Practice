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
                    }
                }
            }.resume()
        }
    }
    
}
