//
//  iBeaconConfigurator.swift
//  CleanStore
//
//  Created by hoi on 29/5/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

final class iBeaconConfigurator {


    // MARK: - Singleton

    static let sharedInstance: iBeaconConfigurator = iBeaconConfigurator()


    // MARK: - Configuration

    func configure(viewController: iBeaconViewController) {

        let router = iBeaconRouter(viewController: viewController)
        let presenter = iBeaconPresenter(output: viewController)
        let interactor = iBeaconInteractor(output: presenter)

        viewController.output = interactor
        viewController.router = router
    }
}
