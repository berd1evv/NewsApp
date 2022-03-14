//
//  NewsProduct.swift
//  News-App
//
//  Created by Eldiiar on 27/2/22.
//

import UIKit
import RealmSwift

class PostsModel: Object, Codable {
    @objc dynamic var userId: Int = 0
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var body: String = ""
}
