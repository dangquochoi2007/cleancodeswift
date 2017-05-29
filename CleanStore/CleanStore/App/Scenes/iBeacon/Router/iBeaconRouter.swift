//
//  iBeaconRouter.swift
//  CleanStore
//
//  Created by hoi on 29/5/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol iBeaconRouterProtocol {

    weak var viewController: iBeaconViewController? { get }

    func navigateToSomewhere()
}

final class iBeaconRouter {

    weak var viewController: iBeaconViewController?


    // MARK: - Initializers

    init(viewController: iBeaconViewController?) {

        self.viewController = viewController
    }
}


// MARK: - iBeaconRouterProtocol

extension iBeaconRouter: iBeaconRouterProtocol {


    // MARK: - Navigation

    func navigateToSomewhere() {

    }
}
