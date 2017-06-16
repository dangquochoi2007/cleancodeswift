//
//  SignUpPresenter.swift
//  CleanStore
//
//  Created by hoi on 16/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol SignUpPresenterInput: SignUpInteractorOutput {

}

protocol SignUpPresenterOutput: class {

    func displaySomething(viewModel: SignUpViewModel)
}

final class SignUpPresenter {

    private(set) weak var output: SignUpPresenterOutput!


    // MARK: - Initializers

    init(output: SignUpPresenterOutput) {

        self.output = output
    }
}


// MARK: - SignUpPresenterInput

extension SignUpPresenter: SignUpPresenterInput {


    // MARK: - Presentation logic

    func presentSomething() {

        // TODO: Format the response from the Interactor and pass the result back to the View Controller

        let viewModel = SignUpViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
