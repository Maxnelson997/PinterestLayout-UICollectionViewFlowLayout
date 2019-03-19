//
//  PinterestCell.swift
//  pinterest
//
//  Created by Max Nelson on 3/3/19.
//  Copyright © 2019 Maxcodes. All rights reserved.
//

import UIKit

class PinterestCell: UICollectionViewCell {
    
    var image:UIImage! {
        didSet {
            imageView.image = image
        }
    }
    
    fileprivate let imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()
    
    fileprivate lazy var verticalStackView:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageView, horizontalStackView])
        stack.axis = .vertical
        return stack
    }()
    
    fileprivate let label:UILabel = {
        let label = UILabel()
        label.text = "Max Nelson Vlogs"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        return label
    }()
    
    fileprivate let dots:UIButton = {
        let dots = UIButton()
        dots.translatesAutoresizingMaskIntoConstraints = false
        dots.setImage(UIImage(named: "dots")?.withRenderingMode(.alwaysTemplate), for: .normal)
        dots.imageView?.contentMode = .scaleAspectFit
        dots.imageView?.tintColor = .darkGray
        return dots
    }()

    fileprivate lazy var horizontalStackView:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [label, dots])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        

        contentView.addSubview(verticalStackView)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        horizontalStackView.heightAnchor.constraint(equalToConstant: 26).isActive = true
        dots.widthAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 6, left: 4, bottom: 6, right: 4))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
