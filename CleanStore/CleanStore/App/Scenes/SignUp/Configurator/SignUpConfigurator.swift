//
//  SignUpConfigurator.swift
//  CleanStore
//
//  Created by hoi on 16/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

final class SignUpConfigurator {


    // MARK: - Singleton

    static let sharedInstance: SignUpConfigurator = SignUpConfigurator()


    // MARK: - Configuration

    func configure(viewController: SignUpViewController) {

        let router = SignUpRouter(viewController: viewController)
        let presenter = SignUpPresenter(output: viewController)
        let interactor = SignUpInteractor(output: presenter)

        viewController.output = interactor
        viewController.router = router
    }
}
