//
//  CustomTabbarController.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import Foundation
import UIKit


class CustomTabbarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let liveTVController = LiveTVViewController()
        let navigationController = UINavigationController(rootViewController: liveTVController)
        navigationController.title = "LIVE TV"
        navigationController.tabBarItem.image = UIImage(named: "news_feed_icon")
        
        let moviesController = MoviesViewController()
        let secondNavigationController = UINavigationController(rootViewController: moviesController)
        secondNavigationController.title = "MOVIES"
        secondNavigationController.tabBarItem.image = UIImage(named: "requests_icon")
        
        let tvShowsController = TVShowsViewController()
        let tvShowsNavigationController = UINavigationController(rootViewController: tvShowsController)
        tvShowsNavigationController.title = "TV SHOWS"
        tvShowsNavigationController.tabBarItem.image = UIImage(named: "messenger_icon")
        
        let watchListsController = WatchListsViewController()
        let watchListNavigationController = UINavigationController(rootViewController: watchListsController)
        watchListNavigationController.title = "WATCHLIST"
        watchListNavigationController.tabBarItem.image = UIImage(named: "globe_icon")
        
        viewControllers = [navigationController ,secondNavigationController, tvShowsNavigationController, watchListNavigationController]
    }
}
