//
//  MeRouter.swift
//  CleanStore
//
//  Created by hoi on 30/5/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol MeRouterProtocol {

    weak var viewController: MeViewController? { get }

    func navigateToSomewhere()
}

final class MeRouter {

    weak var viewController: MeViewController?


    // MARK: - Initializers

    init(viewController: MeViewController?) {

        self.viewController = viewController
    }
}


// MARK: - MeRouterProtocol

extension MeRouter: MeRouterProtocol {


    // MARK: - Navigation

    func navigateToSomewhere() {

    }
}
