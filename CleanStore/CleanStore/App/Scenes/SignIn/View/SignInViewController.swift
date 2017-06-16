//
//  SignInViewController.swift
//  CleanStore
// Organic Farm
//  Created by hoi on 16/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol SignInViewControllerInput: SignInPresenterOutput {

}

protocol SignInViewControllerOutput {

    func doSomething()
}

final class SignInViewController: UIViewController {

    var output: SignInViewControllerOutput!
    var router: SignInRouterProtocol!


    // MARK: - Initializers

    init(configurator: SignInConfigurator = SignInConfigurator.sharedInstance) {

        super.init(nibName: "SignInViewController", bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure()
    }


    // MARK: - Configurator

    private func configure(configurator: SignInConfigurator = SignInConfigurator.sharedInstance) {

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


// MARK: - SignInPresenterOutput

extension SignInViewController: SignInViewControllerInput {


    // MARK: - Display logic

    func displaySomething(viewModel: SignInViewModel) {

        // TODO: Update UI
    }
}
