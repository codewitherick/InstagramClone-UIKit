//
//  Post.swift
//  InstagramClone-UIKit
//
//  Created by Erick Harris on 11/26/19.
//  Copyright © 2019 Erick Harris. All rights reserved.
//

class Post: Equatable {

    var profileId: Int
    var profileName: String
    var contentId: Int
    var isLiked: Bool
    var likes: [String]
    var caption: String
    var comments: [String]
    
    init(profileId: Int, profileName: String, contentId: Int, isLiked: Bool, likes: [String], caption: String, comments: [String]) {
        self.profileId = profileId
        self.profileName = profileName
        self.contentId = contentId
        self.isLiked = isLiked
        self.likes = likes
        self.caption = caption
        self.comments = comments
    }
    
    static func == (lhs: Post, rhs: Post) -> Bool {
        if lhs.profileId == rhs.profileId {
            return true
        }
        else {
            return false
        }
    }
}

class PostStore {
    
    var allPosts: [Post] = []
    
    init() {
        self.allPosts = getAllPosts()
    }
    
    func getAllPosts() -> [Post] {
        
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
    
    func getIndexFor(post toFind: Post) -> Int? {
        for (index, post) in allPosts.enumerated() {
            if post == toFind {
                return index
            }
        }
        
        return nil
    }
    
    func likePost(post: Post) {
        if let index = getIndexFor(post: post) {
            allPosts[index].isLiked = true
        }
    }
    
    func unlikePost(post: Post) {
        if let index = getIndexFor(post: post) {
            allPosts[index].isLiked = false
        }
    }
}
