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
}
