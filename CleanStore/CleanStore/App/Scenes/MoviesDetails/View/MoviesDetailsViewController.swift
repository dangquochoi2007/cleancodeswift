//
//  MoviesDetailsViewController.swift
//  CleanStore
//
//  Created by hoi on 29/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol MoviesDetailsViewControllerInput: MoviesDetailsPresenterOutput {

}

protocol MoviesDetailsViewControllerOutput {

    func doSomething()
}

final class MoviesDetailsViewController: UIViewController {

    var output: MoviesDetailsViewControllerOutput!
    var router: MoviesDetailsRouterProtocol!


    // MARK: - Initializers

    init(configurator: MoviesDetailsConfigurator = MoviesDetailsConfigurator.sharedInstance) {

        super.init(nibName: nil, bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure()
    }


    // MARK: - Configurator

    private func configure(configurator: MoviesDetailsConfigurator = MoviesDetailsConfigurator.sharedInstance) {

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


// MARK: - MoviesDetailsPresenterOutput

extension MoviesDetailsViewController: MoviesDetailsViewControllerInput {


    // MARK: - Display logic

    func displaySomething(viewModel: MoviesDetailsViewModel) {

        // TODO: Update UI
    }
}
