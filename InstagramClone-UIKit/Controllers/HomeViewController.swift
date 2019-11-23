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
        logo = UIImageView(image: UIImage(named: "logo"))
        logo.translatesAutoresizingMaskIntoConstraints = false
        navigationItem.titleView = logo
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logo.widthAnchor.constraint(equalTo: logo.heightAnchor, multiplier: 2.8),
        ])
    }

}
