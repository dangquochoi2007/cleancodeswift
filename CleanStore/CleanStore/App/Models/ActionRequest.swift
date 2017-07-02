//
//  ActionRequest.swift
//  CleanStore
//
//  Created by QuocHoi on 1/7/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import Foundation


enum TouchMovieAction {
    
    case AddtoWatchList
    case PlayLastTrailer
    case ShowLastEpisode
    case ShowAllDetails
    case ShowTVShowDetails
    
    
    var touchMovieAction: String {
        switch self {
        case .AddtoWatchList:
            return "ADD TO WATCHLIST"
        case .PlayLastTrailer:
            return "PLAY LAST TRAILER"
        case .ShowLastEpisode:
            return "SHOW LAST EPISODE"
        case .ShowAllDetails:
            return "SHOW ALL DETAILS"
        case .ShowTVShowDetails:
            return "SHOW ALL DETAILS"
        }
    }
    
    var touchMovieIcon: String {
        switch self {
        case .AddtoWatchList:
            return "watchlist_ico"
        case .PlayLastTrailer:
            return "play_ico"
        case .ShowLastEpisode:
            return "episode_ico"
        case .ShowAllDetails:
            return "movie_ico"
        case .ShowTVShowDetails:
            return "tvshow_ico"
        }
    }
    
}
