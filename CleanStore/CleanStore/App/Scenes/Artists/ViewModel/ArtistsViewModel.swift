//
//  ArtistsViewModel.swift
//  CleanStore
//
//  Created by hoi on 3/5/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

struct ArtistsViewModel {
    
    struct FetchArtists {
        
        struct Request {
            
            var topArtistsLimit = 100
            var topArtistsDictionaryKey = "artists"
            var topArtistsArrayKey = "artist"
        }
        
        struct Response {
            
            var artists: [Artist]
        }
        
        struct ViewModel {
            
            struct DisplayedArtist {
                var title: String
                var imageURL: URL?
            }
            
            var displayedArtists: [DisplayedArtist]
        }
    }
}
