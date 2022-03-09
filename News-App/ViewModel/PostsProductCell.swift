//
//  NewsProductCell.swift
//  News-App
//
//  Created by Eldiiar on 27/2/22.
//

import UIKit
import SnapKit

class PostsProductCell: UITableViewCell {
    var product : PostsModel? {
        didSet {
            productImage.image = product?.image
            productTitle.text = product?.title
            productDescription.text = product?.description
        }
    }
    
    private let productTitle : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = .boldSystemFont(ofSize: 12)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let productDescription : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = .boldSystemFont(ofSize: 20)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let productImage : UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "bch"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(productImage)
        addSubview(productTitle)
        addSubview(productDescription)
        
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraints() {
        productImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(5)
            make.width.equalTo(230)
            make.height.equalTo(230)
        }
        
        productTitle.snp.makeConstraints { make in
            make.top.equalTo(productImage.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        productDescription.snp.makeConstraints { make in
            make.top.equalTo(productTitle.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }
}
