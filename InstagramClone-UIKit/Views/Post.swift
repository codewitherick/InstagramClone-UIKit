//
//  Post.swift
//  InstagramClone-UIKit
//
//  Created by Erick Harris on 11/26/19.
//  Copyright © 2019 Erick Harris. All rights reserved.
//

struct Post: Equatable {
    
    var profileId: Int
    var profileName: String
    var contentId: Int
    var isLiked: Bool
    var likes: [String]
    var caption: String
    var comments: [String]
}
