//
//  FeedsRouter.swift
//  CleanStore
//
//  Created by hoi on 16/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol FeedsRouterProtocol {

    weak var viewController: FeedsViewController? { get }

    func navigateToSomewhere()
}

final class FeedsRouter {

    weak var viewController: FeedsViewController?


    // MARK: - Initializers

    init(viewController: FeedsViewController?) {

        self.viewController = viewController
    }
}


// MARK: - FeedsRouterProtocol

extension FeedsRouter: FeedsRouterProtocol {


    // MARK: - Navigation

    func navigateToSomewhere() {

    }
}
