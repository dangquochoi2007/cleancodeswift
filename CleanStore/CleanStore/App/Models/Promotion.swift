//
//  Promotion.swift
//  CleanStore
//
//  Created by hoi on 31/5/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import Foundation


struct Promotion {
    let mbid: String
    let name: String
    let playCount: String
    let listeners: String
    let url: URL
    let imageURL: URL?
}


extension Promotion {
    
    private struct Constants {
        static let mbidKey = "mbid"
        static let nameKey = "name"
        static let playCountKey = "playcount"
        static let listenersKey = "listeners"
        static let urlKey = "url"
        static let imageKey = "image"
        static let imageSizeKey = "size"
        
    }
}


