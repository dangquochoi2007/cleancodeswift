//
//  SignUpRouter.swift
//  CleanStore
//
//  Created by hoi on 16/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol SignUpRouterProtocol {

    weak var viewController: SignUpViewController? { get }

    func navigateToSomewhere()
}

final class SignUpRouter {

    weak var viewController: SignUpViewController?


    // MARK: - Initializers

    init(viewController: SignUpViewController?) {

        self.viewController = viewController
    }
}


// MARK: - SignUpRouterProtocol

extension SignUpRouter: SignUpRouterProtocol {


    // MARK: - Navigation

    func navigateToSomewhere() {

    }
}
