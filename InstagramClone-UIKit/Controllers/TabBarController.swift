//
//  TabBarController.swift
//  InstagramClone-UIKit
//
//  Created by Erick Harris on 11/22/19.
//  Copyright © 2019 Erick Harris. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    private func setupViews() {
        
        let homeViewController = HomeViewController()
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "home"), selectedImage: UIImage(named: "home-filled"))
        
        let searchViewController = SearchViewController()
        let searchNavigationController = UINavigationController(rootViewController: searchViewController)
        searchViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "search"), selectedImage: UIImage(named: "search-filled"))
        
        let postViewController = PostViewController()
        let postNavigationController = UINavigationController(rootViewController: postViewController)
        postViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "post"), selectedImage: UIImage(named: "post-filled"))
        
        let activityViewController = ActivityViewController()
        let activityNavigationController = UINavigationController(rootViewController: activityViewController)
        activityViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "heart"), selectedImage: UIImage(named: "heart-filled"))
        
        let profileViewController = ProfileViewController()
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        profileViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "profile"), selectedImage: UIImage(named: "profile-filled"))
        
        viewControllers = [homeNavigationController, searchNavigationController, postNavigationController, activityNavigationController, profileNavigationController]
    }
}
