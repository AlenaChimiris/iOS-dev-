//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Алена Чимирис on 17.01.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit
import StorageService

class PostTableViewCell: UITableViewCell {
    
    
     var postView: PostViewModel?
    
   static  var reuseID: String {
        return String(describing: PostTableViewCell.self)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    internal func configure(postView: PostViewModel) {
        self.postView = postView
        
        nameLabelPost.text = postView.author
        imagePost.image = postView.image
        descriptionPost.text = postView.description
        likesPost.text = postView.likes
        viewsPost.text = postView.views
    }
    
    
    private var nameLabelPost: UILabel = {
        let nameLabelPost = UILabel()
        nameLabelPost.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        nameLabelPost.textColor = .black
        nameLabelPost.numberOfLines = 2
        nameLabelPost.translatesAutoresizingMaskIntoConstraints = false
        return nameLabelPost
    }()
    
    
    var imagePost: UIImageView = {
        let imagePost = UIImageView()
        imagePost.contentMode = .scaleAspectFit
        imagePost.backgroundColor = .black
        imagePost.translatesAutoresizingMaskIntoConstraints = false
        return imagePost
    }()
    
    private var descriptionPost: UILabel = {
        let descriptionPost = UILabel()
        descriptionPost.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        descriptionPost.textColor = .systemGray
        descriptionPost.numberOfLines = 0
        descriptionPost.translatesAutoresizingMaskIntoConstraints = false
        return descriptionPost
    }()
    
    private var likesPost: UILabel = {
        let likesPost = UILabel()
        likesPost.font = UIFont.systemFont(ofSize: 16)
        likesPost.textColor = .black
        likesPost.translatesAutoresizingMaskIntoConstraints = false
        return likesPost
    }()
    
    private var viewsPost: UILabel = {
        let viewsPost = UILabel()
        viewsPost.font = UIFont.systemFont(ofSize: 16)
        viewsPost.textColor = .black
        viewsPost.translatesAutoresizingMaskIntoConstraints = false
        return viewsPost
    }()

    
    private func setupLayout() {
        contentView.addSubview(nameLabelPost)
        contentView.addSubview(imagePost)
        contentView.addSubview(descriptionPost)
        contentView.addSubview(likesPost)
        contentView.addSubview(viewsPost)
        
        let const = [
            
            nameLabelPost.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameLabelPost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabelPost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            imagePost.topAnchor.constraint(equalTo: nameLabelPost.bottomAnchor),
            imagePost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imagePost.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            imagePost.trailingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imagePost.heightAnchor.constraint(equalTo: contentView.widthAnchor),
          
            descriptionPost.topAnchor.constraint(equalTo: imagePost.bottomAnchor),
            descriptionPost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),

            likesPost.topAnchor.constraint(equalTo: descriptionPost.bottomAnchor),
            likesPost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),

            viewsPost.topAnchor.constraint(equalTo: descriptionPost.bottomAnchor),
            viewsPost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            viewsPost.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(const)
        
    }
    
}
