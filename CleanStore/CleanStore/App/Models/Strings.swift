//
//  Strings.swift
//  CleanStore
//
//  Created by hoi on 3/5/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import Foundation

struct Strings {
    struct Artists {
        
        static let screenTitle = NSLocalizedString("Top Artists", comment: "Top Artists screen title")
    }
    
    struct Artist {
        
        static let screenTitle = NSLocalizedString("Artist", comment: "Artist screen title")
        static let albumsTitle = NSLocalizedString("Top Albums", comment: "Artist header title")
    }
    
    struct Error {
        
        static let genericTitle = NSLocalizedString("Sorry", comment: "Generic error title")
        static let genericMessage = NSLocalizedstring("Something went wrong", comment: "Generic error message")
        static let okButtonTitle = NSLocalizedString("Ok", comment: "Alert button title")
    }
}
