//
//  MoviesDetailsPresenter.swift
//  CleanStore
//
//  Created by hoi on 29/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol MoviesDetailsPresenterInput: MoviesDetailsInteractorOutput {

}

protocol MoviesDetailsPresenterOutput: class {

    func displaySomething(viewModel: MoviesDetailsViewModel)
}

final class MoviesDetailsPresenter {

    private(set) weak var output: MoviesDetailsPresenterOutput!


    // MARK: - Initializers

    init(output: MoviesDetailsPresenterOutput) {

        self.output = output
    }
}


// MARK: - MoviesDetailsPresenterInput

extension MoviesDetailsPresenter: MoviesDetailsPresenterInput {


    // MARK: - Presentation logic

    func presentSomething() {

        // TODO: Format the response from the Interactor and pass the result back to the View Controller

        let viewModel = MoviesDetailsViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
