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
        navigationController.title = SVMenuOptions.LIVETV.menuTitle
        navigationController.tabBarItem.image = UIImage(named: SVMenuOptions.LIVETV.menuIcon)

        
        let moviesController = MoviesViewController()
        let secondNavigationController = UINavigationController(rootViewController: moviesController)
        secondNavigationController.title = SVMenuOptions.MOVIES.menuTitle
        secondNavigationController.tabBarItem.image = UIImage(named: SVMenuOptions.MOVIES.menuIcon)
        
        let tvShowsController = TVShowsViewController()
        let tvShowsNavigationController = UINavigationController(rootViewController: tvShowsController)
        tvShowsNavigationController.title = SVMenuOptions.TVSHOWS.menuTitle
        tvShowsNavigationController.tabBarItem.image = UIImage(named: SVMenuOptions.TVSHOWS.menuIcon)
        
        let watchListsController = WatchListsViewController()
        let watchListNavigationController = UINavigationController(rootViewController: watchListsController)
        watchListNavigationController.title = SVMenuOptions.WATCHLISTS.menuTitle
        watchListNavigationController.tabBarItem.image = UIImage(named: SVMenuOptions.WATCHLISTS.menuIcon)
        
        viewControllers = [navigationController ,secondNavigationController, tvShowsNavigationController, watchListNavigationController]
       
     
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("tabBarController")
    }
}
