//
//  ArtistsWorker.swift
//  CleanStore
//
//  Created by hoi on 3/5/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

class ArtistsWorker {

    fileprivate var store: ArtistsStoreProtocol

    
    // MARK: - Initializers
    
    /// Initializes an _ArtistsWorker_ with a store
    ///
    /// - parameter store: A store where to fetch artists from (API, memory, etc)
    ///
    /// - returns: The instance of _ArtistsWorker_
    init(store: ArtistsStoreProtocol = ArtistsAPIStore()) {
        
        self.store = store
    }

    // MARK: - Business Logic
    
    /// Fetches artists from a store
    ///
    /// - parameter completion: The completion block
    func fetchArtists(request: ArtistsViewModel.FetchArtists.Request ,completion: @escaping ([Artist]?, Error?) -> ()) {
        
        store.fetchArtists(request: request, completion: completion)
    }
}
