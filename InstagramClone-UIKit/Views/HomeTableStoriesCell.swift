//
//  HomeTableStoriesCell.swift
//  InstagramClone-UIKit
//
//  Created by Erick Harris on 11/26/19.
//  Copyright © 2019 Erick Harris. All rights reserved.
//

import UIKit

class HomeTableStoriesCell: UICollectionViewCell {
    
    var storyRingImage: UIImageView!
    var profileImage: UIImageView!
    var nameLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        // MARK: Story Ring Image
        storyRingImage = UIImageView()
        storyRingImage.translatesAutoresizingMaskIntoConstraints = false
        storyRingImage.contentMode = .scaleAspectFill
        storyRingImage.layer.masksToBounds = true
        storyRingImage.layer.cornerRadius = 30
        storyRingImage.image = UIImage(named: "story-ring")
        
        // MARK: Profile Image
        profileImage = UIImageView()
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.contentMode = .scaleAspectFill
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = 27
        
        // MARK: Name Label
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 12.0)
        
        // MARK: View Hierarchy
        addSubview(storyRingImage)
        addSubview(profileImage)
        addSubview(nameLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            storyRingImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            storyRingImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            storyRingImage.heightAnchor.constraint(equalToConstant: 60),
            storyRingImage.widthAnchor.constraint(equalToConstant: 60),
            
            profileImage.centerYAnchor.constraint(equalTo: storyRingImage.centerYAnchor),
            profileImage.centerXAnchor.constraint(equalTo: storyRingImage.centerXAnchor),
            profileImage.heightAnchor.constraint(equalToConstant: 54),
            profileImage.widthAnchor.constraint(equalToConstant: 54),
            
            nameLabel.topAnchor.constraint(equalTo: storyRingImage.bottomAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    public func setupData(story: Story) {
        // MARK: Profile Image
        profileImage.image = UIImage(named: "Profile Picture \(story.profileId)")
        
        // MARK: Name Label
        nameLabel.text = story.profileName
    }
}
