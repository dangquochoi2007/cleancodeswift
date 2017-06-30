//
//  SVMenuOptionManager.swift
//  CleanStore
//
//  Created by hoi on 30/6/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import Foundation
import UIKit

enum SVMenuOptions {
    
    case LIVETV
    case MOVIES
    case TVSHOWS
    case WATCHLISTS
    
    var menuTitle: String {
        
        switch self {
        case .LIVETV:
            return "LIVE TV"
        case .MOVIES:
            return "MOVIES"
        case .TVSHOWS:
            return "TV SHOWS"
        case .WATCHLISTS:
            return "WATCHLIST"
        }
    }
    
    var menuIcon: String {
        switch self {
        case .LIVETV:
            return "airplay_ico"
        case .MOVIES:
            return "movie_ico"
        case .TVSHOWS:
            return "tvshow_ico"
        case .WATCHLISTS:
            return "watchlist_ico"
        }
    }
    
}