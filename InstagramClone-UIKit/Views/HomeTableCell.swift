//
//  HomeTableCell.swift
//  InstagramClone-UIKit
//
//  Created by Erick Harris on 11/26/19.
//  Copyright © 2019 Erick Harris. All rights reserved.
//

import UIKit

class HomeTableCell: UITableViewCell {
    
    var post: Post!
    var postDelegate: PostDelegate!
    
    var cellHeaderContainer: UIView!
    var profileImage: UIImageView!
    var nameLabel: UILabel!
    var actionsButton: UIButton!
    
    var contentImage: UIImageView!

    var likeButton: UIButton!
    var commentButton: UIButton!
    var dmButton: UIButton!
    var bookmarkButton: UIButton!
    var likesLabel: UILabel!
    var captionLabel: UILabel!
    
    var allCommentsButton: UIButton!
    var timeLabel: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        // MARK: Root View
        selectionStyle = .none
        
        // MARK: Cell Header Container
        cellHeaderContainer = UIView()
        cellHeaderContainer.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: Profile Image
        profileImage = UIImageView()
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.contentMode = .scaleAspectFill
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = 15
        
        // MARK: Profile Name
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = .black
        nameLabel.font = UIFont.boldSystemFont(ofSize: 13.0)
        
        // MARK: Actions Button
        actionsButton = UIButton()
        actionsButton.translatesAutoresizingMaskIntoConstraints = false
        actionsButton.setImage(UIImage(named: "dots"), for: .normal)
        
        // MARK: Content Image
        contentImage = UIImageView()
        contentImage.translatesAutoresizingMaskIntoConstraints = false
        contentImage.contentMode = .scaleAspectFill
        contentImage.clipsToBounds = true
        
        // MARK: Like Button
        likeButton = UIButton()
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.setImage(UIImage(named: "heart"), for: .normal)
        likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        
        // MARK: Comment Button
        commentButton = UIButton()
        commentButton.translatesAutoresizingMaskIntoConstraints = false
        commentButton.setImage(UIImage(named: "comment"), for: .normal)
        
        // MARK: DM Button
        dmButton = UIButton()
        dmButton.translatesAutoresizingMaskIntoConstraints = false
        dmButton.setImage(UIImage(named: "dm"), for: .normal)
        
        // MARK: Bookmark Button
        bookmarkButton = UIButton()
        bookmarkButton.translatesAutoresizingMaskIntoConstraints = false
        bookmarkButton.setImage(UIImage(named: "bookmark"), for: .normal)
        
        // MARK: Likes Label
        likesLabel = UILabel()
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        likesLabel.textColor = .black
        likesLabel.font = UIFont.systemFont(ofSize: 13.0)
        likesLabel.numberOfLines = 0
        
        // MARK: Caption Label
        captionLabel = UILabel()
        captionLabel.translatesAutoresizingMaskIntoConstraints = false
        captionLabel.textColor = .black
        captionLabel.font = UIFont.systemFont(ofSize: 13.0)
        captionLabel.numberOfLines = 0
        
        // MARK: All Comments Button
        allCommentsButton = UIButton()
        allCommentsButton.translatesAutoresizingMaskIntoConstraints = false
        allCommentsButton.titleLabel?.font = UIFont.systemFont(ofSize: 13.0)
        
        // MARK: Time Label
        timeLabel = UILabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.textColor = .gray
        timeLabel.font = UIFont.systemFont(ofSize: 11.0)
        
        // MARK: View Hierarchy
        addSubview(cellHeaderContainer)
        
        cellHeaderContainer.addSubview(profileImage)
        cellHeaderContainer.addSubview(nameLabel)
        cellHeaderContainer.addSubview(actionsButton)
        
        addSubview(contentImage)
        
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(dmButton)
        addSubview(bookmarkButton)
        
