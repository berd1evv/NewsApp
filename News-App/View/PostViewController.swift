//
//  PostViewController.swift
//  News-App
//
//  Created by Eldiiar on 4/3/22.
//

import UIKit
import RealmSwift

class PostViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let realm = try! Realm()
    var posts: Results<PostsModel>?
    
    var tableView = UITableView()
    var network = Networking()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Posts"
        
        tableView.register(PostsProductCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
      
        view.addSubview(tableView)
        
        parse()
        render()
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = view.frame
    }
    
    func getData(_ data: [PostsModel]? = nil) {
        guard let data = data else {
            return
        }
        
        if posts != nil {
            try! realm.write {
                realm.delete(posts!)
            }
        }
        
        realm.beginWrite()
        realm.add(data)
        
        try! realm.commitWrite()
        
        tableView.reloadData()
    }
    
    func parse() {
        network.postsNetworking() { [weak self] data in
            DispatchQueue.main.async {
                self?.getData(data)
                self?.tableView.reloadData()
            }
        }
    }
    
    func render() {
        posts = realm.objects(PostsModel.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostsProductCell
        let item = posts?[indexPath.row]
        cell.setUp(title: item!.title, description: item!.title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 360
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let destination = CommentsViewController()
        destination.id = indexPath[1] + 1
        navigationController?.pushViewController(destination, animated: true)
    }
    
}
