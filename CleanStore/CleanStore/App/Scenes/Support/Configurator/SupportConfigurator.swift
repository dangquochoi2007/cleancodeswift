//
//  SupportConfigurator.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

final class SupportConfigurator {


    // MARK: - Singleton

    static let sharedInstance: SupportConfigurator = SupportConfigurator()


    // MARK: - Configuration

    func configure(viewController: SupportViewController) {

        let router = SupportRouter(viewController: viewController)
        let presenter = SupportPresenter(output: viewController)
        let interactor = SupportInteractor(output: presenter)

        viewController.output = interactor
        viewController.router = router
    }
}
