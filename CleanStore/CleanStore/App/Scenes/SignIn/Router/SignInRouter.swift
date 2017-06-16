//
//  SignInRouter.swift
//  CleanStore
//
//  Created by hoi on 16/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol SignInRouterProtocol {

    weak var viewController: SignInViewController? { get }

    func navigateToSomewhere()
}

final class SignInRouter {

    weak var viewController: SignInViewController?


    // MARK: - Initializers

    init(viewController: SignInViewController?) {

        self.viewController = viewController
    }
}


// MARK: - SignInRouterProtocol

extension SignInRouter: SignInRouterProtocol {


    // MARK: - Navigation

    func navigateToSomewhere() {

    }
}