        addSubview(likesLabel)
        addSubview(captionLabel)
        addSubview(allCommentsButton)
        addSubview(timeLabel)
    }
    
    private func setupConstraints() {
        // Constraints With Priority
        let contentHeightConstraint = contentImage.heightAnchor.constraint(lessThanOrEqualToConstant: 500)
        contentHeightConstraint.priority = UILayoutPriority(999)
        
        NSLayoutConstraint.activate([
            // MARK: Cell Header Container
            cellHeaderContainer.topAnchor.constraint(equalTo: topAnchor),
            cellHeaderContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellHeaderContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellHeaderContainer.heightAnchor.constraint(equalToConstant: 50),
            
            // MARK: Profile Image
            profileImage.leadingAnchor.constraint(equalTo: cellHeaderContainer.leadingAnchor, constant: 10),
            profileImage.centerYAnchor.constraint(equalTo: cellHeaderContainer.centerYAnchor),
            profileImage.heightAnchor.constraint(equalToConstant: 30),
            profileImage.widthAnchor.constraint(equalToConstant: 30),
            
            // MARK: Profile Name
            nameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 10),
            nameLabel.centerYAnchor.constraint(equalTo: cellHeaderContainer.centerYAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: actionsButton.trailingAnchor, constant: -10),
            
            // MARK: Actions Button
            actionsButton.trailingAnchor.constraint(equalTo: cellHeaderContainer.trailingAnchor, constant: -10),
            actionsButton.centerYAnchor.constraint(equalTo: cellHeaderContainer.centerYAnchor),
            actionsButton.heightAnchor.constraint(equalToConstant: 25),
            actionsButton.widthAnchor.constraint(equalToConstant: 25),
            
            // MARK: Content Image
            contentImage.topAnchor.constraint(equalTo: cellHeaderContainer.bottomAnchor),
            contentImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentHeightConstraint,
            
            // MARK: Like Button
            likeButton.topAnchor.constraint(equalTo: contentImage.bottomAnchor, constant: 10),
            likeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            likeButton.heightAnchor.constraint(equalToConstant: 30),
            likeButton.widthAnchor.constraint(equalToConstant: 30),
            
            // MARK: Comment Button
            commentButton.topAnchor.constraint(equalTo: contentImage.bottomAnchor, constant: 10),
            commentButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 10),
            commentButton.heightAnchor.constraint(equalToConstant: 30),
            commentButton.widthAnchor.constraint(equalToConstant: 30),
            
            // MARK: DM Button
            dmButton.topAnchor.constraint(equalTo: contentImage.bottomAnchor, constant: 10),
            dmButton.leadingAnchor.constraint(equalTo: commentButton.trailingAnchor, constant: 10),
            dmButton.heightAnchor.constraint(equalToConstant: 30),
            dmButton.widthAnchor.constraint(equalToConstant: 30),
            
            // MARK: Bookmark Button
            bookmarkButton.topAnchor.constraint(equalTo: contentImage.bottomAnchor, constant: 10),
            bookmarkButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            bookmarkButton.heightAnchor.constraint(equalToConstant: 30),
            bookmarkButton.widthAnchor.constraint(equalToConstant: 30),
            
            // MARK: Likes Label
            likesLabel.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 10),
            likesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            likesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            // MARK: Caption Label
            captionLabel.topAnchor.constraint(equalTo: likesLabel.bottomAnchor, constant: 5),
            captionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            captionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            // MARK: All Comments Button
            allCommentsButton.topAnchor.constraint(equalTo: captionLabel.bottomAnchor, constant: 5),
            allCommentsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            // MARK: Time Label
            timeLabel.topAnchor.constraint(equalTo: allCommentsButton.bottomAnchor, constant: 5),
            timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            timeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
    }
    
    public func setupData(post: Post) {
        // MARK: Post
        self.post = post
        
        // MARK: Profile Image
        profileImage.image = UIImage(named: "Profile Picture \(post.profileId)")
        
        // MARK: Profile Name
        nameLabel.text = post.profileName
        
        // MARK: Content Image
        contentImage.image = UIImage(named: "Content Post \(post.contentId)")
        
        // MARK: Like Button
        if post.isLiked {
            likeButton.setImage(UIImage(named: "heart-filled")?.withTintColor(.red, renderingMode: .alwaysOriginal), for: .normal)
        }
        else {
            likeButton.setImage(UIImage(named: "heart")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        }
        
        // MARK: Likes Label
        let randomLike = post.likes[Int.random(in: 0..<post.likes.count)]
        
        let likesString = NSMutableAttributedString(string: "Liked by ")
        likesString.append(NSAttributedString(string: randomLike, attributes: [.font: UIFont.boldSystemFont(ofSize: 13.0)]))
        likesString.append(NSAttributedString(string: " and "))
        likesString.append(NSAttributedString(string: "others", attributes: [.font: UIFont.boldSystemFont(ofSize: 13.0)]))
        likesLabel.attributedText = likesString
        
        // MARK: Caption Label
        let captionString = NSMutableAttributedString(string: post.profileName, attributes: [.font: UIFont.boldSystemFont(ofSize: 13.0)])
        captionString.append(NSAttributedString(string: " " + post.caption))
        captionLabel.attributedText = captionString
        
        // MARK: All Comments Button
        allCommentsButton.setAttributedTitle(NSAttributedString(string: "View all \(post.comments.count) comments", attributes: [.foregroundColor: UIColor.gray]), for: .normal)
        
        // MARK: Time Label
        timeLabel.text = "10 minutes ago"
    }
    
    @objc func likeButtonTapped(sender: UIButton) {
        if post.isLiked {
            postDelegate.didUnlikePost(unlikedPost: post)
        }
        else {
            postDelegate.didLikePost(likedPost: post)
        }
    }
}
