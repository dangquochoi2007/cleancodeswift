//
//  TouchTVShowsConfigurator.swift
//  CleanStore
//
//  Created by QuocHoi on 2/7/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

final class TouchTVShowsConfigurator {


    // MARK: - Singleton

    static let sharedInstance: TouchTVShowsConfigurator = TouchTVShowsConfigurator()


    // MARK: - Configuration

    func configure(viewController: TouchTVShowsViewController) {

        let router = TouchTVShowsRouter(viewController: viewController)
        let presenter = TouchTVShowsPresenter(output: viewController)
        let interactor = TouchTVShowsInteractor(output: presenter)

        viewController.output = interactor
        viewController.router = router
    }
}
