//
//  ProfileSettingsConfigurator.swift
//  CleanStore
//
//  Created by hoi on 16/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

final class ProfileSettingsConfigurator {


    // MARK: - Singleton

    static let sharedInstance: ProfileSettingsConfigurator = ProfileSettingsConfigurator()


    // MARK: - Configuration

    func configure(viewController: ProfileSettingsViewController) {

        let router = ProfileSettingsRouter(viewController: viewController)
        let presenter = ProfileSettingsPresenter(output: viewController)
        let interactor = ProfileSettingsInteractor(output: presenter)

        viewController.output = interactor
        viewController.router = router
    }
}
