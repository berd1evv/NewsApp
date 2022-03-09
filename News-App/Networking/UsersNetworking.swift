//
//  UsersNetworking.swift
//  News-App
//
//  Created by Eldiiar on 5/3/22.
//

import UIKit

protocol UsersNetworkDelegate {
    func didAddCell(manager: UsersNetworking, model: UsersModel)
}

struct UsersNetworking {
    
    var delegate = UsersNetworkDelegate?(nil)
    
    let urlString = "https://jsonplaceholder.typicode.com"
    
    mutating func fetchUsers() {
        var url = URL(string: "")
        for i in 0...9 {
            url = URL(string: "\(urlString)/users")
            let num = i
            startURLSession(url: url!, num: num)
        }
        
    }
    
    func startURLSession(url: URL, num: Int) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in

            if error != nil { return }
            
            if let data = data {
                if let model = self.parseJSON(data: data, num: num) {
                    self.delegate!.didAddCell(manager: self, model: model)
                }
            }
        }
        task.resume()
    }

    func parseJSON(data: Data, num: Int) -> UsersModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([UsersData].self, from: data)
            let post = UsersModel(name: decodedData[num].name, userName: decodedData[num].username)
            return post
        } catch {
            return nil
        }
    }
}
