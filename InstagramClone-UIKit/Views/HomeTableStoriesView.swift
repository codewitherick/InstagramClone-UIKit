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
    
    var storiesCollection: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        // MARK: Stories Collection
        let collectionLayout = UICollectionViewFlowLayout()
        storiesCollection = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        storiesCollection.translatesAutoresizingMaskIntoConstraints = false
        storiesCollection.delegate = self
        storiesCollection.dataSource = self
        storiesCollection.register(HomeTableStoriesCell.self, forCellWithReuseIdentifier: homeStoriesCellIdentifier)
        
        // MARK: View Hieracrhy
        addSubview(storiesCollection)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            storiesCollection.topAnchor.constraint(equalTo: topAnchor),
            storiesCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
            storiesCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
            storiesCollection.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

extension HomeTableStoriesView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .zero
    }
}
