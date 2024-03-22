//
//  ImageLoader.swift
//  GeoWhiz Quiz
//
//  Created by Hassan Mayers on 22/3/24.
//

import UIKit

struct ImageLoader {
    
    static func loadImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            completion(UIImage(data: data))
        }.resume()
    }
}
