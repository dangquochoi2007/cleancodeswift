//
//  FeedsPresenter.swift
//  CleanStore
//
//  Created by hoi on 16/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol FeedsPresenterInput: FeedsInteractorOutput {

}

protocol FeedsPresenterOutput: class {

    func displaySomething(viewModel: FeedsViewModel)
}

final class FeedsPresenter {

    private(set) weak var output: FeedsPresenterOutput!


    // MARK: - Initializers

    init(output: FeedsPresenterOutput) {

        self.output = output
    }
}


// MARK: - FeedsPresenterInput

extension FeedsPresenter: FeedsPresenterInput {


    // MARK: - Presentation logic

    func presentSomething() {

        // TODO: Format the response from the Interactor and pass the result back to the View Controller

        let viewModel = FeedsViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
