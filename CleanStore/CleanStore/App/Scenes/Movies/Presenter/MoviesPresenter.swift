//
//  MoviesPresenter.swift
//  CleanStore
//
//  Created by hoi on 27/6/17.
//  Copyright (c) 2017 hoi. All rights reserved.
//

import UIKit

protocol MoviesPresenterInput: MoviesInteractorOutput {

}

protocol MoviesPresenterOutput: class {

    func displaySomething(viewModel: MoviesViewModel)
}

final class MoviesPresenter {

    private(set) weak var output: MoviesPresenterOutput!


    // MARK: - Initializers

    init(output: MoviesPresenterOutput) {

        self.output = output
    }
}


// MARK: - MoviesPresenterInput

extension MoviesPresenter: MoviesPresenterInput {


    // MARK: - Presentation logic

    func presentSomething() {

        // TODO: Format the response from the Interactor and pass the result back to the View Controller

        let viewModel = MoviesViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
