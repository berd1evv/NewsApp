//
//  CommentsViewController.swift
//  News-App
//
//  Created by Eldiiar on 27/2/22.
//

import UIKit
import RealmSwift

class CommentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let realm = try! Realm()
    var comment: Results<CommentsModel>?
        
    var tableView = UITableView()
    var network = Networking()
    
    var id = 1
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Comments of the post"
        
        tableView.register(CommentsProductCell.self, forCellReuseIdentifier: "cell")
        
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        parse()

        render()
    }
    
    func getData(_ data: [CommentsModel]? = nil) {
        guard let data = data else {
            return
        }
        
        if comment != nil {
            try! realm.write {
                realm.delete(comment!)
            }
        }
        
        realm.beginWrite()
        realm.add(data)
        
        try! realm.commitWrite()
        
        tableView.reloadData()
    }
    
    func parse() {
        network.commentsNetworking(id: id) { [weak self] data in
            DispatchQueue.main.async {
                self?.getData(data)
                self?.tableView.reloadData()
            }
        }
    }
    
    func render() {
        comment = realm.objects(CommentsModel.self)
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = view.frame
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comment?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CommentsProductCell
        let item = self.comment?[indexPath.row].body
        cell.setUp(comment: item!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
