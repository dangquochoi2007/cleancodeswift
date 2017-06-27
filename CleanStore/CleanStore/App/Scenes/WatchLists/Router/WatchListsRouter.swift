//
//  WatchListsRouter.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol WatchListsRouterProtocol {

    weak var viewController: WatchListsViewController? { get }

    func navigateToSomewhere()
}

final class WatchListsRouter {

    weak var viewController: WatchListsViewController?


    // MARK: - Initializers

    init(viewController: WatchListsViewController?) {

        self.viewController = viewController
    }
}


// MARK: - WatchListsRouterProtocol

extension WatchListsRouter: WatchListsRouterProtocol {


    // MARK: - Navigation

    func navigateToSomewhere() {

    }
}
