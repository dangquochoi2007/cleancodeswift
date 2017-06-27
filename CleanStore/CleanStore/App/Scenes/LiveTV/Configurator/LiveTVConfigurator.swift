//
//  LiveTVConfigurator.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

final class LiveTVConfigurator {


    // MARK: - Singleton

    static let sharedInstance: LiveTVConfigurator = LiveTVConfigurator()


    // MARK: - Configuration

    func configure(viewController: LiveTVViewController) {

        let router = LiveTVRouter(viewController: viewController)
        let presenter = LiveTVPresenter(output: viewController)
        let interactor = LiveTVInteractor(output: presenter)

        viewController.output = interactor
        viewController.router = router
    }
}
