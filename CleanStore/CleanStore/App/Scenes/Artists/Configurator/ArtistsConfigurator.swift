//
//  ArtistsConfigurator.swift
//  CleanStore
//
//  Created by hoi on 3/5/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

final class ArtistsConfigurator {


    // MARK: - Singleton

    static let sharedInstance: ArtistsConfigurator = ArtistsConfigurator()


    // MARK: - Configuration

    func configure(viewController: ArtistsViewController) {

        let router = ArtistsRouter(viewController: viewController)
        let presenter = ArtistsPresenter(output: viewController)
        let interactor = ArtistsInteractor(output: presenter)

        viewController.output = interactor
        viewController.router = router
    }
}
