//
//  CommentsViewController.swift
//  News-App
//
//  Created by Eldiiar on 27/2/22.
//

import UIKit

class CommentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CommentsNetworkingDelegate{
    
    var tableView = UITableView()
    var products : [CommentsModel] = [CommentsModel]()
    var network = CommentsNetworking()
    var id = 1
    
    var list: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "Comments of the post"
                
        tableView.register(CommentsProductCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        network.delegate = self
        network.fetchComments(commentId: id)

    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = view.frame
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CommentsProductCell
        let currentLastItem = products[indexPath.row]
        cell.product = currentLastItem
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func didAddCell(manager: CommentsNetworking, model: CommentsModel) {
        DispatchQueue.main.async {
            self.products.append(CommentsModel(comments: model.comments, icon: UIImage(systemName: "person.crop.circle")!))
            self.tableView.reloadData()
        }
    }
}
