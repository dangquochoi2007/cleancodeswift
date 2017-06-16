//
//  SignUpViewController.swift
//  CleanStore
//
//  Created by hoi on 16/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol SignUpViewControllerInput: SignUpPresenterOutput {

}

protocol SignUpViewControllerOutput {

    func doSomething()
}

final class SignUpViewController: UIViewController {

    var output: SignUpViewControllerOutput!
    var router: SignUpRouterProtocol!


    // MARK: - Initializers

    init(configurator: SignUpConfigurator = SignUpConfigurator.sharedInstance) {

        super.init(nibName: nil, bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure()
    }


    // MARK: - Configurator

    private func configure(configurator: SignUpConfigurator = SignUpConfigurator.sharedInstance) {

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


// MARK: - SignUpPresenterOutput

extension SignUpViewController: SignUpViewControllerInput {


    // MARK: - Display logic

    func displaySomething(viewModel: SignUpViewModel) {

        // TODO: Update UI
    }
}
