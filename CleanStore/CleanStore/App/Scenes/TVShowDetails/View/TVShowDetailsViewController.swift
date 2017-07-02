//
//  TVShowDetailsViewController.swift
//  CleanStore
//
//  Created by QuocHoi on 2/7/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol TVShowDetailsViewControllerInput: TVShowDetailsPresenterOutput {

}

protocol TVShowDetailsViewControllerOutput {

    func doSomething()
}

final class TVShowDetailsViewController: UIViewController {

    var output: TVShowDetailsViewControllerOutput!
    var router: TVShowDetailsRouterProtocol!


    // MARK: - Initializers

    init(configurator: TVShowDetailsConfigurator = TVShowDetailsConfigurator.sharedInstance) {

        super.init(nibName: nil, bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure()
    }


    // MARK: - Configurator

    private func configure(configurator: TVShowDetailsConfigurator = TVShowDetailsConfigurator.sharedInstance) {

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


// MARK: - TVShowDetailsPresenterOutput

extension TVShowDetailsViewController: TVShowDetailsViewControllerInput {


    // MARK: - Display logic

    func displaySomething(viewModel: TVShowDetailsViewModel) {

        // TODO: Update UI
    }
}
