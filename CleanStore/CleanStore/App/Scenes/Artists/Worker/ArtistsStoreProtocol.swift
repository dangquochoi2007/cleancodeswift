//
//  ArtistsStoreProtocol.swift
//  CleanStore
//
//  Created by hoi on 31/5/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import Foundation
// MARK: - ArtistsStoreError

/// _ArtistsStoreError_ is an enumeration for artist store errors
///
/// - generic:         Generic error
/// - invalidURL:      Invalid URL error
/// - invalidResponse: Invalid response
enum ArtistsStoreError: Error {
    case generic
    case invalidURL
    case invalidResponse
}

// MARK: - ArtistsStoreProtocol

/// _ArtistsStoreProtocol_ is a protocol  for artist store behaviors
protocol ArtistsStoreProtocol {
    
    /// Fetches artists from a store (API, memory, etc)
    ///
    /// - parameter completion: The completion block
    func fetchArtists(completion: @escaping ([Artist]?, Error?) -> ())
}
