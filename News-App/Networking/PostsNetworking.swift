//
//  Networking.swift
//  News-App
//
//  Created by Eldiiar on 2/3/22.
//

import UIKit

protocol NetworkingDelegate {
    func didAddCell(manager: PostsNetworking, model: PostsModel)
}

struct PostsNetworking {
    
    var delegate = NetworkingDelegate?(nil)
    
    let urlString = "https://jsonplaceholder.typicode.com"
    
    func fetchPost() {
        for i in 1...10 {
            let url = URL(string: "\(urlString)/posts/\(i)")
            startURLSession(url: url!)
        }
    }
    
    func startURLSession(url: URL) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            
            if error != nil { return }

            if let data = data {
                if let model = self.parseJSON(data: data) {
                    self.delegate!.didAddCell(manager: self, model: model)
                }
            }
        }
        task.resume()
    }

    func parseJSON(data: Data) -> PostsModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(NetworkData.self, from: data)
            let post = PostsModel(title: decodedData.title, description: decodedData.body, image: UIImage(systemName: "rectangle.fill")!)
            return post
        } catch {
            return nil
        }
    }
}
