//
//  UsersViewController.swift
//  News-App
//
//  Created by Eldiiar on 27/2/22.
//

import UIKit

class UsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UsersNetworkDelegate {
    
    var tableView = UITableView()
    var products : [UsersModel] = [UsersModel]()
    var network = UsersNetworking()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "Users"
        
        tableView.register(UsersProductCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
        network.delegate = self
        network.fetchUsers()
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = view.frame
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UsersProductCell
        let currentLastItem = products[indexPath.row]
        cell.product = currentLastItem
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let destination = UsersDetailsViewController()
        destination.id = indexPath[1] + 1
        navigationController?.pushViewController(destination, animated: true)
    }
    
    func didAddCell(manager: UsersNetworking, model: UsersModel) {
        DispatchQueue.main.async {
            self.products.append(UsersModel(name: model.name, userName: model.userName))
            self.tableView.reloadData()
        }
    }
}
