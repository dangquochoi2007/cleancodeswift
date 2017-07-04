//
//  ProfileSettingsViewController.swift
//  CleanStore
//
//  Created by hoi on 16/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol ProfileSettingsViewControllerInput: ProfileSettingsPresenterOutput {

}

protocol ProfileSettingsViewControllerOutput {

    func doSomething()
}

final class ProfileSettingsViewController: UIViewController {

    var output: ProfileSettingsViewControllerOutput!
    var router: ProfileSettingsRouterProtocol!

    @IBOutlet weak var profileSettingTableView: UITableView!

    // MARK: - Initializers

    init(configurator: ProfileSettingsConfigurator = ProfileSettingsConfigurator.sharedInstance) {

        super.init(nibName: nil, bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure()
    }


    // MARK: - Configurator

    private func configure(configurator: ProfileSettingsConfigurator = ProfileSettingsConfigurator.sharedInstance) {

        configurator.configure(viewController: self)
    }


    // MARK: - View lifecycle

    override func viewDidLoad() {

        super.viewDidLoad()

        doSomethingOnLoad()
    }


    // MARK: - Load data

    func doSomethingOnLoad() {

        // TODO: Ask the Interactor to do some work

        output.doSomething()
    }
}


// MARK: - ProfileSettingsPresenterOutput

extension ProfileSettingsViewController: ProfileSettingsViewControllerInput {


    // MARK: - Display logic

    func displaySomething(viewModel: ProfileSettingsViewModel) {

        // TODO: Update UI
    }
}
