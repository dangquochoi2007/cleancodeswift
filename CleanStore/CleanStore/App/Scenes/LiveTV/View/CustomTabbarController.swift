//
//  CustomTabbarController.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import Foundation
import UIKit


class CustomTabbarController: UITabBarController {
    
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
        tabBar.isTranslucent = false
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width: 1000, height: 0.5)
        topBorder.backgroundColor = UIColor(red: 229.0/255.0, green: 231.0/255.0, blue: 235.0/255.0, alpha: 1).cgColor
        tabBar.layer.addSublayer(topBorder)
        tabBar.clipsToBounds = true
    }
}
