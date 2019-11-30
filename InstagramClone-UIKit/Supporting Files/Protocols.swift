//
//  Protocols.swift
//  InstagramClone-UIKit
//
//  Created by Erick Harris on 11/29/19.
//  Copyright © 2019 Erick Harris. All rights reserved.
//

import Foundation

protocol PostDelegate {
    func didLikePost(likedPost: Post)
    func didUnlikePost(unlikedPost: Post)
    func didTapActions(post: Post)
}
