//
//  SupportViewController.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol SupportViewControllerInput: SupportPresenterOutput {

}

protocol SupportViewControllerOutput {

    func doSomething()
}

final class SupportViewController: UIViewController {

    var output: SupportViewControllerOutput!
    var router: SupportRouterProtocol!


    // MARK: - Initializers

    init(configurator: SupportConfigurator = SupportConfigurator.sharedInstance) {

        super.init(nibName: nil, bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure()
    }


    // MARK: - Configurator

    private func configure(configurator: SupportConfigurator = SupportConfigurator.sharedInstance) {

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


// MARK: - SupportPresenterOutput

extension SupportViewController: SupportViewControllerInput {


    // MARK: - Display logic

    func displaySomething(viewModel: SupportViewModel) {

        // TODO: Update UI
    }
}
