//
//  ProfileSettingsRouter.swift
//  CleanStore
//
//  Created by hoi on 16/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol ProfileSettingsRouterProtocol {

    weak var viewController: ProfileSettingsViewController? { get }

    func navigateToSomewhere()
}

final class ProfileSettingsRouter {

    weak var viewController: ProfileSettingsViewController?


    // MARK: - Initializers

    init(viewController: ProfileSettingsViewController?) {

        self.viewController = viewController
    }
}


// MARK: - ProfileSettingsRouterProtocol

extension ProfileSettingsRouter: ProfileSettingsRouterProtocol {


    // MARK: - Navigation

    func navigateToSomewhere() {

    }
}
