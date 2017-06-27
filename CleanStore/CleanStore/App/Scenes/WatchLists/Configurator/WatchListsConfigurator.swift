//
//  WatchListsConfigurator.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

final class WatchListsConfigurator {


    // MARK: - Singleton

    static let sharedInstance: WatchListsConfigurator = WatchListsConfigurator()


    // MARK: - Configuration

    func configure(viewController: WatchListsViewController) {

        let router = WatchListsRouter(viewController: viewController)
        let presenter = WatchListsPresenter(output: viewController)
        let interactor = WatchListsInteractor(output: presenter)

        viewController.output = interactor
        viewController.router = router
    }
}
