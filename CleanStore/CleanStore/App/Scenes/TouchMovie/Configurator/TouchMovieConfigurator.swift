//
//  TouchMovieConfigurator.swift
//  CleanStore
//
//  Created by hoi on 29/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

final class TouchMovieConfigurator {


    // MARK: - Singleton

    static let sharedInstance: TouchMovieConfigurator = TouchMovieConfigurator()


    // MARK: - Configuration

    func configure(viewController: TouchMovieViewController) {

        let router = TouchMovieRouter(viewController: viewController)
        let presenter = TouchMoviePresenter(output: viewController)
        let interactor = TouchMovieInteractor(output: presenter)

        viewController.output = interactor
        viewController.router = router
    }
}
