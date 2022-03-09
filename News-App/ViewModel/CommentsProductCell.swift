//
//  CommentsProductCell.swift
//  News-App
//
//  Created by Eldiiar on 27/2/22.
//

import UIKit

class CommentsProductCell: UITableViewCell {
    var product : CommentsModel? {
        didSet {
            productComment.text = product?.comments
            productImage.image = product?.icon
        }
    }
    private let productImage : UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "person.fill"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private let productComment : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = .boldSystemFont(ofSize: 20)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(productComment)
        addSubview(productImage)
        
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraints() {
        productImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.left.equalToSuperview().offset(10)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        productComment.snp.makeConstraints { make in
            make.left.equalTo(productImage.snp.right).offset(10)
            make.top.equalToSuperview().offset(30)
        }
    }
    
    
}
