//
//  ActionRequest.swift
//  CleanStore
//
//  Created by QuocHoi on 1/7/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import Foundation


enum TouchMovieAction {
    
    case LIVETV
    case MOVIES
    case TVSHOWS
    case WATCHLISTS
    case PROFILE
    case LOGOUT
    
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
        case .LIVETV:
            return "LIVE TV"
        case .MOVIES:
            return "MOVIES"
        case .TVSHOWS:
            return "TV SHOWS"
        case .WATCHLISTS:
            return "WATCHLIST"
        case .PROFILE:
            return "PROFILE"
        case .LOGOUT:
            return "LOGOUT"
            
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
            
        case .LIVETV:
            return "airplay_ico"
        case .MOVIES:
            return "movie_ico"
        case .TVSHOWS:
            return "tvshow_ico"
        case .WATCHLISTS:
            return "watchlist_ico"
        case .PROFILE:
            return "profil_ico"
        case .LOGOUT:
            return "profil_ico"
        }
    }
    
}
