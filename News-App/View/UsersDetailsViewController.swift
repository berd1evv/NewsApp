//
//  UsersDetailsViewController.swift
//  News-App
//
//  Created by Eldiiar on 27/2/22.
//

import UIKit
import RealmSwift

class UsersDetailsViewController: UIViewController {
    let realm = try! Realm()
    var details: Results<UsersModel>?
    
    var network = Networking()
    var id = 1
    
    var userName : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var name : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var email : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var phone : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    var website : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    var company : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        title = "User details"
        
        view.addSubview(userName)
        view.addSubview(name)
        view.addSubview(email)
        view.addSubview(phone)
        view.addSubview(website)
        view.addSubview(company)
        
        render()
        setUpConstraints()
        
        didSetTitle()
    }
    
    func getData(_ data: [UsersModel]? = nil) {
        guard let data = data else {
            return
        }
        
        if details != nil {
            try! realm.write {
                realm.delete(details!)
            }
        }
        
        try! realm.write({
            realm.add(data)
        })
    }
    
    func parse() {
        network.usersNetworking() { [weak self] data in
            DispatchQueue.main.async {
                self?.getData(data)
            }
        }
    }
    
    func render() {
        details = realm.objects(UsersModel.self)
    }

    func didSetTitle() {
        userName.text = details?[id].username
        name.text = details?[id].name
        email.text = details?[id].email
        phone.text = details?[id].phone
        website.text = details?[id].website
        company.text = details?[id].company?.name
    }
    
    func setUpConstraints() {
        userName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.centerX.equalToSuperview()
        }
        
        name.snp.makeConstraints { make in
            make.top.equalTo(userName.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        email.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        phone.snp.makeConstraints { make in
            make.top.equalTo(email.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        website.snp.makeConstraints { make in
            make.top.equalTo(phone.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        company.snp.makeConstraints { make in
            make.top.equalTo(website.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
}
