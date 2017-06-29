//
//  MoviesDetailsConfigurator.swift
//  CleanStore
//
//  Created by hoi on 29/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

final class MoviesDetailsConfigurator {


    // MARK: - Singleton

    static let sharedInstance: MoviesDetailsConfigurator = MoviesDetailsConfigurator()


    // MARK: - Configuration

    func configure(viewController: MoviesDetailsViewController) {

        let router = MoviesDetailsRouter(viewController: viewController)
        let presenter = MoviesDetailsPresenter(output: viewController)
        let interactor = MoviesDetailsInteractor(output: presenter)

        viewController.output = interactor
        viewController.router = router
    }
}
