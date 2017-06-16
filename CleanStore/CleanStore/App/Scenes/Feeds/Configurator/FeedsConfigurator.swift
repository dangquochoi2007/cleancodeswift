//
//  FeedsConfigurator.swift
//  CleanStore
//
//  Created by hoi on 16/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

final class FeedsConfigurator {


    // MARK: - Singleton

    static let sharedInstance: FeedsConfigurator = FeedsConfigurator()


    // MARK: - Configuration

    func configure(viewController: FeedsViewController) {

        let router = FeedsRouter(viewController: viewController)
        let presenter = FeedsPresenter(output: viewController)
        let interactor = FeedsInteractor(output: presenter)

        viewController.output = interactor
        viewController.router = router
    }
}
