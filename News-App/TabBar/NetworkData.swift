//
//  NetworkData.swift
//  News-App
//
//  Created by Eldiiar on 2/3/22.
//

import Foundation

struct NetworkData: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

struct UserDetailsData: Decodable {
    let username: String
    let name: String
    let email: String
    let phone: String
    let website: String
    let company: Company
}

struct Company: Decodable {
    let name: String
}

struct CommentsData: Decodable {
    let body: String
}

struct UsersData: Decodable {
    let name: String
    let username: String
}
