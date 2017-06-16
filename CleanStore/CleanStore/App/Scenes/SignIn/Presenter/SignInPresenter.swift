//
//  SignInPresenter.swift
//  CleanStore
//
//  Created by hoi on 16/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol SignInPresenterInput: SignInInteractorOutput {

}

protocol SignInPresenterOutput: class {

    func displaySomething(viewModel: SignInViewModel)
}

final class SignInPresenter {

    private(set) weak var output: SignInPresenterOutput!


    // MARK: - Initializers

    init(output: SignInPresenterOutput) {

        self.output = output
    }
}


// MARK: - SignInPresenterInput

extension SignInPresenter: SignInPresenterInput {


    // MARK: - Presentation logic

    func presentSomething() {

        // TODO: Format the response from the Interactor and pass the result back to the View Controller

        let viewModel = SignInViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
