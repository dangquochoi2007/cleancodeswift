//
//  ImageManager.swift
//  CleanStore
//
//  Created by hoi on 1/6/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import UIKit


/// _ImageMemoryStore_ is an image store backed by an in-memory cache
class ImageManager {
    
    
    static let shareInstance = ImageManager()
    
    private let memoryStore = ImageMemoryStore()
    private let networkStore = ImageNetworkStore()
    
    var updateNetworkStatusActivityIndicator: Bool = true
    
    
    /// Loads an image from memory cache or the network if not cached
    ///
    /// - parameter url:        The image URL
    /// - parameter completion: The closure to trigger when the image has been loaded
    func loadImage(url: URL, completion: @escaping (UIImage?, Error?) -> ()) {
        
        memoryStore.loadImage(url: url) { [weak self] cachedImage, memoryStoreError in
            
            if let strongSelf = self {
                
            }
            
            
        }
        
    }
    
}
