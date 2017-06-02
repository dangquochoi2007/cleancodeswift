//
//  API.swift
//  CleanStore
//
//  Created by hoi on 31/5/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import Foundation

// MARK: - LastFMAPI

/// _LastFMAPI_ is a struct responsible for general Last FM API configurations
struct LastFMAPI {
    static let baseURLString = "https://ws.audioscrobbler.com/2.0/"
    static let apiKey = "9a8c232060c525d0b24597e2cf83efe0"
}


// MARK: - URLConvertible

/// _URLConvertible_ is a protocol to implement urls
protocol URLConvertible {
    func url() -> URL?
}




// MARK: - LastFMAPIEndpoint

/// _LastFMAPIEndpoint_ is an enumeration of all Last FM types of API requests
///
/// - getTopArtists: The get top artists request
enum LastFMAPIEndPoint {
    case getTopArtists(Int)
    
    
}

// MARK: - URLConvertible

extension LastFMAPIEndPoint: URLConvertible {
    func url() -> URL? {
        switch self {
        case .getTopArtists(let limit):
            let method = "chart.gettopartists"
            return URL(string: "\(LastFMAPI.baseURLString)?method=\(method)&api_key=\(LastFMAPI.apiKey)&format=json&limit=\(limit)")
        }
    }
    
    var httpMethod: String {
        switch self {
        case .getTopArtists:
            return "POST"
        }
    }
}
