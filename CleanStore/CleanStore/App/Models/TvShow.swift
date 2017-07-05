//
//  TvShow.swift
//  CleanStore
//
//  Created by hoi on 4/7/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import Foundation

struct TVShow {
    var poster: String
    var fanart: String
    var banner: String
    var plot: String
    var director: String
    var writer: String
    var tvdb: String
    var imdb: String
    var title: String
    var year: String
    var rating: String
    var genres: String
    var seasons: Season?
    
    
    struct Season {
        struct Last {
            var season: String
            var episode: String
            var released: String
            var title: String
            var plot: String
            var screenshot: String
        }
        
        struct Next {
            var season: Int
            var episole: Int
            var released: String
            var title: String
            var plot: String
        }
        
        
        var last: Last
        var next: Next
    }
    
    
}
