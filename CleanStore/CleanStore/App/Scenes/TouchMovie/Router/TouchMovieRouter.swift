//
//  TouchMovieRouter.swift
//  CleanStore
//
//  Created by hoi on 29/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol TouchMovieRouterProtocol {

    weak var viewController: TouchMovieViewController? { get }

    func navigateToSomewhere()
    func dismissViewController()
    func navigateToMoviesDetailsViewController()
}

final class TouchMovieRouter {

    weak var viewController: TouchMovieViewController?


    // MARK: - Initializers

    init(viewController: TouchMovieViewController?) {

        self.viewController = viewController
    }
}


// MARK: - TouchMovieRouterProtocol

extension TouchMovieRouter: TouchMovieRouterProtocol {


    // MARK: - Navigation

    func navigateToSomewhere() {

    }
    
    func dismissViewController() {
        self.viewController?.dismiss(animated: true, completion: nil)
    }
    
    
    func navigateToMoviesDetailsViewController() {
        let movieDetailViewController = MoviesDetailsViewController()
        viewController?.present(movieDetailViewController, animated: true, completion: nil)
    }
}
