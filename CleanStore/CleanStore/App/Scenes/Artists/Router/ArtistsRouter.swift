//
//  ArtistsRouter.swift
//  CleanStore
//
//  Created by hoi on 3/5/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol ArtistsRouterProtocol {

    weak var viewController: ArtistsViewController? { get }

    func navigateToSomewhere()
}

final class ArtistsRouter {

    weak var viewController: ArtistsViewController?


    // MARK: - Initializers

    init(viewController: ArtistsViewController?) {

        self.viewController = viewController
    }
}


// MARK: - ArtistsRouterProtocol

extension ArtistsRouter: ArtistsRouterProtocol {


    // MARK: - Navigation

    func navigateToSomewhere() {

    }
}
