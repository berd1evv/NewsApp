//
//  CommentsNetworking.swift
//  News-App
//
//  Created by Eldiiar on 5/3/22.
//

import UIKit

protocol CommentsNetworkingDelegate {
    func didAddCell(manager: CommentsNetworking, model: CommentsModel)
}

struct CommentsNetworking {
    
    var delegate = CommentsNetworkingDelegate?(nil)
    
    let urlString = "https://jsonplaceholder.typicode.com"
    
    func fetchComments(commentId: Int) {
        let url = URL(string: "\(urlString)/posts/\(commentId)/comments")
        for i in 0...4 {
            startURLSession(url: url!, number: i)
        }
    }
    
    func startURLSession(url: URL, number: Int) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in

            if error != nil { return }

            if let data = data {
                if let model = self.parseJSON(data: data, number: number) {
                    self.delegate!.didAddCell(manager: self, model: model)
                }
            }
        }
        task.resume()
    }

    func parseJSON(data: Data, number: Int) -> CommentsModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([CommentsData].self, from: data)
            let post = CommentsModel(comments: decodedData[number].body, icon: UIImage(systemName: "person.crop.circle")!)
            return post
        } catch {
            return nil
        }
    }
}
