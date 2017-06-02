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
    let playCount: String
    let listenners: String
    let url: URL
    let imageURL: URL?
}



extension Artist: Parsable {
    
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
    
    
    static func fromJSON(json: [String : Any]) -> Artist? {
        
        if let mbid = json[Constants.mbidKey] as? String,
            let name = json[Constants.nameKey] as? String,
            let playCount = json[Constants.playCountKey] as? String,
            let listeners = json[Constants.listenersKey] as? String,
            let urlString = json[Constants.urlKey] as? String,
            let url = URL(string: urlString) {
            
            var imageURL: URL?
            if let imagesArray = json[Constants.imageKey] as? [[String: Any]] {
                
                let imageURLs = imagesArray.flatMap { (imageDictionary) -> URL? in
                    if let imageSize = imageDictionary[Constants.imageSizeKey] as? String,
                    imageSize == Constants.imageSizeValue,
                    let imageURLString = imageDictionary[Constants.imageURLKey] as? String {
                        return URL(string: imageURLString)
                    }
                    return nil
                }
                
                imageURL = imageURLs.first
            }
            return Artist(mbid: mbid, name: name, playCount: playCount, listenners: listeners, url: url, imageURL: imageURL)
        }
        return nil
    }
    
}
