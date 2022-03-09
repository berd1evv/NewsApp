//
//  PostViewController.swift
//  News-App
//
//  Created by Eldiiar on 4/3/22.
//

import UIKit


class PostViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NetworkingDelegate {
    
    var tableView = UITableView()
    var products : [PostsModel] = [PostsModel]()
    var network = PostsNetworking()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "Posts"
        
        tableView.register(PostsProductCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        network.delegate = self
        network.fetchPost()
        
        view.addSubview(tableView)

    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = view.frame
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostsProductCell
        let currentLastItem = products[indexPath.row]
        cell.product = currentLastItem
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
    
    func didAddCell(manager: PostsNetworking, model: PostsModel) {
        DispatchQueue.main.async {
            self.products.append(PostsModel(title: model.title, description: model.description, image: UIImage(systemName: "rectangle.fill")!))
            self.tableView.reloadData()
        }
    }
}
