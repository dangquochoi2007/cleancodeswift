//
//  Artist.swift
//  CleanStore
//
//  Created by hoi on 3/5/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import Foundation

struct Artist {
    let mbid: String
    let name: String
    let payCount: String
    let listenners: String
    let url: URL
    let imageURL: URL?
}



extension Artist {
    private struct Constants {
        static let mbidKey = "mbid"
        static let nameKey = "name"
        static let playCountKey = "playcount"
        static let listenersKey = "listeners"
        static let urlKey = "url"
        static let imageKey = "image"
        static let imageSizeKey = "size"
        static let imageSizeValue = "extralarge"
        static let imageURLKey = "#text"
    }
    
    
}
