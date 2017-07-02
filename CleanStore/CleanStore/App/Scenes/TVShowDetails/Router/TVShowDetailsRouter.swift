//
//  TVShowDetailsRouter.swift
//  CleanStore
//
//  Created by QuocHoi on 2/7/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol TVShowDetailsRouterProtocol {

    weak var viewController: TVShowDetailsViewController? { get }

    func navigateToSomewhere()
}

final class TVShowDetailsRouter {

    weak var viewController: TVShowDetailsViewController?


    // MARK: - Initializers

    init(viewController: TVShowDetailsViewController?) {

        self.viewController = viewController
    }
}


// MARK: - TVShowDetailsRouterProtocol

extension TVShowDetailsRouter: TVShowDetailsRouterProtocol {


    // MARK: - Navigation

    func navigateToSomewhere() {

    }
}
