//
//  iBeaconReceiveRouter.swift
//  CleanStore
//
//  Created by QuocHoi on 9/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol iBeaconReceiveRouterProtocol {

    weak var viewController: iBeaconReceiveViewController? { get }

    func navigateToSomewhere()
}

final class iBeaconReceiveRouter {

    weak var viewController: iBeaconReceiveViewController?


    // MARK: - Initializers

    init(viewController: iBeaconReceiveViewController?) {

        self.viewController = viewController
    }
}


// MARK: - iBeaconReceiveRouterProtocol

extension iBeaconReceiveRouter: iBeaconReceiveRouterProtocol {


    // MARK: - Navigation

    func navigateToSomewhere() {

    }
}
