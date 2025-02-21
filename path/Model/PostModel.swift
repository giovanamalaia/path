//
//  PostData.swift
//  path
//
//  Created by Giovana Malaia on 20/02/25.
//

import Foundation

enum PostType {
    case song(Song)
    case place(Place)
    case person(Person)
}

struct PostNotification {
    static let newPost = Notification.Name("NewPostNotification")
}
