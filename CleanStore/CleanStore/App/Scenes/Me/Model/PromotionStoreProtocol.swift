//
//  PromotionStoreProtocol.swift
//  CleanStore
//
//  Created by hoi on 31/5/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import Foundation


// MARK: - ArtistsStoreError

enum PromotionStoreError: Error {
    case generic
    case invalidURL
    case invalidResponse
}


// MARK: - ArtistsStoreProtocol

protocol PromotionStoreProtocol {
    
    /// Fetches artists from a store (API, memory, etc)
    ///
    /// - parameter completion: The completion block
    func fetchPromotion(completion: @escaping ([Promotion]?, Error?) -> ())
}
