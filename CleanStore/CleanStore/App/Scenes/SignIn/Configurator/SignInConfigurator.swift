//
//  SignInConfigurator.swift
//  CleanStore
//
//  Created by hoi on 16/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

final class SignInConfigurator {


    // MARK: - Singleton

    static let sharedInstance: SignInConfigurator = SignInConfigurator()


    // MARK: - Configuration

    func configure(viewController: SignInViewController) {

        let router = SignInRouter(viewController: viewController)
        let presenter = SignInPresenter(output: viewController)
        let interactor = SignInInteractor(output: presenter)

        viewController.output = interactor
        viewController.router = router
    }
}
