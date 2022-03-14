//
//  UsersViewController.swift
//  News-App
//
//  Created by Eldiiar on 27/2/22.
//

import UIKit
import RealmSwift

class UsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let realm = try! Realm()
    var users: Results<UsersModel>?
    
    var tableView = UITableView()
    var network = Networking()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Users"
        
        tableView.register(UsersProductCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
        parse()
        render()
    }
    
    func render() {
        users = realm.objects(UsersModel.self)
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = view.frame
    }
    
    func getData(_ data: [UsersModel]? = nil) {
        guard let data = data else {
            return
        }
        
        if users != nil {
            try! realm.write {
                realm.delete(users!)
            }
        }
        
        try! realm.write({
            realm.add(data)
        })
        
        tableView.reloadData()
    }
    
    func parse() {
        network.usersNetworking() { [weak self] data in
            DispatchQueue.main.async {
                self?.getData(data)
                self?.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UsersProductCell
        let item = users?[indexPath.row]
        cell.setUp(name: item!.name, username: item!.username)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let destination = UsersDetailsViewController()
        destination.id = indexPath[1]
        
        navigationController?.pushViewController(destination, animated: true)
    }
}
