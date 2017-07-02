//
//  TouchTVShowsRouter.swift
//  CleanStore
//
//  Created by QuocHoi on 2/7/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol TouchTVShowsRouterProtocol {

    weak var viewController: TouchTVShowsViewController? { get }

    func navigateToSomewhere()
    func dismissViewController()
    func navigationTVShowDetailsViewController()
}

final class TouchTVShowsRouter {

    weak var viewController: TouchTVShowsViewController?


    // MARK: - Initializers

    init(viewController: TouchTVShowsViewController?) {

        self.viewController = viewController
    }
}


// MARK: - TouchTVShowsRouterProtocol

extension TouchTVShowsRouter: TouchTVShowsRouterProtocol {


    // MARK: - Navigation

    func navigateToSomewhere() {

    }
    
    func navigationTVShowDetailsViewController() {
        let tvshowViewController = TVShowDetailsViewController()
        viewController?.present(tvshowViewController, animated: true, completion: nil)
    }
    
    func dismissViewController() {
        viewController?.dismiss(animated: true, completion: nil)
    }
}
