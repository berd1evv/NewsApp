//
//  UserDetailsViewModel.swift
//  News-App
//
//  Created by Eldiiar on 28/2/22.
//

import UIKit

protocol UserDetailsViewModelProtocol {
    var product: UsersDetailsModel? { get set }
    var userName: UILabel { get set }
    var name: UILabel { get set }
    var email: UILabel { get set }
    var phone: UILabel { get set }
    var website: UILabel { get set }
    var company: UILabel { get set }
}

class UserDetailsViewModel: UserDetailsViewModelProtocol {
    
    var product : UsersDetailsModel? {
        didSet {
            userName.text = product?.userName
            name.text = product?.name
            email.text = product?.email
            phone.text = product?.phone
            website.text = product?.website
            company.text = product?.company
        }
    }
    
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
    
    
}
