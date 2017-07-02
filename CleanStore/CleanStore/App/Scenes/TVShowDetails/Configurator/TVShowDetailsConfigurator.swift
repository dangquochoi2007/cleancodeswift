//
//  TVShowDetailsConfigurator.swift
//  CleanStore
//
//  Created by QuocHoi on 2/7/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

final class TVShowDetailsConfigurator {


    // MARK: - Singleton

    static let sharedInstance: TVShowDetailsConfigurator = TVShowDetailsConfigurator()


    // MARK: - Configuration

    func configure(viewController: TVShowDetailsViewController) {

        let router = TVShowDetailsRouter(viewController: viewController)
        let presenter = TVShowDetailsPresenter(output: viewController)
        let interactor = TVShowDetailsInteractor(output: presenter)

        viewController.output = interactor
        viewController.router = router
    }
}
