//
//  UsersProduct.swift
//  News-App
//
//  Created by Eldiiar on 27/2/22.
//

import Foundation
import RealmSwift

class UsersModel: Object, Codable {
    @objc dynamic var username: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var phone: String = ""
    @objc dynamic var website: String = ""
    @objc dynamic var company: Company?
}

class Company: Object, Codable {
    @objc dynamic var name: String = ""
}
