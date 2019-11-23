//
//  HomeViewController.swift
//  InstagramClone-UIKit
//
//  Created by Erick Harris on 11/22/19.
//  Copyright © 2019 Erick Harris. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var logo: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

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
        let dmButton = UIBarButtonItem(image: UIImage(named: "dm"), style: .plain, target: self, action: #selector(dmButtonTapped))
        navigationItem.setRightBarButtonItems([dmButton, tvButton], animated: true)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logo.widthAnchor.constraint(equalTo: logo.heightAnchor, multiplier: 2.8),
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
