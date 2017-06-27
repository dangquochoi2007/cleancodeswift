//
//  TVShowsConfigurator.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

final class TVShowsConfigurator {


    // MARK: - Singleton

    static let sharedInstance: TVShowsConfigurator = TVShowsConfigurator()


    // MARK: - Configuration

    func configure(viewController: TVShowsViewController) {

        let router = TVShowsRouter(viewController: viewController)
        let presenter = TVShowsPresenter(output: viewController)
        let interactor = TVShowsInteractor(output: presenter)

        viewController.output = interactor
        viewController.router = router
    }
}
