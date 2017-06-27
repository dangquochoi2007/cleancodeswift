//
//  LiveTVRouter.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol LiveTVRouterProtocol {

    weak var viewController: LiveTVViewController? { get }

    func navigateToSomewhere()
}

final class LiveTVRouter {

    weak var viewController: LiveTVViewController?


    // MARK: - Initializers

    init(viewController: LiveTVViewController?) {

        self.viewController = viewController
    }
}


// MARK: - LiveTVRouterProtocol

extension LiveTVRouter: LiveTVRouterProtocol {


    // MARK: - Navigation

    func navigateToSomewhere() {

    }
}
