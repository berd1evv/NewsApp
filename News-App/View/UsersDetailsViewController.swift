//
//  UsersDetailsViewController.swift
//  News-App
//
//  Created by Eldiiar on 27/2/22.
//

import UIKit

class UsersDetailsViewController: UIViewController, UsersDetailsNetworkingDelegate {
    
    var network = UsersDetailsNetworking()
    let users = UsersViewController()
    private let viewModel: UserDetailsViewModelProtocol
    
    var id = 1
    
    init(vm: UserDetailsViewModelProtocol = UserDetailsViewModel()){
        viewModel = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        title = "User details"
                
        network.delegate = self
        network.fetchUsers(userId: id)
        
        view.addSubview(viewModel.userName)
        view.addSubview(viewModel.name)
        view.addSubview(viewModel.email)
        view.addSubview(viewModel.phone)
        view.addSubview(viewModel.website)
        view.addSubview(viewModel.company)
        
        setUpConstraints()
    }
    
    @objc func getData(_ notification: NSNotification) {
        print(notification.object.unsafelyUnwrapped)
    }
    
    func didAddCell(manager: UsersDetailsNetworking, model: UsersDetailsModel) {
        DispatchQueue.main.async {
            self.viewModel.userName.text = model.userName
            self.viewModel.name.text = model.name
            self.viewModel.email.text = model.email
            self.viewModel.phone.text = model.phone
            self.viewModel.website.text = model.website
            self.viewModel.company.text = model.company

        }
    }
    
    func setUpConstraints() {
        viewModel.userName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.centerX.equalToSuperview()
        }
        
        viewModel.name.snp.makeConstraints { make in
            make.top.equalTo(viewModel.userName.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        viewModel.email.snp.makeConstraints { make in
            make.top.equalTo(viewModel.name.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        viewModel.phone.snp.makeConstraints { make in
            make.top.equalTo(viewModel.email.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        viewModel.website.snp.makeConstraints { make in
            make.top.equalTo(viewModel.phone.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        viewModel.company.snp.makeConstraints { make in
            make.top.equalTo(viewModel.website.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
}
