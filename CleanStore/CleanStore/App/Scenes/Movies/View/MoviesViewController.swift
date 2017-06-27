//
//  MoviesViewController.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol MoviesViewControllerInput: MoviesPresenterOutput {

}

protocol MoviesViewControllerOutput {

    func doSomething()
}

final class MoviesViewController: UIViewController {

    var output: MoviesViewControllerOutput!
    var router: MoviesRouterProtocol!


    // MARK: - Initializers

    init(configurator: MoviesConfigurator = MoviesConfigurator.sharedInstance) {

        super.init(nibName: nil, bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure()
    }


    // MARK: - Configurator

    private func configure(configurator: MoviesConfigurator = MoviesConfigurator.sharedInstance) {

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


// MARK: - MoviesPresenterOutput

extension MoviesViewController: MoviesViewControllerInput {


    // MARK: - Display logic

    func displaySomething(viewModel: MoviesViewModel) {

        // TODO: Update UI
    }
}
