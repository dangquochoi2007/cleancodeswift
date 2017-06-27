//
//  MoviesConfigurator.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

final class MoviesConfigurator {


    // MARK: - Singleton

    static let sharedInstance: MoviesConfigurator = MoviesConfigurator()


    // MARK: - Configuration

    func configure(viewController: MoviesViewController) {

        let router = MoviesRouter(viewController: viewController)
        let presenter = MoviesPresenter(output: viewController)
        let interactor = MoviesInteractor(output: presenter)

        viewController.output = interactor
        viewController.router = router
    }
}
