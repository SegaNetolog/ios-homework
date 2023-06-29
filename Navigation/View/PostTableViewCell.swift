//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Sergey Bragin on 14.06.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    var tapHandler: (() -> Void)? = nil
    var tapLikes: (() -> Void)? = nil
    
    private lazy var likes: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(labelTapped)))
        label.isUserInteractionEnabled = true
        return label
        
    }()
    
    private let views: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.systemGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    private let layoutLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var postImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showDetailPost)))
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    private let authorName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(model: Post) {
        
        likes.text = "Likes: "
        + String( model.likes)
        
        views.text = "Views: "
        + String(model.views)
        
        postImage.image = UIImage(named: model.image)
        authorName.text = model.author
        descriptionText.text = model.description
    }
    
    private func layout() {
        [layoutLine, authorName,postImage, descriptionText, likes, views].forEach { contentView.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            layoutLine.topAnchor.constraint(equalTo: contentView.topAnchor),
            layoutLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            layoutLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            layoutLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            postImage.topAnchor.constraint(equalTo: authorName.bottomAnchor, constant: 10),
            postImage.leadingAnchor.constraint(equalTo: layoutLine.leadingAnchor),
            postImage.trailingAnchor.constraint(equalTo: layoutLine.trailingAnchor),
            postImage.heightAnchor.constraint(equalTo: postImage.widthAnchor),
            
            
            authorName.topAnchor.constraint(equalTo: layoutLine.topAnchor, constant: 20),
            authorName.leadingAnchor.constraint(equalTo: layoutLine.leadingAnchor, constant: 15),
            
      
            descriptionText.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 10),
            descriptionText.leadingAnchor.constraint(equalTo: layoutLine.leadingAnchor, constant: 20),
            descriptionText.trailingAnchor.constraint(equalTo: layoutLine.trailingAnchor),
            descriptionText.heightAnchor.constraint(equalToConstant: 60),
            
            likes.topAnchor.constraint(equalTo: descriptionText.bottomAnchor),
            likes.leadingAnchor.constraint(equalTo: layoutLine.leadingAnchor, constant: 20),
            likes.heightAnchor.constraint(equalToConstant: 50),
            likes.bottomAnchor.constraint(equalTo: layoutLine.bottomAnchor),
            
            views.topAnchor.constraint(equalTo: descriptionText.bottomAnchor),
            views.trailingAnchor.constraint(equalTo: layoutLine.trailingAnchor, constant: -20),
            views.heightAnchor.constraint(equalToConstant: 50),
            views.bottomAnchor.constraint(equalTo: likes.bottomAnchor)
        ])
    }
    @objc func showDetailPost() {
        if let action = self.tapHandler { action() }
    }
    
    @objc func labelTapped() {
        if let action = self.tapLikes { action() }
    }
    
}
