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
    
    var logo: UIImageView!
    var homeTable: UITableView!

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
        
        // MARK: Home Table
        homeTable = UITableView(frame: .zero)
        homeTable.translatesAutoresizingMaskIntoConstraints = false
        homeTable.delegate = self
        homeTable.dataSource = self
        homeTable.register(HomeTableCell.self, forCellReuseIdentifier: homeCellIdentifier)
        homeTable.tableHeaderView = HomeTableStoriesView(frame: CGRect(x: 0, y: 0, width: homeTable.frame.width, height: 75))
        
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
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
