//
//  TouchMovieViewController.swift
//  CleanStore
//
//  Created by hoi on 29/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol TouchMovieViewControllerInput: TouchMoviePresenterOutput {

}

protocol TouchMovieViewControllerOutput {

    func doSomething()
}

final class TouchMovieViewController: UIViewController {

    var output: TouchMovieViewControllerOutput!
    var router: TouchMovieRouterProtocol!


    // MARK: - Initializers

    init(configurator: TouchMovieConfigurator = TouchMovieConfigurator.sharedInstance) {

        super.init(nibName: nil, bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure()
    }


    // MARK: - Configurator

    private func configure(configurator: TouchMovieConfigurator = TouchMovieConfigurator.sharedInstance) {

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


// MARK: - TouchMoviePresenterOutput

extension TouchMovieViewController: TouchMovieViewControllerInput {


    // MARK: - Display logic

    func displaySomething(viewModel: TouchMovieViewModel) {

        // TODO: Update UI
    }
}
