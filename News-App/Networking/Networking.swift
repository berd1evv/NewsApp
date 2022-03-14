//
//  Networking.swift
//  News-App
//
//  Created by Eldiiar on 2/3/22.
//

import UIKit

struct Networking {
        
    func postsNetworking(completion: @escaping ([PostsModel]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/") else { return }
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { (data, response, error) in
            if error != nil { return }

            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode([PostsModel].self, from: data)
                    completion(decodedData)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    func commentsNetworking(id: Int, completion: @escaping ([CommentsModel]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(id)/comments") else { return }
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { (data, response, error) in
            if error != nil { return }

            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode([CommentsModel].self, from: data)
                    completion(decodedData)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    func usersNetworking(completion: @escaping ([UsersModel]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { (data, response, error) in
            if error != nil { return }
            
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode([UsersModel].self, from: data)
                    completion(decodedData)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }

}
