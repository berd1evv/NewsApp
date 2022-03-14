//
//  CommentsProduct.swift
//  News-App
//
//  Created by Eldiiar on 27/2/22.
//

import UIKit
import RealmSwift

class CommentsModel: Object, Codable {
    @objc dynamic var body: String = ""
}
