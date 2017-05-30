//
//  MeConfigurator.swift
//  CleanStore
//
//  Created by hoi on 30/5/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

final class MeConfigurator {


    // MARK: - Singleton

    static let sharedInstance: MeConfigurator = MeConfigurator()


    // MARK: - Configuration

    func configure(viewController: MeViewController) {

        let router = MeRouter(viewController: viewController)
        let presenter = MePresenter(output: viewController)
        let interactor = MeInteractor(output: presenter)

        viewController.output = interactor
        viewController.router = router
    }
}
