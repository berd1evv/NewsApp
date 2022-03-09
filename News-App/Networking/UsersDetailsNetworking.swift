//
//  UsersDetailsNetworking.swift
//  News-App
//
//  Created by Eldiiar on 5/3/22.
//

import Foundation

protocol UsersDetailsNetworkingDelegate {
    func didAddCell(manager: UsersDetailsNetworking, model: UsersDetailsModel)
}

struct UsersDetailsNetworking {
    
    var delegate = UsersDetailsNetworkingDelegate?(nil)
    
    let urlString = "https://jsonplaceholder.typicode.com"
    
    func fetchUsers(userId: Int) {
        let url = URL(string: "\(urlString)/users/\(userId)")
        startURLSession(url: url!)
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

    func parseJSON(data: Data) -> UsersDetailsModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(UserDetailsData.self, from: data)
            let post = UsersDetailsModel(userName: decodedData.username, name: decodedData.name, email: decodedData.email, phone: decodedData.phone, website: decodedData.website, company: decodedData.company.name)
            return post
        } catch {
            return nil
        }
    }
}
