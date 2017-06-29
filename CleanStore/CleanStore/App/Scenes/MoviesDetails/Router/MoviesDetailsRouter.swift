//
//  MoviesDetailsRouter.swift
//  CleanStore
//
//  Created by hoi on 29/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol MoviesDetailsRouterProtocol {

    weak var viewController: MoviesDetailsViewController? { get }

    func navigateToSomewhere()
}

final class MoviesDetailsRouter {

    weak var viewController: MoviesDetailsViewController?


    // MARK: - Initializers

    init(viewController: MoviesDetailsViewController?) {

        self.viewController = viewController
    }
}


// MARK: - MoviesDetailsRouterProtocol

extension MoviesDetailsRouter: MoviesDetailsRouterProtocol {


    // MARK: - Navigation

    func navigateToSomewhere() {

    }
}
