//
//  iBeaconReceiveConfigurator.swift
//  CleanStore
//
//  Created by QuocHoi on 9/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

final class iBeaconReceiveConfigurator {


    // MARK: - Singleton

    static let sharedInstance: iBeaconReceiveConfigurator = iBeaconReceiveConfigurator()


    // MARK: - Configuration

    func configure(viewController: iBeaconReceiveViewController) {

        let router = iBeaconReceiveRouter(viewController: viewController)
        let presenter = iBeaconReceivePresenter(output: viewController)
        let interactor = iBeaconReceiveInteractor(output: presenter)

        viewController.output = interactor
        viewController.router = router
    }
}
