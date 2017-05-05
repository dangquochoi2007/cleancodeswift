//
//  Album.swift
//  CleanStore
//
//  Created by hoi on 3/5/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import Foundation


struct Album {
    let mbid: String
    let name: String
    let url: URL
    let imageURL: URL?
}


extension Album {
    private struct Constants {
        static let mbidKey = "mbid"
        static let nameKey = "name"
        static let urlKey = "url"
        static let imageKey = "image"
        static let imageSizeKey = "size"
        static let imageSizeValue = "large"
        static let imageURLKey = "#text"
    }
}
