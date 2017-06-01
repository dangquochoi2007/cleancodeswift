//
//  ImageStoreProtocol.swift
//  CleanStore
//
//  Created by hoi on 1/6/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import UIKit

/// _ImageStoreProtocol_ is a protocol for image loading behaviours
protocol ImageStoreProtocol {
    
    /// Loads an image from the store given a URL
    ///
    /// - parameter url:        The URL of the image to load
    /// - parameter completion: The closure to trigger when the image loading completes
    func loadImage(url: URL, completion: @escaping (UIImage?, Error?) -> ())
}
