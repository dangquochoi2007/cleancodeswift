//
//  FeedsViewController.swift
//  CleanStore
//
//  Created by hoi on 16/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol FeedsViewControllerInput: FeedsPresenterOutput {

}

protocol FeedsViewControllerOutput {

    func doSomething()
}

final class FeedsViewController: UIViewController {

    var output: FeedsViewControllerOutput!
    var router: FeedsRouterProtocol!


    // MARK: - Initializers

    init(configurator: FeedsConfigurator = FeedsConfigurator.sharedInstance) {

        super.init(nibName: nil, bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure()
    }


    // MARK: - Configurator

    private func configure(configurator: FeedsConfigurator = FeedsConfigurator.sharedInstance) {

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


// MARK: - FeedsPresenterOutput

extension FeedsViewController: FeedsViewControllerInput {


    // MARK: - Display logic

    func displaySomething(viewModel: FeedsViewModel) {

        // TODO: Update UI
    }
}
