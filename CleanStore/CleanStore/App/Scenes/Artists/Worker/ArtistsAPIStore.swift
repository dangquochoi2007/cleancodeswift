//
//  ArtistsAPIStore.swift
//  CleanStore
//
//  Created by hoi on 31/5/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import Foundation
// MARK: - ArtistsAPIStore

/// _ArtistsAPIStore_ is a class responsible for fetching artists
final class ArtistsAPIStore {
    fileprivate struct Constants {
        static let topArtistsLimit = 50
        static let topArtistsDictionaryKey = "artists"
        static let topArtistsArrayKey = "artists"
    }
    
    fileprivate let networkClient: NetworkClientProtocol
    
    // MARK: - Initializers
    
    /// Initializes an instance of _ArtistsAPIStore_ with an object that conforms to the protocol _NetworkClientProtocol_
    ///
    /// - parameter networkClient: The object to be used to send requests to the API
    ///
    /// - returns: The instance of _ArtistsAPIStore_
    init(networkClient: NetworkClientProtocol = NetworkClient.sharedInstance) {
        self.networkClient = networkClient
    }
}



// MARK: - ArtistsStoreProtocol
extension ArtistsAPIStore: ArtistsStoreProtocol {
    
    /// Fetches a list of top artists
    ///
    /// - parameter completion: The completion block
    func fetchArtists(completion: @escaping ([Artist]?, Error?) -> ()) {
        let limit = Constants.topArtistsLimit
        guard let url = LastFMAPIEndPoint.getTopArtists(limit).url() else {
            completion([], ArtistsStoreError.invalidURL)
            return
        }
        
        let request = URLRequest.jsonRequest(url: url)
        
        networkClient.sendRequest(request: request) { data, response, error in
            
            var artists: [Artist]?
            var artistsError: Error?
            
            if let json = data?.jsonDictionary() {
                
                if let artistsDictionary = json[Constants.topArtistsDictionaryKey] as? [String: Any],
                let artistsArray = artistsDictionary[Constants.topArtistsArrayKey] as? [[String: Any]] {
                    
                    artists = artistsArray.flatMap { artistsDictionary -> Artist? in
                        
                        return Artist.fromJSON(json: artistsDictionary)
                    }
                    
                } else {
                
                    artistsError = ArtistsStoreError.invalidResponse
                    
                }
                
            } else {
                
                artistsError = ArtistsStoreError.invalidResponse
                
            }
            
            completion(artists, artistsError)
            
        }
    }
}
