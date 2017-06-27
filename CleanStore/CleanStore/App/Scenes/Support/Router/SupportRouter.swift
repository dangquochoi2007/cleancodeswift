//
//  SupportRouter.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol SupportRouterProtocol {

    weak var viewController: SupportViewController? { get }

    func navigateToSomewhere()
}

final class SupportRouter {

    weak var viewController: SupportViewController?


    // MARK: - Initializers

    init(viewController: SupportViewController?) {

        self.viewController = viewController
    }
}


// MARK: - SupportRouterProtocol

extension SupportRouter: SupportRouterProtocol {


    // MARK: - Navigation

    func navigateToSomewhere() {

    }
}
