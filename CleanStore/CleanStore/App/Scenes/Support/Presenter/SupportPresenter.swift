//
//  SupportPresenter.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol SupportPresenterInput: SupportInteractorOutput {

}

protocol SupportPresenterOutput: class {

    func displaySomething(viewModel: SupportViewModel)
}

final class SupportPresenter {

    private(set) weak var output: SupportPresenterOutput!


    // MARK: - Initializers

    init(output: SupportPresenterOutput) {

        self.output = output
    }
}


// MARK: - SupportPresenterInput

extension SupportPresenter: SupportPresenterInput {


    // MARK: - Presentation logic

    func presentSomething() {

        // TODO: Format the response from the Interactor and pass the result back to the View Controller

        let viewModel = SupportViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
