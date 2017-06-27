//
//  WatchListsViewController.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol WatchListsViewControllerInput: WatchListsPresenterOutput {

}

protocol WatchListsViewControllerOutput {

    func doSomething()
}

final class WatchListsViewController: UIViewController {

    var output: WatchListsViewControllerOutput!
    var router: WatchListsRouterProtocol!


    // MARK: - Initializers

    init(configurator: WatchListsConfigurator = WatchListsConfigurator.sharedInstance) {

        super.init(nibName: nil, bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure()
    }


    // MARK: - Configurator

    private func configure(configurator: WatchListsConfigurator = WatchListsConfigurator.sharedInstance) {

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


// MARK: - WatchListsPresenterOutput

extension WatchListsViewController: WatchListsViewControllerInput {


    // MARK: - Display logic

    func displaySomething(viewModel: WatchListsViewModel) {

        // TODO: Update UI
    }
}
