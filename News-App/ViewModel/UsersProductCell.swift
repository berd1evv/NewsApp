//
//  UsersProductCell.swift
//  News-App
//
//  Created by Eldiiar on 27/2/22.
//

import UIKit

class UsersProductCell: UITableViewCell {
    
    private let productName : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = .boldSystemFont(ofSize: 20)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let productUserName : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(productName)
        addSubview(productUserName)
        
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(name: String, username: String) {
        productName.text = name
        productUserName.text = username
    }
    
    func setUpConstraints() {
        productName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.left.equalToSuperview().offset(20)
        }
        productUserName.snp.makeConstraints { make in
            make.top.equalTo(productName.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(20)
        }
    }
}
