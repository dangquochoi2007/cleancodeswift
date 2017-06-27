//
//  LiveTVViewController.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol LiveTVViewControllerInput: LiveTVPresenterOutput {

}

protocol LiveTVViewControllerOutput {

    func doSomething()
}

final class LiveTVViewController: UIViewController {

    var output: LiveTVViewControllerOutput!
    var router: LiveTVRouterProtocol!


    // MARK: - Initializers

    init(configurator: LiveTVConfigurator = LiveTVConfigurator.sharedInstance) {

        super.init(nibName: nil, bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure()
    }


    // MARK: - Configurator

    private func configure(configurator: LiveTVConfigurator = LiveTVConfigurator.sharedInstance) {

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


// MARK: - LiveTVPresenterOutput

extension LiveTVViewController: LiveTVViewControllerInput {


    // MARK: - Display logic

    func displaySomething(viewModel: LiveTVViewModel) {

        // TODO: Update UI
    }
}
