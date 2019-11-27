//
//  HomeTableStoriesView.swift
//  InstagramClone-UIKit
//
//  Created by Erick Harris on 11/26/19.
//  Copyright © 2019 Erick Harris. All rights reserved.
//

import UIKit

class HomeTableStoriesView: UIView {

    let homeStoriesCellIdentifier = "homeStoriesCell"
    
    var stories: [Story] = [] {
        didSet {
            storiesCollection.reloadData()
        }
    }
    
    var storiesCollection: UICollectionView!
    var separator: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        
        stories = getStories()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        // MARK: Stories Collection
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        
        storiesCollection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        storiesCollection.translatesAutoresizingMaskIntoConstraints = false
        storiesCollection.delegate = self
        storiesCollection.dataSource = self
        storiesCollection.register(HomeTableStoriesCell.self, forCellWithReuseIdentifier: homeStoriesCellIdentifier)
        storiesCollection.backgroundColor = .white
        storiesCollection.showsHorizontalScrollIndicator = false
        storiesCollection.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        // MARK: Separator
        separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        
        // MARK: View Hieracrhy
        addSubview(storiesCollection)
        addSubview(separator)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            storiesCollection.topAnchor.constraint(equalTo: topAnchor),
            storiesCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
            storiesCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
            storiesCollection.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            separator.leadingAnchor.constraint(equalTo: leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor),
            separator.bottomAnchor.constraint(equalTo: bottomAnchor),
            separator.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
    
    private func getStories() -> [Story] {
        
        let story1 = Story(profileId: 1, profileName: "lisa_ray")
        let story2 = Story(profileId: 2, profileName: "tedminkle")
        let story3 = Story(profileId: 3, profileName: "casey_trulia11")
        let story4 = Story(profileId: 4, profileName: "jackmurry")
        let story5 = Story(profileId: 5, profileName: "collingram91")
        let story6 = Story(profileId: 6, profileName: "jake_mars")
        let story7 = Story(profileId: 7, profileName: "kellybittersworth")
        let story8 = Story(profileId: 8, profileName: "alexgray")
        let story9 = Story(profileId: 9, profileName: "kevinfong")
        let story10 = Story(profileId: 10, profileName: "arminvanhunt")
        
        return [story1, story2, story3, story4, story5, story6, story7, story8, story9, story10]
    }
}

extension HomeTableStoriesView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: homeStoriesCellIdentifier, for: indexPath) as! HomeTableStoriesCell
        cell.setupData(story: stories[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 100)
    }
}
