//
//  HomeViewController.swift
//  InstagramClone-UIKit
//
//  Created by Erick Harris on 11/22/19.
//  Copyright © 2019 Erick Harris. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let homeCellIdentifier = "homeCell"
    
    var postStore: PostStore!
    
    var logo: UIImageView!
    var homeTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        postStore = PostStore()

        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        
        // MARK: NavBar
        let cameraButton = UIBarButtonItem(image: UIImage(named: "camera"), style: .plain, target: self, action: #selector(cameraButtonTapped))
        navigationItem.setLeftBarButton(cameraButton, animated: true)
        
        logo = UIImageView(image: UIImage(named: "logo"))
        logo.translatesAutoresizingMaskIntoConstraints = false
        navigationItem.titleView = logo
        
        let tvButton = UIBarButtonItem(image: UIImage(named: "tv"), style: .plain, target: self, action: #selector(tvButtonTapped))
        tvButton.imageInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        let dmButton = UIBarButtonItem(image: UIImage(named: "dm"), style: .plain, target: self, action: #selector(dmButtonTapped))
        navigationItem.setRightBarButtonItems([dmButton, tvButton], animated: true)
        
        // MARK: Home Table
        homeTable = UITableView(frame: .zero)
        homeTable.translatesAutoresizingMaskIntoConstraints = false
        homeTable.delegate = self
        homeTable.dataSource = self
        homeTable.register(HomeTableCell.self, forCellReuseIdentifier: homeCellIdentifier)
        homeTable.tableHeaderView = HomeTableStoriesView(frame: CGRect(x: 0, y: 0, width: homeTable.frame.width, height: 100))
        homeTable.tableFooterView = UIView()
        homeTable.separatorStyle = .none
        
        // MARK: View Hierarchy
        view.addSubview(homeTable)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logo.widthAnchor.constraint(equalTo: logo.heightAnchor, multiplier: 2.8),
            
            homeTable.topAnchor.constraint(equalTo: view.topAnchor),
            homeTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    // MARK: NavBar Selectors
    @objc func cameraButtonTapped() {
        
    }
    
    @objc func tvButtonTapped() {
        
    }
    
    @objc func dmButtonTapped() {
        
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postStore.allPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: homeCellIdentifier) as! HomeTableCell
        cell.postDelegate = self
        cell.setupData(post: postStore.allPosts[indexPath.row])
        return cell
    }
}

extension HomeViewController: PostDelegate {
    func didLikePost(likedPost: Post) {
        postStore.likePost(post: likedPost)
    }
    
    func didUnlikePost(unlikedPost: Post) {
        postStore.unlikePost(post: unlikedPost)
    }
    
    func didTapActions(post: Post) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.view.tintColor = .black
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {_ in})
        alert.addAction(cancelAction)
        
        let reportAction = UIAlertAction(title: "Report", style: .destructive, handler: {_ in})
        alert.addAction(reportAction)
        
        let muteAction = UIAlertAction(title: "Mute", style: .default, handler: {_ in})
        alert.addAction(muteAction)
        
        let unfollowAction = UIAlertAction(title: "Unfollow", style: .default, handler: {_ in})
        alert.addAction(unfollowAction)
        
        let copyAction = UIAlertAction(title: "Copy Link", style: .default, handler: {_ in})
        alert.addAction(copyAction)
        
        let shareAction = UIAlertAction(title: "Share to...", style: .default, handler: {_ in})
        alert.addAction(shareAction)
        
        let notificationsAction = UIAlertAction(title: "Turn On Post Notifications", style: .default, handler: {_ in})
        alert.addAction(notificationsAction)
        
        present(alert, animated: true)
    }
}
