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
    
    var posts: [Post] = [] {
        didSet {
            homeTable.reloadData()
        }
    }
    
    var logo: UIImageView!
    var homeTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
        
        posts = getPosts()
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
    
    // Item Store
    private func getPosts() -> [Post] {
        
        let post1 = Post(profileId: 1, profileName: "lisa_ray", contentId: 1, isLiked: false, likes: ["John Wreck", "Tobias Free", "Johnny Monroe"], caption: "Fun at the lake", comments: [])
        let post2 = Post(profileId: 2, profileName: "tedminkle", contentId: 2, isLiked: false, likes: ["John Wreck", "Tobias Free", "Johnny Monroe"], caption: "Fun at the lake", comments: [])
        let post3 = Post(profileId: 3, profileName: "casey_trulia11", contentId: 3, isLiked: false, likes: ["John Wreck", "Tobias Free", "Johnny Monroe"], caption: "Fun at the lake", comments: [])
        let post4 = Post(profileId: 4, profileName: "jackmurry", contentId: 4, isLiked: false, likes: ["John Wreck", "Tobias Free", "Johnny Monroe"], caption: "Fun at the lake", comments: [])
        let post5 = Post(profileId: 5, profileName: "collingram91", contentId: 5, isLiked: false, likes: ["John Wreck", "Tobias Free", "Johnny Monroe"], caption: "Fun at the lake", comments: [])
        let post6 = Post(profileId: 6, profileName: "jake_mars", contentId: 6, isLiked: false, likes: ["John Wreck", "Tobias Free", "Johnny Monroe"], caption: "Fun at the lake", comments: [])
        let post7 = Post(profileId: 7, profileName: "kellybittersworth", contentId: 7, isLiked: false, likes: ["John Wreck", "Tobias Free", "Johnny Monroe"], caption: "Fun at the lake", comments: [])
        let post8 = Post(profileId: 8, profileName: "alexgray", contentId: 8, isLiked: false, likes: ["John Wreck", "Tobias Free", "Johnny Monroe"], caption: "Fun at the lake", comments: [])
        let post9 = Post(profileId: 9, profileName: "kevinfong", contentId: 9, isLiked: false, likes: ["John Wreck", "Tobias Free", "Johnny Monroe"], caption: "Fun at the lake", comments: [])
        let post10 = Post(profileId: 10, profileName: "arminvanhunt", contentId: 10, isLiked: false, likes: ["John Wreck", "Tobias Free", "Johnny Monroe"], caption: "Fun at the lake", comments: [])
        
        return [post1, post2, post3, post4, post5, post6, post7, post8, post9, post10]
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: homeCellIdentifier) as! HomeTableCell
        cell.postDelegate = self
        cell.setupData(post: posts[indexPath.row])
        return cell
    }
}

extension HomeViewController: PostDelegate {
    func didLikePost(likedPost: Post) {
        for (index, post) in posts.enumerated() {
            if post == likedPost {
                posts[index].isLiked = true
            }
        }
    }
    
    func didUnlikePost(unlikedPost: Post) {
        for (index, post) in posts.enumerated() {
            if post == unlikedPost {
                posts[index].isLiked = true
            }
        }
    }
}
