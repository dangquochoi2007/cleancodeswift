//
//  TouchMovieViewModel.swift
//  CleanStore
//
//  Created by hoi on 29/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

enum TouchMovieAction {
    
    case AddtoWatchList
    case PlayLastTrailer
    case ShowAllDetails
    
    
    var touchMovieAction: String {
        switch self {
        case .AddtoWatchList:
            return "ADD TO WATCHLIST"
        case .PlayLastTrailer:
            return "PLAY LAST TRAILER"
        case .ShowAllDetails:
            return "SHOW ALL DETAILS"
        }
    }
    
    var touchMovieIcon: String {
        switch self {
        case .AddtoWatchList:
            return "watchlist_ico"
        case .PlayLastTrailer:
            return "play_ico"
        case .ShowAllDetails:
            return "movie_ico"
        }
    }
    
}
struct TouchMovieViewModel {

}
