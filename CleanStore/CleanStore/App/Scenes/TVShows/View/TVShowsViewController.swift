//
//  TVShowsViewController.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol TVShowsViewControllerInput: TVShowsPresenterOutput {

}

protocol TVShowsViewControllerOutput {

    func doSomething()
}

final class TVShowsViewController: UIViewController {

    var output: TVShowsViewControllerOutput!
    var router: TVShowsRouterProtocol!


    // MARK: - Initializers

    init(configurator: TVShowsConfigurator = TVShowsConfigurator.sharedInstance) {

        super.init(nibName: nil, bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure()
    }


    // MARK: - Configurator

    private func configure(configurator: TVShowsConfigurator = TVShowsConfigurator.sharedInstance) {

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


// MARK: - TVShowsPresenterOutput

extension TVShowsViewController: TVShowsViewControllerInput {


    // MARK: - Display logic

    func displaySomething(viewModel: TVShowsViewModel) {

        // TODO: Update UI
    }
}
